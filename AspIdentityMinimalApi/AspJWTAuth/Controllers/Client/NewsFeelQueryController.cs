using AspJWTAuth.Data;
using AspJWTAuth.Models.Authentication;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AspJWTAuth.Controllers.Client
{
    [Route("api/[controller]")]
    [ApiController]
    public class NewsFeelQueryController : ControllerBase
    {
        private readonly ApplicationDbContext _applicationDbContext;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IConfiguration _configuration;
        public NewsFeelQueryController(ApplicationDbContext applicationDbContext, UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, IConfiguration configuration)
        {
            _applicationDbContext = applicationDbContext;
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
        }

        [HttpGet("AvailableBoardingHouseFeed")]
        public async Task<IActionResult> GetAvailableBoardingHouses()
        {
            var availableBoardingHouses = await (from bh in _applicationDbContext.BoardingHouses
                                                 where bh.IsAvailble == true
                                                 select new
                                                 {
                                                     bh.BoardinghouseId,
                                                     bh.RoomNumber,
                                                     bh.RoomSize,
                                                     bh.PricePerMonth,
                                                     bh.IsAvailble,
                                                     bh.Descriptions,
                                                     bh.TenantId
                                                     //Amenities = bh.Amenities.Select(a => new
                                                     //{
                                                     //    a.AmenityId,
                                                     //    a.Name,
                                                     //    a.Price
                                                     //}).ToList()
                                                 }).ToListAsync();

            if (availableBoardingHouses == null || !availableBoardingHouses.Any())
            {
                return NotFound("No available boarding houses found.");
            }

            return Ok(availableBoardingHouses);
        }

        [HttpGet("TotalPrice")]
        public async Task<IActionResult> GetBoardingHouseWithTotalPrice(int boardinghouseId)
        {
            
            var boardingHouseWithTotalPrice = await (from bh in _applicationDbContext.BoardingHouses
                                                     where bh.BoardinghouseId == boardinghouseId && bh.IsAvailble == true
                                                     select new
                                                     {
                                                         bh.BoardinghouseId,
                                                         bh.RoomNumber,
                                                         bh.RoomSize,
                                                         bh.PricePerMonth,
                                                         bh.IsAvailble,
                                                         bh.Descriptions,
                                                         bh.TenantId,
                                                        
                                                         TotalPrice = bh.PricePerMonth + (bh.Amenities.Sum(a => a.Price) ?? 0),
                                                         Amenities = bh.Amenities.Select(a => new
                                                         {
                                                             a.AmenityId,
                                                             a.Name,
                                                             a.Price
                                                         }).ToList()
                                                     }).FirstOrDefaultAsync();

           
            if (boardingHouseWithTotalPrice == null)
            {
                return NotFound($"Boarding house with ID {boardinghouseId} not found or is not available.");
            }

            return Ok(boardingHouseWithTotalPrice);
        }

    }
}
