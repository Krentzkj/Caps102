using System.ComponentModel.DataAnnotations;

namespace AspJWTAuth.Models
{
	public class RegisterRequest
	{
		[Required]
		[EmailAddress]
		public string Email { get; set; }

		[Required]
		[MinLength(6)]
		public string Password { get; set; }
	}
}
