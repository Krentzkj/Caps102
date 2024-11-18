using Microsoft.AspNetCore.Identity;

namespace BackendApiServer.Models
{
	public class ApplicationUser : IdentityUser
	{
		public string? FullName { get; set; }

	}
}
