using AspJWTAuth.Data;
using AspJWTAuth.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AspJWTAuth.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class BoardingHouseController : ControllerBase
	{
		private readonly AppDbContext _appDbContext;
		private readonly UserManager<IdentityUser> _userManager;
		private readonly RoleManager<IdentityRole> _roleManager;

		public BoardingHouseController( AppDbContext appDbContext, UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager)
		{
			_appDbContext = appDbContext;
			_userManager = userManager;
				_roleManager = roleManager;
		}

		[HttpGet("Get-All-BoardingHouse")]
		public ActionResult<IEnumerable<BoardingHouse>> GetAllBoardingHouse()
		{
			return _appDbContext.BoardingHouses;
		}

		[HttpPost("Services-Tenant")]
		public async Task<ActionResult<BoardingHouse>> CreateService([FromBody] BoardingHouse service)
		{
			var user = await _userManager.GetUserAsync(User);
			if (user == null || !await _userManager.IsInRoleAsync(user, "Tenant"))
			{
				return Unauthorized("Only tenants can add boardinghouse.");
			}

			service.TenantId = user.Id;
			_appDbContext.BoardingHouses.Add(service);
			await _appDbContext.SaveChangesAsync();

			return CreatedAtAction(nameof(GetBoardingHouseById), new { id = service.TenantId }, service);
		}

		//[HttpPut("Tenant-Booking-Confirmation/{id}")]
		//public async Task<ActionResult<BookingTransaction>> ConfirmBooking(string id)
		//{
		//	var user = await _userManager.FindByIdAsync(id); 
		//	if (user != null)
		//	{
		//		var roles = await _userManager.GetRolesAsync(user); 
		//		if (roles.Contains("Tenant"))
		//		{
		//			return Ok("You are authorized to confirm bookings");
		//		}

		//		return Unauthorized("Unauthorized");
		//	}

		//	return Ok(user);
		//}

		[HttpGet("{id}")]
		public async Task<ActionResult<BoardingHouse>> GetBoardingHouseById(int id)
		{
			return await _appDbContext.BoardingHouses.Where(x => x.BoardinghouseId == id).SingleOrDefaultAsync();
		}
	}
}
