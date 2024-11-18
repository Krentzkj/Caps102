

namespace HaBHAWebServerApi.Models
{
	public class BoardingHouse
	{
		public int BoardinghouseId { get; set; }
		public int? RoomNumber { get; set; }
		public int? RoomSize { get; set; }
		public decimal? PricePerMonth { get; set; }
		public bool IsAvailble { get; set; }
		public string? Descriptions { get; set; }
		public string? Amenities { get; set; }
		public string? ByteBase64 { get; set; }
	}
}
