using AspJWTAuth.Data;
using AspJWTAuth.Models.Authentication;
using AspJWTAuth.Models.TenantModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;

namespace AspJWTAuth.Controllers.Tenant
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

        [HttpGet("GetAllAmenities")]
        public ActionResult<IEnumerable<Amenities>> GetAllAmenities()
        {
            return _applicationDbContext.Amenities;
        }


        [HttpGet("GetBoardingHousesWithAmenities")]
        [Authorize]
        public async Task<IActionResult> GetBoardingHousesWithAmenities()
        {
            var boardingHouseAmenities = await (
            from bh in _applicationDbContext.BoardingHouses
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
                }).ToListAsync();

            return Ok(boardingHouseAmenities);
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

            if (roomNumber.HasValue)
            {
                query = query.Where(bh => bh.RoomNumber == roomNumber.Value);
            }

            if (roomSize.HasValue)
            {
                query = query.Where(bh => bh.RoomSize == roomSize.Value);
            }

            if (maxPrice.HasValue)
            {
                query = query.Where(bh => bh.PricePerMonth <= maxPrice.Value);
            }

            if (isAvailable.HasValue)
            {
                query = query.Where(bh => bh.IsAvailble == isAvailable.Value);
            }

            if (!string.IsNullOrEmpty(description))
            {
                query = query.Where(bh => bh.Descriptions.Contains(description));
            }

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

            if (!result.Any())
            {
                return NotFound("No boarding houses found with the specified criteria.");
            }

            return Ok(result);
        }


        [HttpGet("SearchBoardingHouses")]
        public async Task<IActionResult> SearchBoardingHouses(string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm))
            {
                return BadRequest("Search term cannot be empty.");
            }

            searchTerm = searchTerm.ToLower();

            var query = _applicationDbContext.BoardingHouses.AsQueryable();

            if (searchTerm.Contains("available"))
            {
                query = query.Where(bh => bh.IsAvailble == true);
            }
            else
            {
                query = query.Where(bh =>
                    bh.RoomNumber.ToString().Contains(searchTerm) || 
                    bh.RoomSize.ToString().Contains(searchTerm) || 
                    bh.PricePerMonth.ToString().Contains(searchTerm) || 
                    bh.IsAvailble.ToString().Contains(searchTerm) || 
                    bh.Descriptions.Contains(searchTerm) 
                );
            }

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

            if (!result.Any())
            {
                return NotFound("No boarding houses found with the specified search term.");
            }

            return Ok(result);
        }

        [HttpGet("GetBoardingHousesByPrice/{price}")]
        public async Task<IActionResult> GetBoardingHousesByPrice(decimal price)
        {
         
            var filteredBoardingHouses = await (
                from bh in _applicationDbContext.BoardingHouses
                where bh.IsAvailble == true && bh.PricePerMonth <= price
                from u in _applicationDbContext.Users 
       
                join a in _applicationDbContext.Amenities
                    on bh.BoardinghouseId equals a.BoardinghouseId into amenitiesGroup
                   
                select new
                {
                    u.FirstName, u.LastName,
                    BoardingHouseId = bh.BoardinghouseId,
                    RoomNumber = bh.RoomNumber,
                    RoomSize = bh.RoomSize,
                    PricePerMonth = bh.PricePerMonth,
                    IsAvailable = bh.IsAvailble,
                    Descriptions = bh.Descriptions,
                    TenantId = bh.TenantId
                    //Amenities = amenitiesGroup.Select(a => new
                    //{
                    //    AmenityId = a.AmenityId,
                    //    Name = a.Name,
                    //    Price = a.Price
                    //}).ToList()
                }
            ).ToListAsync();

            if (!filteredBoardingHouses.Any())
            {
                return NotFound("No available boarding houses found within the specified price range.");
            }

            return Ok(filteredBoardingHouses);
        }


        [HttpGet("GetavailableBoardingHouses")]
        public async Task<IActionResult> GetavailableBoardingHouses()
        {
            var availableBoardingHouses = await (
                from bh in _applicationDbContext.BoardingHouses
                where bh.IsAvailble == true //flase
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

            return Ok(availableBoardingHouses);
        }

        [HttpGet("Amenities-/{id}")]
        public async Task<ActionResult<BoardingHouse?>> getAmenitiesById(int id)
        {
            var bh = await (from b in _applicationDbContext.Amenities
                            where id == b.AmenityId
                            select b).FirstOrDefaultAsync();

            if (bh == null)
            {
                return NotFound();
            }

            return Ok(bh);
        }

        [HttpPost("Tenant-Add-Amenities")]
        public async Task<ActionResult<Amenities>> addAmenities(
            [FromBody] Amenities amenities)
        {
            try
            {
                Amenities amenities1 = new()
                {
                    Name = amenities.Name,
                    Price = amenities.Price
                };

                await _applicationDbContext.Amenities.AddAsync(amenities1);
                await _applicationDbContext.SaveChangesAsync();


                return CreatedAtAction(nameof(getAmenitiesById), new { id = amenities1.BoardinghouseId }, amenities);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Internal server error.", error = ex.InnerException?.Message ?? ex.Message });
            }
        }

        [HttpPut("Tenant-Update-Amenities")]
        public async Task<ActionResult> UpdateAmenities([FromBody] Amenities amenities)
        {
            try
            {
                _applicationDbContext.Amenities.Update(amenities);
                await _applicationDbContext.SaveChangesAsync();


                return Ok(new { message = "Data updated", amenities });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Internal server error.", error = ex.InnerException?.Message ?? ex.Message });
            }
        }

        [HttpDelete("Delete-Amenities/{id}")]
        public async Task<IActionResult> DeleteAmenities(int id)
        {
            var Amenities = await _applicationDbContext.Amenities.FindAsync(id);

            if (Amenities == null)
            {
                return NotFound("Boardinghouse not found.");
            }

            _applicationDbContext.Amenities.Remove(Amenities);

            try
            {
                await _applicationDbContext.SaveChangesAsync();
                return Ok(new { message = "Amenities Succesfully deleted!" });
            }
            catch (DbUpdateException ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError,
                    "An error occurred while deleting the record. Please try again.");
            }
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
