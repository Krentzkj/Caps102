using System.ComponentModel.DataAnnotations;

namespace ASPServerApi.Models
{
    public class Amenity
    {
        [Key]
        public int AmenityId { get; set; }
        public string AmenityName { get; set; } = string.Empty;
        public decimal AmenityPrice { get; }
        public int BoardingHouseId { get; set; }
        public BoardingHouse? BoardingHouse { get; set; }
    }
}
