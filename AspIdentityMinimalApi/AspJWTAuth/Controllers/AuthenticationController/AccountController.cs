using AspJWTAuth.Data;
using AspJWTAuth.Models.Authentication;
using AspJWTAuth.Models.Roles;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using MimeKit;
using NuGet.Protocol;
using SendGrid.Helpers.Mail;
using System.IdentityModel.Tokens.Jwt;
using System.Net.Mail;
using System.Security.Claims;
using System.Text;

namespace AspJWTAuth.Controllers.AuthenticationController
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IConfiguration _configuration;
        private readonly ApplicationDbContext _applicationDbContext;

        public AccountController(
            UserManager<ApplicationUser> userManager,
            SignInManager<ApplicationUser> signInManager,
            IConfiguration configuration,
            ApplicationDbContext applicationDbContext)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
            _applicationDbContext = applicationDbContext;
        }



        //[HttpPatch("ApplicationUserEditProfile")]
        //[Authorize]
        //public async Task<IActionResult> PatchUser([FromBody] ApplicationUser updateUserDto)
        //{
        //    var claimsIdentity = this.User.Identity as ClaimsIdentity;
        //    var userId = claimsIdentity.FindFirst(ClaimTypes.Name)?.Value;

        //    var user = await _userManager.FindByIdAsync(userId);

        //    if (user == null)
        //    {
        //        return NotFound("User not found.");
        //    }

        //    if (!string.IsNullOrEmpty(updateUserDto.FirstName)) user.FirstName = updateUserDto.FirstName;
        //    if (!string.IsNullOrEmpty(updateUserDto.LastName)) user.LastName = updateUserDto.LastName;
        //    if (!string.IsNullOrEmpty(updateUserDto.MiddleInitial)) user.MiddleInitial = updateUserDto.MiddleInitial;
        //    if (!string.IsNullOrEmpty(updateUserDto.ContactNumber)) user.ContactNumber = updateUserDto.ContactNumber;
        //    if (!string.IsNullOrEmpty(updateUserDto.Location)) user.Location = updateUserDto.Location;

        //    var result = await _userManager.UpdateAsync(user);

        //    if (!result.Succeeded) return BadRequest(result.Errors);

        //    return Ok(user);
        //}



        [HttpGet("confirmemail")]
        public async Task<IActionResult> ConfirmEmail(string userId, string token)
        {
            var user = await _userManager.FindByIdAsync(userId);
            if (user == null)
            {
                return BadRequest(new { Result = "Invalid User ID" });
            }

            var result = await _userManager.ConfirmEmailAsync(user, token);
            if (result.Succeeded)
            {
                return Ok(new { Result = "Email confirmed successfully." });
            }

            return BadRequest(result.Errors);
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterModel model)
        {
            var user = new ApplicationUser { UserName = model.Email, Email = model.Email, FirstName = model.FirstName, MiddleInitial = model.MiddleInitial , LastName = model.LastName, Location = model.Location, ContactNumber = model.ContactNumber };
            var result = await _userManager.CreateAsync(user, model.Password);

            if (result.Succeeded) return Ok(new { Result = "User created successfully" });

            return BadRequest(result.Errors);
        }

        [HttpGet("roles")]
        [Authorize]
        public async Task<IActionResult> GetUserRoles()
        {
            var claimsIdentity = this.User.Identity as ClaimsIdentity;
            var userId = claimsIdentity?.FindFirst(ClaimTypes.Name)?.Value;

            var user = await _userManager.FindByIdAsync(userId);
            if (user == null) return NotFound("User not found.");

            if (string.IsNullOrEmpty(userId))
            {
                return Unauthorized(new { Message = "User ID not found in claims." });
            }

            var roles = await _userManager.GetRolesAsync(user);

            return Ok(new { RoleName = roles });
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginModel model)
        {
            var user = await _userManager.FindByEmailAsync(model.Email);
            var roles = await _userManager.GetRolesAsync(user);
            if (user != null && await _userManager.CheckPasswordAsync(user, model.Password))
            {
                var token = GenerateJwtToken(user);
                return Ok(new { Token = token, Username = user.UserName, RoleName = roles });
            }
            return Unauthorized();
        }
        private string GenerateJwtToken(ApplicationUser user)
        {
            var claims = new[]
            {
            new Claim(JwtRegisteredClaimNames.Sub, user.UserName),
            new Claim(ClaimTypes.Name, user.Id.ToString()),
            //new Claim(JwtRegisteredClaimNames.Email, user.Email),
            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
        };
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
            var token = new JwtSecurityToken(
                issuer: _configuration["Jwt:Issuer"],
                audience: _configuration["Jwt:Audience"],
                claims: claims,
                expires: DateTime.Now.AddMinutes(30),
                signingCredentials: creds);
            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        //private async Task<string> GenerateJwtToken(ApplicationUser user)
        //{
        //    var userRoles = await _userManager.GetRolesAsync(user);
        //    var claims = new List<Claim>
        //        {
        //            new Claim(JwtRegisteredClaimNames.Sub, user.UserName),
        //            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
        //            new Claim(ClaimTypes.NameIdentifier, user.Id)
        //        };
        //    claims.AddRange(userRoles.Select(role => new Claim(ClaimTypes.Role, role)));

        //    var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
        //    var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

        //    var token = new JwtSecurityToken(
        //        issuer: _configuration["Jwt:Issuer"],
        //        audience: _configuration["Jwt:Audience"],
        //        claims: claims,
        //        expires: DateTime.UtcNow.AddMinutes(30),
        //        signingCredentials: creds);

        //    return new JwtSecurityTokenHandler().WriteToken(token);
        //}


        [HttpPost("AssignRole")]
        [Authorize]
        public async Task<IActionResult> AssignRoleToUser(UserRole userRole)
        {

            var claimsIdentity = this.User.Identity as ClaimsIdentity;
            var userId = claimsIdentity?.FindFirst(ClaimTypes.Name)?.Value;

            var user = await _userManager.FindByIdAsync(userId);
            if (user == null) return NotFound("User not found.");

            var result = await _userManager.AddToRoleAsync(user, userRole.RoleName);
            if (result.Succeeded) return Ok(new { message = "Role assigned." });

            return BadRequest(result.Errors);
        }
    }
}
