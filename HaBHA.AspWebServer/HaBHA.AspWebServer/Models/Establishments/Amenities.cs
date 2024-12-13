using System.ComponentModel.DataAnnotations;

namespace HaBHA.AspWebServer.Models.Establishments
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
