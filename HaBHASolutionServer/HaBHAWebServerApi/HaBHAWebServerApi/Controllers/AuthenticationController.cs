
using HaBHAWebServerApi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace HaBHAWebServerApi.Controllers;

[Route("api/[controller]")]
[ApiController]
public class AuthenticationController : ControllerBase
{
	private readonly UserManager<IdentityUser> _userManager;

	public AuthenticationController(UserManager<IdentityUser> userManager) {  _userManager = userManager; }

	[HttpPost("register")]
	public async Task<IActionResult> Register([FromBody] ApplicationUsers model)
	{
		var user = new IdentityUser { UserName = model.Username };

		var result = await _userManager.CreateAsync(user, model.Password);
		if (!result.Succeeded)
		{
			return BadRequest(result.Errors);
		}

		if (await _userManager.FindByNameAsync(model.Username) != null)
		{
			if (await _userManager.IsInRoleAsync(user, model.Role) == false)
			{
				await _userManager.AddToRoleAsync(user, model.Role);
			}
		}

		return Ok("User registered successfully with role " + model.Role);
	}

	[HttpPost("login")]
	public async Task<IActionResult> Login([FromBody] ApplicationUsers model)
	{
		var user = await _userManager.FindByNameAsync(model.Username);
		if (user == null || !await _userManager.CheckPasswordAsync(user, model.Password))
		{
			return Unauthorized("Invalid username or password.");
		}

		return Ok();
	}

		[Authorize(Roles = "Tenant")]
	[HttpGet("tenant-data")]
	public IActionResult GetTenantData()
	{
		return Ok("This is data for tenants only.");
	}

}
