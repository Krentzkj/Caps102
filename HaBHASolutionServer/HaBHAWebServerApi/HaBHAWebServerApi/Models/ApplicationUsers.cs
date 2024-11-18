using Microsoft.AspNetCore.Identity;

namespace HaBHAWebServerApi.Models
{
	public class ApplicationUsers
	{
		public string FirstName { get; set; } = string.Empty;
		public string LastName { get; set; } = string.Empty;
		public string Address {  get; set; } = string.Empty;
		public string Username { get; set; }
		public string Password { get; set; }
		public string Role { get; set; }
	}
}
