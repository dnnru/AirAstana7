namespace AirAstana.Themes.AirAstana7.Components.Models
{
    public class AirAstanaLocale
    {
        public int PortalId { get; set; }
        public string CultureCode { get; set; }
        public string CultureFlag => CultureCode.ToLower() == "en-us" ? "/images/Flags/en-GB.gif" : $"/images/Flags/{CultureCode}.gif";
        public string CultureName { get; set; }
        public string Url { get; set; }
        public bool IsActive { get; set; }
    }
}