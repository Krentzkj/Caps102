using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AspJWTAuth.Models
{
	public class BoardingHouse
	{
        [Key]
        public int BoardinghouseId { get; set; } 

        public int? RoomNumber { get; set; }

        public int? RoomSize { get; set; }

        [Column(TypeName = "decimal(18, 2)")]
        public decimal? PricePerMonth { get; set; }

        public bool IsAvailble { get; set; }

        public string? Descriptions { get; set; }

        [ForeignKey("Tenant")]
        public string? TenantId { get; set; } 

        public virtual IdentityUser? Tenant { get; set; }

        // Other collections can be added here if needed (e.g., BookingTransactions, Amenities)
        // public virtual ICollection<BookingTransaction> BookingTransactions { get; set; }
        // public virtual ICollection<Amenity> Amenities { get; set; }
    }
}
