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
    public class NodeManipulator : INodeManipulator
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

                    ILookup<int, MenuLink> lookup = currentLangLinks.ToLookup(link => link.Section);
                    MenuNode root = nodes.FirstOrDefault()?.Parent;
                    if (root != null)
                    {
                        Utils.FilterHiddenNodes(root, portalSettings.PortalId);
                    }

                    for (int i = 0; i < nodes.Count; i++)
                    {
                        if (nodes[i].Children == null || nodes[i].Children.Count == 0)
                        {
                            continue;
                        }

                        int lastIdx = nodes[i].Children.Count > Constants.MAX_COLUMNS_COUNT ? Constants.MAX_COLUMNS_COUNT : nodes[i].Children.Count;
                        MenuNode lastSecondLevelNode = nodes[i].Children.ElementAtOrDefault(lastIdx - 1);
                        if (lastSecondLevelNode == null)
                        {
                            continue;
                        }

                        if (lastSecondLevelNode.Children == null)
                        {
                            lastSecondLevelNode.Children = new List<MenuNode>();
                        }

                        List<MenuNode> additionalNodes = new List<MenuNode>();
                        int lookupLast = lookup[i + 1].Count();
                        for (int j = 0; j < lookupLast; j++)
                        {
                            MenuLink menuLink = lookup[i + 1].ElementAtOrDefault(j);
                            if (menuLink == null)
                            {
                                continue;
                            }

                            MenuNode menuNode = new MenuNode
                                                {
                                                    Parent = lastSecondLevelNode,
                                                    Enabled = true,
                                                    Text = menuLink.Text,
                                                    Description = menuLink.Description,
                                                    Url = menuLink.Url,
                                                    Icon = menuLink.Icon,
                                                    Keywords = Constants.ADDITIONAL_NODE,
                                                    Separator = j == lookupLast - 1,
                                                    TabId = lastSecondLevelNode.TabId
                                                };

                            additionalNodes.Add(menuNode);
                        }

                        lastSecondLevelNode.Children.InsertRange(0, additionalNodes);
                    }
                }
            }
            catch (Exception e)
            {
                Exceptions.LogException(e);
            }

            return nodes;
        }
    }
}