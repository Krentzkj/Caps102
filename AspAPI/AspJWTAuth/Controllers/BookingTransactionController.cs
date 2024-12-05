using AspJWTAuth.Data;
using AspJWTAuth.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NuGet.Protocol;

namespace AspJWTAuth.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class BookingTransactionController : ControllerBase
	{
		private readonly AppDbContext _appDbContext;
		private readonly UserManager<IdentityUser> _userManager;
		private readonly RoleManager<IdentityRole> _roleManager;

		public BookingTransactionController(AppDbContext appDbContext, UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager)
		{
			_appDbContext = appDbContext;
			_userManager = userManager;
			_roleManager = roleManager;
		}

		//[HttpGet("BookingTransaction-Client")]
		//public async Task<ActionResult<BookingTransaction>> AddTransaction([FromBody] BookingTransaction transaction)
		//{
		//	var user = await _userManager.GetUserAsync(User);
		//	if (user == null && !await _userManager.IsInRoleAsync(user, "Client"))
		//	{
		//		return Unauthorized("Only clients can create bookings.");
		//	}

		//	var checkExistingTransaction = await (from t in _appDbContext.BookingTransactions
		//										  where t.ClientId == user.Id && t.Status != "Booked"
		//										  select t).FirstOrDefaultAsync();

		//	if (checkExistingTransaction != null)
		//	{
		//		return BadRequest("already have trnsact");
		//	}

		//	var boardingHouse = await _appDbContext.BoardingHouses.FindAsync(transaction.BoardinghouseId);
		//	if (boardingHouse == null)
		//	{
		//		return NotFound();
		//	}

		//	var booking = new BookingTransaction
		//	{
		//		ClientId = user.Id,
		//		BoardinghouseId = boardingHouse.BoardinghouseId,
		//		CheckInDate = transaction.CheckInDate,
		//		Status = "Pending"
		//	};

		//	_appDbContext.BookingTransactions.Add(booking);
		//	await _appDbContext.SaveChangesAsync();

		//	return CreatedAtAction(nameof(getBookingTransactById), new { id = transaction.TransactionId }, transaction);
		//}

		//[HttpGet("{id}")]
		//public async Task<ActionResult<BookingTransaction>> getBookingTransactById(int id)
		//{
		//	return await _appDbContext.BookingTransactions.Where(x => x.TransactionId == id).SingleOrDefaultAsync();
		//}
	}
}
