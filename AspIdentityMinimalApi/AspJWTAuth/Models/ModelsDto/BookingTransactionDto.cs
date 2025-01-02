using System.ComponentModel.DataAnnotations;

namespace AspJWTAuth.Models.ModelsDto
{
    public class BookingTransactionDto
    {
        [Key]
        public int BookingTransactionId { get; set; }
        public int BoardingHouseId { get; set; }
        public string ClientId { get; set; }
        public DateTime BookingDate { get; set; }
        public DateTime? CheckInDate { get; set; }
        public DateTime? CheckOutDate { get; set; }
        public string Status { get; set; } = "Pending"; // Default status is "Pending"
        public decimal? AmountPaid { get; set; }
    }
}
