using AspJWTAuth.Data;
using AspJWTAuth.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;

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

		[HttpGet("{userId}")]
		public async Task<ActionResult<IdentityUser>> getTenantById(string userId)
		{
			var tenant = await _userManager.FindByIdAsync(userId);

			if (tenant == null)
			{
				return BadRequest();
			}

			var reult = new
			{
				UserId = tenant.Id,
				UserName = tenant.UserName
			};

			return Ok(reult);
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

		[HttpPost("Tenant-Add-BoardingHouse")]
		public async Task<ActionResult<BoardingHouse>> addBoardinghosue([FromBody] BoardingHouse boardingHouse, [FromQuery] int room_Number,
			[FromQuery] int room_Size, [FromQuery] decimal price_Per_Month, [FromQuery] string tenantid, [FromQuery] bool is_Available = false)
		{
            //var getuser = await _userManager.GetUserAsync(User);
            //if (getuser == null || !await _userManager.IsInRoleAsync(getuser, "Tenant"))
            //{
            //	return Unauthorized();
            //}

            //boardingHouse.TenantId = getuser.Id;

            try
            {
                boardingHouse.RoomNumber = room_Number;
                boardingHouse.RoomSize = room_Size;
                boardingHouse.PricePerMonth = price_Per_Month;
                boardingHouse.TenantId = tenantid;
                boardingHouse.IsAvailble = is_Available;

             
                _appDbContext.BoardingHouses.Add(boardingHouse);
                await _appDbContext.SaveChangesAsync();

               
                return CreatedAtAction(nameof(getBoardingHouseById), new { id = boardingHouse.BoardinghouseId }, boardingHouse);
            }
            catch (Exception ex)
            {
                
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }


        [HttpPost("Tenant-Add-BoardingHouse-getemail")]
        public async Task<ActionResult<BoardingHouse>> addBoardinghosuegetemail([FromBody] BoardingHouse boardingHouse, [FromQuery] int room_Number,
            [FromQuery] int room_Size, [FromQuery] decimal price_Per_Month, [FromQuery] string email, [FromQuery] bool is_Available = false)
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
                boardingHouse.RoomNumber = room_Number;
                boardingHouse.RoomSize = room_Size;
                boardingHouse.PricePerMonth = price_Per_Month;
				boardingHouse.TenantId = tenantId;
                boardingHouse.IsAvailble = is_Available;
				//user.Id = tenantId;	

                //if (await _appDbContext.Users.FindAsync(tenantId) == null)
                //{
                //    return NotFound(new { message = "The provided user ID does not exist in the system." });
                //}

                _appDbContext.BoardingHouses.Add(boardingHouse);
                await _appDbContext.SaveChangesAsync();


                return CreatedAtAction(nameof(getBoardingHouseById), new { id = boardingHouse.BoardinghouseId }, boardingHouse);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Internal server error.", error = ex.InnerException?.Message ?? ex.Message });
            }
        }

		[HttpGet("Getmail")]
		public async Task<ActionResult> get(string email)
		{
			var ser = await _userManager.FindByEmailAsync(email);
			if (ser == null)
			{
				return NotFound();
			}

			var id = ser.Id;

			return Ok(new { userid = id });
		}
 
        [HttpPost("add")]
		//[Authorize(Roles = "Tenant")]
		public async Task<IActionResult> add([FromBody] BoardingHouse boardingHouse)
		{
			//var tenant = await _userManager.GetUserAsync(User);

			//if (tenant == null) return Unauthorized();

			// Set the tenant ID
			//boardingHouse.TenantId = tenant.Id;

            // Add and save the service
            _appDbContext.BoardingHouses.Add(boardingHouse);
			await _appDbContext.SaveChangesAsync();

            return CreatedAtAction(nameof(getBoardingHouseById), new { id = boardingHouse.BoardinghouseId }, boardingHouse);
        }

		[HttpGet]
		[Authorize(Roles = "Tenant")]
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

			// Update the service details
			//service.Name = updatedService.Name;
			//service.Description = updatedService.Description;
			//service.Price = updatedService.Price;

			_appDbContext.BoardingHouses.Update(service);
			await _appDbContext.SaveChangesAsync();

			return Ok(service);
		}

	}
}
