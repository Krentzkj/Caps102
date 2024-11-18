using BackendApiServer.Data;
using BackendApiServer.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BackendApiServer.Controllers;

[Route("api/[controller]")]
[ApiController]
public class BookingController : ControllerBase
{
	private readonly ApplicationDbContext _context;
	private readonly UserManager<ApplicationUser> _userManager;
	private readonly RoleManager<IdentityRole> _roleManager;

	public BookingController(ApplicationDbContext context, UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager)
	{
		_context = context;
		_userManager = userManager;
		_roleManager = roleManager;
	}

	[HttpPost("service")]
	public async Task<ActionResult<Service>> CreateService([FromBody] Service service)
	{
		var user = await _userManager.GetUserAsync(User);
		if (user == null || !await _userManager.IsInRoleAsync(user, "Tenant"))
		{
			return Unauthorized("Only tenants can add services.");
		}

		service.TenantId = user.Id;
		_context.services.Add(service);
		await _context.SaveChangesAsync();

		return CreatedAtAction(nameof(GetServicesById), new { id = service.Id }, service);
	}

	[HttpPost("booking")]
	public async Task<ActionResult<Booking>> CreateBooking([FromBody] Booking request)
	{
		var user = await _userManager.GetUserAsync(User);
		if (user == null || !await _userManager.IsInRoleAsync(user, "Client"))
		{
			return Unauthorized("Only clients can create bookings.");
		}

		var existingBooking = await (from Book in _context.bookings
									 where Book.UserId == user.Id && Book.Status != "Cancelled"
									 select Book).FirstOrDefaultAsync();

		if (existingBooking != null)
		{
			return BadRequest("You can only book one service at a time.");
		}

		var service = await _context.services.FindAsync(request.ServiceId);
		if (service == null)
		{
			return NotFound("Service not found.");
		}

		var booking = new Booking
		{
			UserId = user.Id,
			ServiceId = service.Id.ToString(),
			Date = request.Date,
			Status = "Pending"
		};

		_context.bookings.Add(booking);
		await _context.SaveChangesAsync();

		return CreatedAtAction(nameof(GetBookingById), new { id = booking.Id }, booking);
	}

	[HttpGet("{id}")]
	public async Task<ActionResult<Service>> GetServicesById(int id)
	{
		return await _context.services.Where(x => x.Id == id).SingleOrDefaultAsync();
	}

	[HttpGet("getbyoid/{id}")]
	public async Task<ActionResult<Service>> GetBookingById(int id)
	{
		return await _context.services.Where(x => x.Id == id).SingleOrDefaultAsync();
	}
}
