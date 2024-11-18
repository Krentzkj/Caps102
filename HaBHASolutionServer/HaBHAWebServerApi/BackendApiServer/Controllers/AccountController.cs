using BackendApiServer.Data;
using BackendApiServer.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BackendApiServer.Controllers;

[Route("api/[controller]")]
[ApiController]
public class AccountController : ControllerBase
{
	private readonly ApplicationDbContext _context;
	private readonly UserManager<ApplicationUser> _userManager;
	private readonly RoleManager<IdentityRole> _roleManager;

	public AccountController(UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager, ApplicationDbContext dbContext)
	{
		_userManager = userManager;
		_roleManager = roleManager;
		_context = dbContext;
	}

	[HttpPost("register")]
	public async Task<IActionResult> Register(RegisterModel model)
	{
		var user = new ApplicationUser { UserName = model.Email, Email = model.Email };
		var result = await _userManager.CreateAsync(user, model.Password);

		if (result.Succeeded)
		{
			if (model.Role == "Tenant")
			{
				await _userManager.AddToRoleAsync(user, "Tenant");
			}
			
			if (model.Role == "Client")
			{
				await _userManager.AddToRoleAsync(user, "Client");
			}

			if (model.Role == "SuperAdmin")
			{
				await _userManager.AddToRoleAsync(user, "SuperAdmin");
			}

			return Ok(new { Message = "User created successfully." });
		}

		return BadRequest(result.Errors);
	}
}
