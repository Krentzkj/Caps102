using AspJWTAuth.Data;
using AspJWTAuth.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;

namespace AspJWTAuth.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
	public class TenantController : ControllerBase
	{
		private readonly AppDbContext _appDbContext;
		private readonly UserManager<IdentityUser> _userManager;

		public TenantController(UserManager<IdentityUser> userManager, AppDbContext appDbContext)
		{
			_userManager = userManager;
			_appDbContext = appDbContext;
		}

		[HttpGet("BoardingHouse-/{id}")]
		public async Task<ActionResult<BoardingHouse?>> getBoardingHouseById(int id)
		{
			var bh = await (from b in _appDbContext.BoardingHouses
							where id == b.BoardinghouseId
							select b).FirstOrDefaultAsync();

			if (bh == null)
			{
				return NotFound();
			}

			return Ok(bh);
		}

        [Authorize]
        [HttpGet("Getall")]
        public ActionResult<IEnumerable<BoardingHouse>> Get()
        {
            return _appDbContext.BoardingHouses;
        }

        [HttpPost("Tenant-Add-BoardingHouse-getemail")]
		public async Task<ActionResult<BoardingHouse>> addBoardinghosuegetemail(
			[FromBody] BoardingHouse boardingHouse, 
			[FromQuery] int room_Number,
			[FromQuery] int room_Size, 
			[FromQuery] decimal price_Per_Month, 
			string email, 
			[FromQuery] string descriptions, 
			[FromQuery] bool is_Available = false)
		{

			if (string.IsNullOrWhiteSpace(email))
			{
				return BadRequest(new { message = "Email is required." });
			}

			var user = await _userManager.FindByEmailAsync(email);
			if (user == null)
			{
				return NotFound(new { message = "User with the provided email not found." });
			}

			var tenantId = user.Id;

			try
			{
				BoardingHouse boardingHouse1 = new()
				{
					RoomNumber = room_Number,
					RoomSize = room_Size,
					Descriptions = descriptions,
					PricePerMonth = price_Per_Month,
					TenantId = tenantId,
					IsAvailble = is_Available
				};

				if (await _appDbContext.Users.FindAsync(tenantId) == null)
				{
					return NotFound(new { message = "The provided user ID does not exist in the system." });
				}

				await _appDbContext.BoardingHouses.AddAsync(boardingHouse1);
				await _appDbContext.SaveChangesAsync();


				return CreatedAtAction(nameof(getBoardingHouseById), new { id = boardingHouse.BoardinghouseId }, boardingHouse);
			}
			catch (Exception ex)
			{
				return StatusCode(500, new { message = "Internal server error.", error = ex.InnerException?.Message ?? ex.Message });
			}
		}

        [HttpPost("Tenant-Add-BoardingHouse-getemail-New/{email}")]
        public async Task<IActionResult> addBoardinghosuegetemails(BoardingHouse boardingHouse, string email)
        {

            if (string.IsNullOrWhiteSpace(email))
            {
                return BadRequest(new { message = "Email is required." });
            }

            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                return NotFound(new { message = "User with the provided email not found." });
            }

            var tenantId = user.Id;

            try
            {
                BoardingHouse boardingHouse1 = new()
                {
                    RoomNumber = boardingHouse.RoomNumber,
                    RoomSize = boardingHouse.RoomSize,
                    Descriptions = boardingHouse.Descriptions,
                    PricePerMonth = boardingHouse.PricePerMonth,
                    TenantId = tenantId,
                    IsAvailble = boardingHouse.IsAvailble
                };

                if (await _appDbContext.Users.FindAsync(tenantId) == null)
                {
                    return NotFound(new { message = "The provided user ID does not exist in the system." });
                }

                await _appDbContext.BoardingHouses.AddAsync(boardingHouse1);
                await _appDbContext.SaveChangesAsync();


                return CreatedAtAction(nameof(getBoardingHouseById), new { id = boardingHouse.BoardinghouseId }, boardingHouse);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Internal server error.", error = ex.InnerException?.Message ?? ex.Message });
            }
        }

        [HttpPost("Tenant-Add-BoardingHouse-getemail-withoutemail")]
        public async Task<IActionResult> addBoardinghosuegetemailss(BoardingHouse boardingHouse, string email)
        {

            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                return NotFound(new { message = "User with the provided email not found." });
            }

            var tenantId = user.Id;

            try
            {
                BoardingHouse boardingHouse1 = new()
                {
                    RoomNumber = boardingHouse.RoomNumber,
                    RoomSize = boardingHouse.RoomSize,
                    Descriptions = boardingHouse.Descriptions,
                    PricePerMonth = boardingHouse.PricePerMonth,
                    TenantId = tenantId,
                    IsAvailble = boardingHouse.IsAvailble
                };

                if (await _appDbContext.Users.FindAsync(tenantId) == null)
                {
                    return NotFound(new { message = "The provided user ID does not exist in the system." });
                }

                await _appDbContext.BoardingHouses.AddAsync(boardingHouse1);
                await _appDbContext.SaveChangesAsync();


                return CreatedAtAction(nameof(getBoardingHouseById), new { id = boardingHouse.BoardinghouseId }, boardingHouse);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Internal server error.", error = ex.InnerException?.Message ?? ex.Message });
            }
        }

        [HttpPut("Tenant-Update-BoardingHouse")]
		public async Task<ActionResult> UpdateTenantBoardingHouse([FromBody] BoardingHouse boardingHouse,
			[FromQuery] int id,
            [FromQuery] int room_Number,
            [FromQuery] int room_Size,
            [FromQuery] decimal price_Per_Month,
            string email,
            [FromQuery] string descriptions,
            [FromQuery] bool is_Available = false)
        {

            if (string.IsNullOrWhiteSpace(email))
            {
                return BadRequest(new { message = "Email is required." });
            }

            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                return NotFound(new { message = "User with the provided email not found." });
            }

            var tenantId = user.Id;

            try
            {
                BoardingHouse boardingHouse1 = new()
                {
					BoardinghouseId = id,
                    RoomNumber = room_Number,
                    RoomSize = room_Size,
                    Descriptions = descriptions,
                    PricePerMonth = price_Per_Month,
                    TenantId = tenantId,
                    IsAvailble = is_Available
                };

                if (await _appDbContext.Users.FindAsync(tenantId) == null)
                {
                    return NotFound(new { message = "The provided user ID does not exist in the system." });
                }

                _appDbContext.BoardingHouses.Update(boardingHouse1);
                await _appDbContext.SaveChangesAsync();


				return Ok(new { message = "Data updated", boardingHouse = boardingHouse1 });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Internal server error.", error = ex.InnerException?.Message ?? ex.Message });
            }
        }

        [HttpPut("Tenant-Update-BoardingHouse-New-Update")]
        public async Task<ActionResult> UpdateTenantBoardingHouseNew(BoardingHouse boardingHouse)
        {
                _appDbContext.BoardingHouses.Update(boardingHouse);
                await _appDbContext.SaveChangesAsync();


			return Ok(new { message = "Data updated" });
        }

        [HttpGet("Get-Tenant-BoardingHouse/{email}")]
		public async Task<ActionResult> GetTenantBoardinghouse(string email)
		{
			var user = await _userManager.FindByEmailAsync(email);

			var UserId = user?.Id;

			var tenantBoardinghouse = await (from s in _appDbContext.BoardingHouses
											 where s.TenantId == UserId
											 select s).ToListAsync();

			return Ok(tenantBoardinghouse);
		}

		[HttpGet("UserBased")]
		//[Authorize(Roles = "Tenant")]
		public async Task<IActionResult> GetTenantServices()
		{
			var tenant = _userManager.GetUserAsync(User);
			if (tenant == null) return Unauthorized();

			var services = await (from s in _appDbContext.BoardingHouses
								  where s.TenantId.ToString() == tenant.Id.ToString() 
								  select s).ToListAsync();

			return Ok(services);
		}

		[HttpPut("{serviceId}")]
		[Authorize(Roles = "Tenant")]
		public async Task<IActionResult> UpdateService(int serviceId, [FromBody] BoardingHouse boardingHouse)
		{
			var tenant = await _userManager.GetUserAsync(User);

			if (tenant == null) return Unauthorized();

			var service = await _appDbContext.BoardingHouses
				.Where(s => s.BoardinghouseId == serviceId && s.TenantId == tenant.Id)
				.FirstOrDefaultAsync();

			if (service == null)
			{
				return NotFound("Service not found or you do not have access.");
			}

			_appDbContext.BoardingHouses.Update(service);
			await _appDbContext.SaveChangesAsync();

			return Ok(service);
		}

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBoardinghouse(int id)
        {
            var boardinghouse = await _appDbContext.BoardingHouses.FindAsync(id);

            if (boardinghouse == null)
            {
                return NotFound("Boardinghouse not found.");
            }

			_appDbContext.BoardingHouses.Remove(boardinghouse);

            try
            {
                await _appDbContext.SaveChangesAsync();

				return Ok(new { message = "Boarding House Succesfully deleted!" });
            }
            catch (DbUpdateException ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError,
                    "An error occurred while deleting the record. Please try again.");
            }
        }

		[HttpGet("GetAmenities")]
		public async Task<ActionResult<Amenities>> GetAmenities()
		{
            var amenities = await (from s in _appDbContext.Amenities
                                             select s).ToListAsync();

			return Ok(amenities);
        }

		[HttpPost("Tenant-Add-Amenities")]
		public async Task<ActionResult<Amenities>> AddAmenities(
			[FromBody] Amenities amenities,
			[FromQuery] int boardingHouseId, 
			[FromQuery] string amenityName,
			[FromQuery] decimal amenityPrice)
		{
            if (boardingHouseId <= 0 || string.IsNullOrWhiteSpace(amenityName) || amenityPrice < 0)
            {
                return BadRequest(new { message = "Invalid input data." });
            }

            try
			{
				var amenity = new Amenities
				{
					BoardinghouseId = boardingHouseId,
					Name = amenityName,
					Price = amenityPrice
				};

				await _appDbContext.Amenities.AddAsync(amenity);
				await _appDbContext.SaveChangesAsync();

                return CreatedAtAction(nameof(GetAmenitiesById), new { id = amenity.AmenityId}, amenity);
            }
			catch (Exception ex)
			{
                return StatusCode(500, new { message = "Internal server error.", error = ex.InnerException?.Message ?? ex.Message });
            }
		}

        [HttpGet("Amenities-/{id}")]
        public async Task<ActionResult<BoardingHouse?>> GetAmenitiesById(int id)
        {
            var amenities = await (from b in _appDbContext.Amenities
                            where id == b.AmenityId
                            select b).FirstOrDefaultAsync();

            if (amenities == null)
            {
                return NotFound();
            }

            return Ok(amenities);
        }
    }
}
