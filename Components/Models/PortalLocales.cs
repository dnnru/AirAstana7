using System.Collections.Generic;

namespace AirAstana.Themes.AirAstana7.Components.Models
{
    public class PortalLocales
    {
        public int PortalId { get; set; }
        public string PortalName { get; set; }
        public bool IsCurrent { get; set; }
        public List<AirAstanaLocale> Locales { get; set; } = new List<AirAstanaLocale>();
    }
}