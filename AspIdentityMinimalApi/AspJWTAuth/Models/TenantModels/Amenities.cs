using System.ComponentModel.DataAnnotations;

namespace AspJWTAuth.Models.TenantModels
{
    public class Amenities
    {
        [Key]
        public int AmenityId { get; set; }
        public string? Name { get; set; }
        public decimal? Price { get; set; }
        public int? BoardinghouseId { get; set; }
    }
}
