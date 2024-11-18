using System;
using System.ComponentModel.DataAnnotations;

namespace HaBHAWebServerApi.Models
{
	public class BookingTransaction
	{
		[Key]
		public int TransactionId { get; set; }
		public DateTime? CheckInDate { get; set; }
		public DateTime? CheckOutDate { get; set; }
		public decimal AmountPaid { get; set; }
		public string? PaymentStatus { get; set; }
		public string? Status { get; set; }
		public string? Paymentmethod { get; set; }
		public int? BoardinghouseId { get; set; }
		public virtual BoardingHouse? Boardinghouse { get; set; }
	}
}
