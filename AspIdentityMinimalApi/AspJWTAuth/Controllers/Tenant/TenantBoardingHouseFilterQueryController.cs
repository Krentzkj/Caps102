using AspJWTAuth.Data;
using AspJWTAuth.Models.Authentication;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AspJWTAuth.Controllers.Tenant
{
    [Route("api/[controller]")]
    [ApiController]
    public class TenantBoardingHouseFilterQueryController : ControllerBase
    {
        private readonly ApplicationDbContext _applicationDbContext;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IConfiguration _configuration;
        public TenantBoardingHouseFilterQueryController(ApplicationDbContext applicationDbContext, UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, IConfiguration configuration)
        {
            _applicationDbContext = applicationDbContext;
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
        }

        [HttpGet("GetPendingBookings")]
        public async Task<IActionResult> GetPendingBookings()
        {

            var pendingBookings = await (from b in _applicationDbContext.BookingTransactions
                                         where b.Status == "Pending"
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
                return NotFound("No pending bookings found.");
            }

            return Ok(pendingBookings);
        }


    }
}
