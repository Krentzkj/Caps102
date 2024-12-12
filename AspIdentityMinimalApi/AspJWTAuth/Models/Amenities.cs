using System.ComponentModel.DataAnnotations;

namespace AspJWTAuth.Models
{
    public class Amenities
    {
        [Key]
        public int AmenityId { get; set; }
        [Required]
        public string? Name { get; set; }
        [Required]
        public decimal? Price { get; set;  }
        public int? BoardinghouseId { get; set; }
        public virtual BoardingHouse? BoardingHouse { get; set; }
    }
}
