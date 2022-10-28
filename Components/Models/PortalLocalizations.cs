#region

using System.Web.Caching;
using DotNetNuke.ComponentModel.DataAnnotations;

#endregion

namespace AirAstana.Themes.AirAstana7.Components.Models
{
    [TableName("sem_Portals")]
    [PrimaryKey("PortalLocId", AutoIncrement = true)]
    [Cacheable("sem_PortalLocalizations", CacheItemPriority.Normal, 20)]
    public class PortalLocalizations
    {
        public int PortalLocId { get; set; }
        public int PortalId { get; set; }
        public string Culture { get; set; }
        public string Title { get; set; }
        public bool Disabled { get; set; }
    }
}