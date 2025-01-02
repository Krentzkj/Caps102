using AspJWTAuth.Data;
using AspJWTAuth.Models.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SendGrid.Helpers.Mail;
using System.Security.Claims;

namespace AspJWTAuth.Controllers.OwnerConrtoller
{
    [Route("api/[controller]")]
    [ApiController]
    public class OwnerBoardingHouseFilterQueryController : ControllerBase
    {
        private readonly ApplicationDbContext _applicationDbContext;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IConfiguration _configuration;
        
        public OwnerBoardingHouseFilterQueryController(ApplicationDbContext applicationDbContext, UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, IConfiguration configuration)
        {
            _applicationDbContext = applicationDbContext;
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
        }

        [HttpGet("GetBoardingHosueWithBookingTransactions")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<object>>> GetBookingTransactionsGroupedByBoardingHouse()
        {
            var claimsIdentity = this.User.Identity as ClaimsIdentity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.Name)?.Value;


            var groupedTransactions = await (from bt in _applicationDbContext.BookingTransactions
                                             join bh in _applicationDbContext.BoardingHouses on bt.BoardingHouseId equals bh.BoardinghouseId
                                             where bt.ClientId == userId
                                             group bt by new { bh.BoardinghouseId, bh.Descriptions } into g
                                             select new
                                             {
                                                 BoardingHouseId = g.Key.BoardinghouseId,
                                                 Description = g.Key.Descriptions,
                                                 Transactions = g.Select(t => new
                                                 {
                                                     t.BookingTransactionId,
                                                     t.ClientId,
                                                     t.BookingDate,
                                                     t.CheckInDate,
                                                     t.CheckOutDate,
                                                     t.Status,
                                                     t.AmountPaid
                                                 }).ToList()
                                             }).ToListAsync();


            if (!groupedTransactions.Any())
            {
                return NotFound("No booking transactions found.");
            }

            return Ok(groupedTransactions);
        }

        [HttpGet("GetOwnerPendingBookings")]
        [Authorize]
        public async Task<IActionResult> GetOwnerPendingBookings()
        {
            var claimsIdentity = this.User.Identity as ClaimsIdentity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.Name)?.Value;

            var ownerBoardingHouses = await _applicationDbContext.BoardingHouses
                .Where(bh => bh.TenantId == userId)
                .Select(bh => bh.BoardinghouseId)
                .ToListAsync();

            if (ownerBoardingHouses == null || !ownerBoardingHouses.Any())
            {
                return NotFound("No boarding houses found for the specified owner.");
            }

            var pendingBookings = await (from b in _applicationDbContext.BookingTransactions
                                         where b.Status == "Pending" && ownerBoardingHouses.Contains(b.BoardingHouseId)
                                         select new
                                         {
                                             b.BookingTransactionId,
                                             b.BoardingHouseId,
                                             b.ClientId,
                                             b.BookingDate,
                                             b.CheckInDate,
                                             b.CheckOutDate,
                                             b.Status,
                                             b.AmountPaid
                                         }).ToListAsync();

            if (pendingBookings == null || !pendingBookings.Any())
            {
                return NotFound("No pending bookings found for the owner's boarding houses.");
            }

            return Ok(pendingBookings);
        }

        [HttpGet("SearchEachFields")]
        public async Task<IActionResult> SearchBoardingHouses(
            int? roomNumber = null,
            int? roomSize = null,
            decimal? maxPrice = null,
            bool? isAvailable = null,
            string? description = null)
        {
            var query = _applicationDbContext.BoardingHouses.AsQueryable();

            if (roomNumber.HasValue) { query = query.Where(bh => bh.RoomNumber == roomNumber.Value); }

            if (roomSize.HasValue) { query = query.Where(bh => bh.RoomSize == roomSize.Value); }

            if (maxPrice.HasValue) { query = query.Where(bh => bh.PricePerMonth <= maxPrice.Value); }

            if (isAvailable.HasValue) { query = query.Where(bh => bh.IsAvailble == isAvailable.Value); }

            if (!string.IsNullOrEmpty(description)) { query = query.Where(bh => bh.Descriptions.Contains(description)); }

            var result = await (
                from bh in query
                join a in _applicationDbContext.Amenities
                    on bh.BoardinghouseId equals a.BoardinghouseId into amenitiesGroup
                select new
                {
                    BoardingHouseId = bh.BoardinghouseId,
                    RoomNumber = bh.RoomNumber,
                    RoomSize = bh.RoomSize,
                    PricePerMonth = bh.PricePerMonth,
                    IsAvailable = bh.IsAvailble,
                    Descriptions = bh.Descriptions,
                    TenantId = bh.TenantId,
                    Amenities = amenitiesGroup.Select(a => new
                    {
                        AmenityId = a.AmenityId,
                        Name = a.Name,
                        Price = a.Price
                    }).ToList()
                }
            ).ToListAsync();

            if (!result.Any()) return NotFound("No boarding houses found with the specified criteria.");

            return Ok(result);
        }
    }
}
