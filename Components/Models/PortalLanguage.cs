namespace AirAstana.Themes.AirAstana7.Components.Models
{
    public class PortalLanguage
    {
        public PortalLanguage(string userLanguage, string selectedPortal)
        {
            Region = selectedPortal;
            Language = "en-US";
            switch (userLanguage.ToLower())
            {
                case "ru":
                {
                    if (IsKazakhstanRegion(Region) || IsRussiaRegion(Region) || IsUkRegion(Region))
                    {
                        Language = "ru-Ru";
                    }

                    break;
                }
                case "kk":
                    Region = "kaz";
                    Language = "kk-KZ";
                    break;
                case "zh":
                {
                    if (IsChinaRegion(Region))
                    {
                        Language = "zh-CN";
                    }

                    break;
                }
                case "ko":
                {
                    if (IsKoreaRegion(Region))
                    {
                        Language = "ko-KR";
                    }

                    break;
                }
                case "de":
                {
                    if (IsGermanyRegion(Region))
                    {
                        Language = "de-De";
                    }

                    break;
                }
                case "fr":
                {
                    if (IsFranceRegion(Region))
                    {
                        Language = "fr-FR";
                    }

                    break;
                }
                case "tr" when IsTurkeyRegion(Region):
                    Language = "tr-TR";
                    break;
            }
        }

        public string Region { get; }

        public string Language { get; }

        private static bool IsKazakhstanRegion(string region)
        {
            return region == "kaz";
        }

        private static bool IsRussiaRegion(string region)
        {
            return region == "rus";
        }

        private static bool IsUkRegion(string region)
        {
            return region == "uk";
        }

        private static bool IsChinaRegion(string region)
        {
            return region == "chn";
        }

        private static bool IsKoreaRegion(string region)
        {
            return region == "kor";
        }

        private static bool IsGermanyRegion(string region)
        {
            return region == "ger";
        }

        private static bool IsFranceRegion(string region)
        {
            return region == "fra";
        }

        private static bool IsTurkeyRegion(string region)
        {
            return region == "tur";
        }
    }
}