namespace BackendApiServer.Models
{
	public class Booking
	{
		public int Id { get; set; }

		public string UserId { get; set; }
		public ApplicationUser User { get; set; }

		public string ServiceId { get; set; }
		public Service Service { get; set; }

		public DateTime Date { get; set; }

		public string Status { get; set; }
	}
}
