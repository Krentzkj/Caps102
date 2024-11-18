namespace BackendApiServer.Models
{
	public class Service
	{
		public int Id { get; set; }
		public string Name { get; set; }
		public decimal Price { get; set; }

		public string TenantId { get; set; }
		public ApplicationUser Tenant { get; set; }

		public ICollection<Booking> Bookings { get; set; }
	}
}
