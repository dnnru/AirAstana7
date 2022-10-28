#region

using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Caching;
using System.Web.Compilation;
using AirAstana.Themes.AirAstana7.Components.Models;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Data;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Entities.Tabs;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using DotNetNuke.UI;
using DotNetNuke.Web.DDRMenu;
using Newtonsoft.Json;

#endregion

namespace AirAstana.Themes.AirAstana7.Components
{
    public static class Utils
    {
        public static string CurrentIp
        {
            get
            {
                string ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (!string.IsNullOrEmpty(ip))
                {
                    return ip;
                }

                ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                if (ip == "::1")
                {
                    ip = "127.0.0.1";
                }

                return ip;
            }
        }

        public static MenuNode GetMenuNodes(PortalSettings portalSettings)
        {
            MenuNode menuNode =
                new MenuNode(Navigation.GetNavigationNodes("AirAstana_Themes_AirAstana7_MenuNodes", Navigation.ToolTipSource.None, -1, -1, GetNavNodeOptions(false)));

            return new MenuNode(((INodeManipulator)Activator.CreateInstance(BuildManager.GetType(Constants.NODE_MANIPULATOR, throwOnError: true, ignoreCase: true)))
                               .ManipulateNodes(menuNode.Children, portalSettings));
        }

        public static string GetMenuNodesJson(PortalSettings portalSettings)
        {
            return JsonConvert.SerializeObject(GetMenuNodes(portalSettings),
                                               Formatting.None,
                                               new JsonSerializerSettings
                                               {
                                                   ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                                               });
        }

        public static MenuNode GetMobileMenuNodes(PortalSettings portalSettings)
        {
            MenuNode menuNode =
                new MenuNode(Navigation.GetNavigationNodes("AirAstana_Themes_AirAstana7_MobileMenuNodes", Navigation.ToolTipSource.None, -1, -1, GetNavNodeOptions(false)));

            return new MenuNode(((INodeManipulator)Activator.CreateInstance(BuildManager.GetType(Constants.MOBILE_NODE_MANIPULATOR, throwOnError: true, ignoreCase: true)))
                               .ManipulateNodes(menuNode.Children, portalSettings));
        }

        public static string GetMobileMenuNodesJson(PortalSettings portalSettings)
        {
            return JsonConvert.SerializeObject(GetMobileMenuNodes(portalSettings),
                                               Formatting.None,
                                               new JsonSerializerSettings
                                               {
                                                   ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                                               });
        }

        private static int GetNavNodeOptions(bool includeHidden)
        {
            return 5 + (includeHidden ? 16 : 0);
        }

        public static string GetPortalAliasWithLang(int portalId, string langCode)
        {
            return $"{GetPrimaryPortalUrl(portalId)}/{langCode.ToLower()}";
        }

        public static string GetPrimaryPortalUrl(int portalId)
        {
            string url = "";
            List<string[]> chunksList = PortalAliasController.Instance.GetPortalAliasesByPortalId(portalId)
                                                             .Select(portalAliasInfo => portalAliasInfo.HTTPAlias.Split(new[] { '/' }, StringSplitOptions.RemoveEmptyEntries))
                                                             .ToList();
            string[] chunks = chunksList.FirstOrDefault(ch => ch.Length >= 2) ?? chunksList.FirstOrDefault();
            if (chunks != null)
            {
                url = chunks.Length >= 2 ? $"{chunks[0]}/{chunks[1]}" : $"{chunks[0]}";
            }

            return url;
        }

        public static int GetCurrentPortalId()
        {
            return PortalController.Instance.GetCurrentPortalSettings().PortalId;
        }

        public static string GetCurrentCulture()
        {
            return Thread.CurrentThread.CurrentCulture.Name;
        }

        public static string ConstructCurrentUrl(string relativePath)
        {
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrWhiteSpace(relativePath))
            {
                relativePath = "/#";
            }

            string primaryPortalUrl = GetPortalAliasWithLang(GetCurrentPortalId(), GetCurrentCulture());
            stringBuilder.Append(primaryPortalUrl);

            if (!relativePath.StartsWith("/"))
            {
                stringBuilder.Append("/");
            }

            stringBuilder.Append(relativePath);
            return Globals.AddHTTP(stringBuilder.ToString());
        }

        public static string GetHomeTabUrl(PortalSettings currentPortalSettings)
        {
            return currentPortalSettings.HomeTabId != -1 ? Globals.NavigateURL(currentPortalSettings.HomeTabId) : Globals.AddHTTP(currentPortalSettings.PortalAlias.HTTPAlias);
        }

        public static string GetAllPortalLocalesJson(PortalSettings currentPortalSettings)
        {
            return JsonConvert.SerializeObject(GetAllPortalLocales(currentPortalSettings));
        }

        public static List<PortalLocales> GetAllPortalLocales(PortalSettings currentPortalSettings)
        {
            List<PortalLocales> portalLocales = new List<PortalLocales>();
            foreach (PortalInfo portalInfo in PortalController.Instance.GetPortals().Cast<PortalInfo>())
            {
                string portalName = GetPortalName(GetCurrentCulture(), portalInfo.PortalID);
                string localizedPortalName = string.IsNullOrWhiteSpace(portalName) ? portalInfo.PortalName : portalName;

                PortalLocales locales = new PortalLocales
                                        {
                                            PortalId = portalInfo.PortalID,
                                            PortalName = localizedPortalName,
                                            IsCurrent = portalInfo.PortalID == currentPortalSettings.PortalId
                                        };

                foreach (Locale locale in LocaleController.Instance.GetLocales(portalInfo.PortalID).Values)
                {
                    string defaultTranslatorRoles = PortalController.GetPortalSetting($"DefaultTranslatorRoles-{locale.Code}", currentPortalSettings.PortalId, "Administrators");
                    if (!currentPortalSettings.ContentLocalizationEnabled
                     || locale.IsPublished
                     || PortalSecurity.IsInRoles(currentPortalSettings.AdministratorRoleName)
                     || PortalSecurity.IsInRoles(defaultTranslatorRoles))
                    {
                        TabInfo localizedTab = portalInfo.PortalID == currentPortalSettings.PortalId
                                                   ? GetLocalizedTab(GetCurrentTabForLocalization(currentPortalSettings), locale)
                                                   : null;

                        AirAstanaLocale portalLocale = new AirAstanaLocale
                                                       {
                                                           PortalId = portalInfo.PortalID,
                                                           CultureCode = locale.Code,
                                                           CultureName = Localization.GetLocaleName(locale.Code, CultureDropDownTypes.NativeName),
                                                           IsActive = portalInfo.PortalID == currentPortalSettings.PortalId
                                                                   && CultureInfo.CurrentCulture.Name == locale.Code,
                                                           Url = localizedTab != null
                                                                     ? FixAliasLang(Globals.NavigateURL(localizedTab.TabID), locale.Code)
                                                                     : Globals.AddHTTP(GetPortalAliasWithLang(portalInfo.PortalID, locale.Code))
                                                       };
                        int idx = portalLocale.CultureName.IndexOf("(", StringComparison.InvariantCultureIgnoreCase);
                        if (idx > 0)
                        {
                            portalLocale.CultureName = portalLocale.CultureName.Substring(0, idx);
                        }

                        locales.Locales.Add(portalLocale);
                    }
                }

                portalLocales.Add(locales);
            }

            return portalLocales;
        }

        private static string FixAliasLang(string alias, string lang)
        {
            if (string.IsNullOrWhiteSpace(lang))
            {
                return alias;
            }

            if (alias.EndsWith("/"))
            {
                alias = alias.Substring(0, alias.Length - 1);
            }

            string currentLang = "";
            string[] chunks = alias.Trim().Split(new[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            List<string> allCultures = GetAllCultureCodesCached();
            foreach (string chunk in chunks)
            {
                if (allCultures.Contains(chunk.ToLower()))
                {
                    currentLang = chunk;
                    break;
                }
            }

            return string.IsNullOrWhiteSpace(currentLang) ? alias : alias.Replace(currentLang, lang.ToLower());
        }

        private static TabInfo GetCurrentTabForLocalization(PortalSettings portalSettings)
        {
            TabInfo tabInfo = portalSettings.ActiveTab;
            if (tabInfo.DefaultLanguageTab != null)
            {
                tabInfo = tabInfo.DefaultLanguageTab;
            }

            return tabInfo;
        }

        private static TabInfo GetLocalizedTab(TabInfo tab, Locale locale)
        {
            return tab == null ? null : TabController.Instance.GetTabByCulture(tab.TabID, tab.PortalID, locale);
        }

        private static List<string> GetAllCultureCodesCached()
        {
            string cacheKey = "AirAstana7-CultureTypes-AllCultures";
            return DataCache.GetCachedData<List<string>>(new CacheItemArgs(cacheKey, CacheItemPriority.NotRemovable),
                                                         _ => CultureInfo.GetCultures(CultureTypes.AllCultures)
                                                                         .Where(c => c.Name.IndexOf("-", StringComparison.Ordinal) > 0)
                                                                         .Select(c => c.Name.ToLower())
                                                                         .ToList());
        }

        public static List<PortalMenuLinks> GetPortalMenuLinksCached(int portalId)
        {
            string cacheKey = $"AirAstana7-PortalMenuLinks-Portal:{portalId}";
            return DataCache.GetCachedData<List<PortalMenuLinks>>(new CacheItemArgs(cacheKey, CacheItemPriority.Default),
                                                                  args =>
                                                                  {
                                                                      string file = HttpContext.Current.Server.MapPath(Constants.PORTAL_MENU_LINKS_PATH);
                                                                      if (File.Exists(file))
                                                                      {
                                                                          try
                                                                          {
                                                                              return JsonConvert.DeserializeObject<List<PortalMenuLinks>>(File.ReadAllText(file))
                                                                                               ?.Where(l => l.PortalId == portalId)
                                                                                                .ToList();
                                                                          }
                                                                          catch (Exception e)
                                                                          {
                                                                              Exceptions.LogException(e);
                                                                          }
                                                                      }

                                                                      return new List<PortalMenuLinks>();
                                                                  });
        }

        public static List<PortalMenuLinks> GetPortalMenuLinksAllCached()
        {
            string cacheKey = $"AirAstana7-PortalMenuLinks-All";
            return DataCache.GetCachedData<List<PortalMenuLinks>>(new CacheItemArgs(cacheKey, CacheItemPriority.Default),
                                                                  args =>
                                                                  {
                                                                      string file = HttpContext.Current.Server.MapPath(Constants.PORTAL_MENU_LINKS_PATH);
                                                                      if (File.Exists(file))
                                                                      {
                                                                          try
                                                                          {
                                                                              return JsonConvert.DeserializeObject<List<PortalMenuLinks>>(File.ReadAllText(file)).ToList();
                                                                          }
                                                                          catch (Exception e)
                                                                          {
                                                                              Exceptions.LogException(e);
                                                                          }
                                                                      }

                                                                      return new List<PortalMenuLinks>();
                                                                  });
        }

        public static List<int> GetDisabledPortalsIds()
        {
            return GetPortalMenuLinksAllCached().Where(pml => pml.Disabled).Select(p => p.PortalId).ToList();
        }

        public static MenuNode FindNodeByTabId(IEnumerable<MenuNode> nodes, int tabId)
        {
            return nodes.Select(node => node.FindById(tabId)).FirstOrDefault(parentNode => parentNode != null);
        }

        public static void FilterHiddenNodes(MenuNode parentNode, int portalId)
        {
            List<MenuNode> filteredNodes = new List<MenuNode>();
            filteredNodes.AddRange(parentNode.Children.FindAll(n =>
                                                               {
                                                                   TabInfo tab = TabController.Instance.GetTab(n.TabId, portalId);
                                                                   return tab == null || !tab.IsVisible;
                                                               }));

            parentNode.Children.RemoveAll(n => filteredNodes.Contains(n));
            parentNode.Children.ForEach(n => FilterHiddenNodes(n, portalId));
        }

        public static string GetPortalName(string lang, int portalId)
        {
            using (IDataContext dataContext = DataContext.Instance())
            {
                try
                {
                    PortalLocalizations portalLocalizations = dataContext.GetRepository<PortalLocalizations>()
                                                                         .Get()
                                                                         .FirstOrDefault(p => p.Culture.ToLower().Trim() == lang.ToLower().Trim() && p.PortalId == portalId);
                    if (portalLocalizations != null && portalLocalizations.Disabled)
                    {
                        return "---";
                    }

                    return portalLocalizations?.Title;
                }
                catch (Exception e)
                {
                    Exceptions.LogException(e);
                    return null;
                }
            }
        }

        public static string GetPortalRootName()
        {
            string primaryPortalUrl = GetPrimaryPortalUrl(GetCurrentPortalId());
            return primaryPortalUrl.Substring(primaryPortalUrl.LastIndexOf('/') + 1);
        }

        public static string GetCurrentLanguageNameForDxb()
        {
            string text = Thread.CurrentThread.CurrentCulture.TwoLetterISOLanguageName.ToLowerInvariant();
            switch (text)
            {
                case "kk":
                    return "kazakh";

                case "ru":
                    return "russian";

                default:
                    return "english";
            }
        }

        public static string GetCurrentAmadeusLanguageCode()
        {
            string[] array = new[] { "GB", "RU", "DE", "TK", "US", "FR", "KO", "CN" };
            string[] array2 = new[] { "EN", "RU", "DE", "TR", "KK", "FR", "KO", "ZH" };
            string value = GetCurrentLanguageCode().ToUpper();
            int num = Array.IndexOf(array2, value);
            if (num > -1 && num < array2.Length)
            {
                return array[num];
            }

            return array[0];
        }

        public static string GetCurrentLanguageCode()
        {
            return Thread.CurrentThread.CurrentCulture.TwoLetterISOLanguageName;
        }
    }
}