#region

using System;
using System.Collections.Generic;
using System.Linq;
using AirAstana.Themes.AirAstana7.Components.Models;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Web.DDRMenu;

#endregion

namespace AirAstana.Themes.AirAstana7.Components
{
    public class MobileNodeManipulator : INodeManipulator
    {
        public List<MenuNode> ManipulateNodes(List<MenuNode> nodes, PortalSettings portalSettings)
        {
            try
            {
                List<PortalMenuLinks> links = Utils.GetPortalMenuLinksCached(portalSettings.PortalId);
                if (links == null || links.Count == 0)
                {
                    return nodes;
                }

                if (links.Count > 0)
                {
                    List<MenuLink> currentLangLinks = new List<MenuLink>();
                    foreach (PortalMenuLinks link in links.Where(l => l.MenuLinks != null && l.MenuLinks.Count > 0))
                    {
                        currentLangLinks.AddRange(link.MenuLinks.Where(l => l.Language == portalSettings.CultureCode && l.Section != 0).OrderBy(l => l.Section));
                    }

                    MenuNode root = nodes.FirstOrDefault()?.Parent;
                    if (root != null)
                    {
                        Utils.FilterHiddenNodes(root, portalSettings.PortalId);
                    }

                    ILookup<int, MenuLink> lookup = currentLangLinks.Where(l => l.MobileFirst == false).ToLookup(link => link.Section);

                    for (int i = 0; i < nodes.Count; i++)
                    {
                        List<MenuLink> menuLinks = lookup[i + 1].ToList();
                        if (menuLinks.Count == 0)
                        {
                            continue;
                        }

                        if (nodes[i].Children == null)
                        {
                            nodes[i].Children = new List<MenuNode>();
                        }

                        nodes[i]
                           .Children.InsertRange(0,
                                                 menuLinks.Select((link, j) => new MenuNode
                                                                               {
                                                                                   Parent = nodes[i],
                                                                                   Enabled = true,
                                                                                   Text = link.Text,
                                                                                   Description = link.Description,
                                                                                   Url = link.Url,
                                                                                   Icon = link.Icon,
                                                                                   Keywords = Constants.ADDITIONAL_NODE,
                                                                                   Separator = j == menuLinks.Count - 1,
                                                                                   TabId = -100 - j,
                                                                                   Target = nodes[i] == null ? "-1" : nodes[i].TabId.ToString()
                                                                               }));
                    }

                    List<MenuLink> mobileFirstLinks = currentLangLinks.Where(l => l.MobileFirst).ToList();
                    nodes.InsertRange(0,
                                      mobileFirstLinks.Select((link, i) => new MenuNode
                                                                           {
                                                                               Parent = root,
                                                                               Enabled = true,
                                                                               Text = link.Text,
                                                                               Description = link.Description,
                                                                               Url = link.Url,
                                                                               Icon = link.Icon,
                                                                               Keywords = Constants.ADDITIONAL_NODE_MOBILE_FIRST,
                                                                               Separator = i == mobileFirstLinks.Count - 1,
                                                                               TabId = -10 - i,
                                                                               Target = root == null ? "-1" : root.TabId.ToString()
                                                                           }));
                }
            }
            catch (Exception e)
            {
                Exceptions.LogException(e);
            }

            SetParentTabId(nodes);

            return nodes;
        }

        private List<MenuNode> SetParentTabId(List<MenuNode> nodes)
        {
            if (nodes != null && nodes.Count > 0)
            {
                foreach (MenuNode menuNode in nodes)
                {
                    menuNode.Target = menuNode.Parent == null ? "-1" : menuNode.Parent.TabId.ToString();
                    if (menuNode.HasChildren())
                    {
                        menuNode.Children = SetParentTabId(menuNode.Children);
                    }
                }
            }
            return nodes;
        }
    }
}