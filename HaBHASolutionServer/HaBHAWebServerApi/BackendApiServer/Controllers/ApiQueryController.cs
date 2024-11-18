using BackendApiServer.Data;
using BackendApiServer.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BackendApiServer.Controllers;

[Route("api/[controller]")]
[ApiController]
public class ApiQueryController : ControllerBase
{
	private readonly ApplicationDbContext _context;
	private readonly UserManager<ApplicationUser> _userManager;
	private readonly RoleManager<IdentityRole> _roleManager;

	public ApiQueryController(ApplicationDbContext context, UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager)
	{
		_context = context;
		_userManager = userManager;
		_roleManager = roleManager;
	}	

	[HttpGet("Getall")]
	public ActionResult<IEnumerable<Service>> GetServices()
	{
		return _context.services;
	}

	[HttpGet("GetallApprovedBooking")]
	public async Task<ActionResult<Service>> GetApprovedBookings()
	{
		var getbookings = await (from b in _context.bookings
						   where b.Status == "Approved"
						   select b).FirstOrDefaultAsync();

		return Ok(getbookings);
	}

	[HttpGet("GetallPendingBooking")]
	public async Task<ActionResult<Service>> GetPendingBookings()
	{
		var getbookings = await (from b in _context.bookings
								 where b.Status == "Pending"
								 select b).ToListAsync();

		return Ok(getbookings);
	}

	[HttpGet("Roles")]
	public async Task<ActionResult<ApplicationUser>> getroles()
	{
		var userRoles = await (from user in _context.Users
							   join userRole in _context.UserRoles on user.Id equals userRole.UserId
							   join role in _context.Roles on userRole.RoleId equals role.Id 
							   where role.Name == "Client"
							   select new
							   {
								   UserId = user.Id,
								   UserName = user.UserName,
								   RoleName = role.Name
							   }).ToListAsync();

		return Ok(userRoles);
	}

	[HttpGet("GetallTenantServices")]
	public async Task<ActionResult<Service>> GetallTenantServices(string tenantId)
	{
		var tenantSerices = await (from s in _context.services
								   where s.TenantId == tenantId
								   select s).ToListAsync();

		return Ok(tenantSerices);
	}
}
