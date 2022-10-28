#region

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using AirAstana.Dnn.Components.IPGeolocation;
using AirAstana.Themes.AirAstana7.Components;
using AirAstana.Themes.AirAstana7.Components.Models;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.UI.Skins;

#endregion

namespace AirAstana.Themes.AirAstana7.SkinObjects
{
    public class LanguageSelect : SkinObjectBase
    {
        private static readonly string LanguageCookieName = "PL";
        protected DropDownList ddlPortals;
        protected PlaceHolder pnlLanguageSelect;
        protected Repeater rptLanguageItems;

        protected void Page_Init(object sender, EventArgs e)
        {
            string region = "global";
            string currentLang = "en-US";
            try
            {
                List<int> disabledPortalsIds = Utils.GetDisabledPortalsIds();
                if (disabledPortalsIds.Contains(PortalSettings.PortalId))
                {
                    string lang = Utils.GetCurrentCulture();
                    if (lang.Equals("ru-ru", StringComparison.OrdinalIgnoreCase))
                    {
                        currentLang = lang;
                    }
                    
                    string url = $"{Request.Url.Scheme}://{Request.Url.Host}/{region}/{currentLang}";
                    Response.Redirect(url, true);
                }
                
                List<AirAstanaLocale> portalLocales = new List<AirAstanaLocale>();
                List<PortalLocales> locales = Utils.GetAllPortalLocales(PortalSettings);
                foreach (PortalLocales locale in locales.Where(l => !disabledPortalsIds.Contains(l.PortalId)))
                {
                    ListItem listItem = new ListItem
                    {
                        Text = locale.PortalName,
                        Value = locale.PortalId.ToString(),
                        Selected = locale.PortalId == PortalSettings.PortalId
                    };

                    ddlPortals.Items.Add(listItem);

                    portalLocales.AddRange(locale.Locales);
                }

                rptLanguageItems.DataSource = portalLocales;
                rptLanguageItems.DataBind();
            }
            catch (Exception exception)
            {
                Exceptions.LogException(exception);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                return;
            }
            /*
            try
            {
                List<AirAstanaLocale> portalLocales = new List<AirAstanaLocale>();
                List<PortalLocales> locales = Utils.GetAllPortalLocales(PortalSettings);
                foreach (PortalLocales locale in locales)
                {
                    ListItem listItem = new ListItem
                                        {
                                            Text = locale.PortalName,
                                            Value = locale.PortalId.ToString(),
                                            Selected = locale.PortalId == PortalSettings.PortalId
                                        };

                    ddlPortals.Items.Add(listItem);

                    portalLocales.AddRange(locale.Locales);
                }

                rptLanguageItems.DataSource = portalLocales;
                rptLanguageItems.DataBind();
            }
            catch (Exception exception)
            {
                Exceptions.LogException(exception);
            }
            */
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            try
            {
                if (Response.StatusCode == 403 || Response.StatusCode == 404 || Response.StatusCode == 500)
                {
                    return;
                }

                string originalUrl = Context.Items["UrlRewrite:OriginalUrl"]?.ToString();
                if (originalUrl == null)
                {
                    originalUrl = Request.Url.ToString();
                }
                else
                {
                    int idx = originalUrl.LastIndexOf("/", StringComparison.Ordinal);
                    if (idx > -1 && idx < originalUrl.Length && originalUrl.Substring(idx).Contains("."))
                    {
                        HttpCookie debugCookie = new HttpCookie("AA_DEBUG")
                                                 {
                                                     ["Url"] = originalUrl.Substring(idx)
                                                 };
                        Response.Cookies.Add(debugCookie);
                        return;
                    }
                }

                HttpCookie langCookie = Request.Cookies[LanguageCookieName];
                if (IsPostBack || new Uri(originalUrl).AbsolutePath != "/")
                {
                    if (langCookie == null)
                    {
                        langCookie = new HttpCookie(LanguageCookieName);
                        Response.Cookies.Add(langCookie);
                    }

                    string primaryPortalUrl = Utils.GetPrimaryPortalUrl(Utils.GetCurrentPortalId());
                    langCookie["portal"] = primaryPortalUrl.Substring(primaryPortalUrl.LastIndexOf('/') + 1);
                    langCookie["lang"] = Utils.GetCurrentCulture();
                    langCookie.Expires = DateTime.Now.AddMonths(1);
                    langCookie.HttpOnly = false;
                    Response.Cookies.Set(langCookie);
                    return;
                }

                string region = "global";
                string currentLang = "en-US";
                string path = "";

                if (langCookie == null)
                {
                    langCookie = new HttpCookie(LanguageCookieName);
                    Response.Cookies.Add(langCookie);
                    try
                    {
                        GeolocationbyipClient geolocationbyipClient = new GeolocationbyipClient();
                        region = geolocationbyipClient.GetPortalRegion(Utils.CurrentIp);
                        geolocationbyipClient.Close();
                    }
                    catch (Exception exception)
                    {
                        region = "global";
                        Exceptions.LogException(exception);
                    }

                    string[] userLanguages = HttpContext.Current.Request.UserLanguages;
                    if (userLanguages != null && userLanguages.Length != 0 && userLanguages[0] != null && userLanguages[0].Trim().Length >= 2)
                    {
                        PortalLanguage portalLanguage = new PortalLanguage(userLanguages[0].Trim().Substring(0, 2).ToLower(), region);
                        region = portalLanguage.Region;
                        currentLang = portalLanguage.Language;
                    }
                }
                else
                {
                    region = langCookie["portal"];
                    currentLang = langCookie["lang"];
                }

                if (region == null)
                {
                    region = "global";
                }

                if (currentLang == null)
                {
                    currentLang = "en-US";
                }

                langCookie["portal"] = region;
                langCookie["lang"] = currentLang;
                langCookie.Expires = DateTime.Now.AddMonths(1);
                langCookie.HttpOnly = false;
                Response.Cookies.Set(langCookie);
                string url = $"{Request.Url.Scheme}://{Request.Url.Host}/{region}/{currentLang}{path}";
                Response.Redirect(url, true);
            }
            catch (Exception ex)
            {
                Exceptions.LogException(ex);
            }
        }
    }
}