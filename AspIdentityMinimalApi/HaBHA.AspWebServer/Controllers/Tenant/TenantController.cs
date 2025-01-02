using HaBHA.AspWebServer.Data;
using HaBHA.AspWebServer.Models.Authentication;
using HaBHA.AspWebServer.Models.Establishments;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace HaBHA.AspWebServer.Controllers.Tenant
{
    [Route("api/[controller]")]
    [ApiController]
    public class TenantController : ControllerBase
    {
        private readonly ApplicationDbContext _applicationDbContext;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IConfiguration _configuration;

        public TenantController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, IConfiguration configuration, ApplicationDbContext applicationDbContext)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
            _applicationDbContext = applicationDbContext;
        }


        [HttpGet("GetAllBoardingHouse")]
        public ActionResult<IEnumerable<BoardingHouse>> GetAllBoardingHouse()
        {
            return _applicationDbContext.BoardingHouses;
        }

        [HttpGet("GetUser")]
        [Authorize]
        public async Task<ActionResult> GetValuess()
        {
            var claimsIdentity = this.User.Identity as ClaimsIdentity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.Name)?.Value;

            return Ok(userId);
        }

        [HttpGet("BoardingHouse-/{id}")]
        public async Task<ActionResult<BoardingHouse?>> getBoardingHouseById(int id)
        {
            var bh = await (from b in _applicationDbContext.BoardingHouses
                            where id == b.BoardinghouseId
                            select b).FirstOrDefaultAsync();

            if (bh == null)
            {
                return NotFound();
            }   

            return Ok(bh);
        }

        [HttpGet("Get-Tenant-BoardingHouse")]
        [Authorize]
        public async Task<ActionResult> GetTenantBoardinghouse()
        {
            var claimsIdentity = this.User.Identity as ClaimsIdentity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.Name)?.Value;

            var tenantBoardinghouse = await (from s in _applicationDbContext.BoardingHouses
                                             where s.TenantId == userId
                                             select s).ToListAsync();

            return Ok(tenantBoardinghouse);
        }

        [HttpPut("Tenant-Update-BoardingHouse")]
        public async Task<ActionResult> UpdateTenantBoardingHouse([FromBody] BoardingHouse boardingHouse)
        {
            try
            {
                _applicationDbContext.BoardingHouses.Update(boardingHouse);
                await _applicationDbContext.SaveChangesAsync();


                return Ok(new { message = "Data updated", boardingHouse });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Internal server error.", error = ex.InnerException?.Message ?? ex.Message });
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBoardinghouse(int id)
        {
            var boardinghouse = await _applicationDbContext.BoardingHouses.FindAsync(id);

            if (boardinghouse == null)
            {
                return NotFound("Boardinghouse not found.");
            }

            _applicationDbContext.BoardingHouses.Remove(boardinghouse);

            try
            {
                await _applicationDbContext.SaveChangesAsync();
                return Ok(new { message = "Boarding House Succesfully deleted!" });
            }
            catch (DbUpdateException ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError,
                    "An error occurred while deleting the record. Please try again.");
            }
        }

        [HttpPost("Tenant-Add-BoardingHouse-getemail")]
        public async Task<ActionResult<BoardingHouse>> addBoardinghosuegetemail(
            [FromBody] BoardingHouse boardingHouse)
        {

            var claimsIdentity = this.User.Identity as ClaimsIdentity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.Name)?.Value;

            try
            {
                BoardingHouse boardingHouse1 = new()
                {
                    RoomNumber = boardingHouse.RoomNumber,
                    RoomSize = boardingHouse.RoomSize,
                    Descriptions = boardingHouse.Descriptions,
                    PricePerMonth = boardingHouse.PricePerMonth,
                    TenantId = userId,
                    IsAvailble = boardingHouse.IsAvailble
                };

                if (await _applicationDbContext.Users.FindAsync(userId) == null)
                {
                    return NotFound(new { message = "The provided user ID does not exist in the system." });
                }

                await _applicationDbContext.BoardingHouses.AddAsync(boardingHouse1);
                await _applicationDbContext.SaveChangesAsync();


                return CreatedAtAction(nameof(getBoardingHouseById), new { id = boardingHouse.BoardinghouseId }, boardingHouse);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Internal server error.", error = ex.InnerException?.Message ?? ex.Message });
            }
        }
    }
}
