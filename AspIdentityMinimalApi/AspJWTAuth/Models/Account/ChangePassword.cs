using System.ComponentModel.DataAnnotations;

namespace AspJWTAuth.Models.Account
{
    public class ChangePassword
    {
        [Required]
        public string CurrentPassword { get; set; }

        [Required]
        public string NewPassword { get; set; }
    }
}
