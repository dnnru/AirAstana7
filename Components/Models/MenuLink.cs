namespace AirAstana.Themes.AirAstana7.Components.Models
{
    public class MenuLink
    {
        public int Section { get; set; } = 0;
        public string Language { get; set; } = "";
        public string Url { get; set; } = "";
        public string Text { get; set; } = "";
        public string Description { get; set; }
        public string Icon { get; set; } = "";
        public bool MobileFirst { get; set; } = false;
    }
}