using System.Collections.Generic;

namespace AirAstana.Themes.AirAstana7.Components.Models
{
    public class PortalMenuLinks
    {
        public int PortalId { get; set; } = -1;
        public string PortalName { get; set; } = "";
        public bool Disabled { get; set; } = false;
        public List<MenuLink> MenuLinks { get; set; } = new List<MenuLink>();
    }
}