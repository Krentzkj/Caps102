using AspJWTAuth.Data;
using AspJWTAuth.Models.Authentication;
using AspJWTAuth.Models.TenantModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using SendGrid.Helpers.Mail;
using System.Security.Claims;

namespace AspJWTAuth.Controllers.OwnerConrtoller
{
    [Route("api/[controller]")]
    [ApiController]
    public class OwnerBoardingHouseManagementController : ControllerBase
    {
        private readonly ApplicationDbContext _applicationDbContext;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IConfiguration _configuration;
        private readonly ILogger<OwnerBoardingHouseManagementController> _logger;

        public OwnerBoardingHouseManagementController(ILogger<OwnerBoardingHouseManagementController> logger, ApplicationDbContext applicationDbContext, UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, IConfiguration configuration)
        {
            _applicationDbContext = applicationDbContext;
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
            _logger = logger;
        }

        [HttpGet("GetBookingTransactions")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<BookingTransaction>>> GetBookingTransactionsByClientId()
        {
            var claimsIdentity = this.User.Identity as ClaimsIdentity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.Name)?.Value;

            var transactions = await (from bt in _applicationDbContext.BookingTransactions
                                      where bt.ClientId == userId
                                      select new
                                      {
                                          bt.BookingTransactionId,
                                          bt.BoardingHouseId,
                                          bt.BookingDate,
                                          bt.CheckInDate,
                                          bt.CheckOutDate,
                                          bt.Status,
                                          bt.AmountPaid,
                                          BoardingHouseName = bt.BoardingHouse.Descriptions 
                                      }).ToListAsync();

            if (transactions == null || !transactions.Any()) return NotFound("No bookings found for this client.");

            return Ok(transactions);
        }

        [HttpPost("Owner-Add-BoardingHouse-getemail")]
        [Authorize]
        public async Task<ActionResult<BoardingHouse>> OwnerAddBoardingHouse(
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

                if (await _applicationDbContext.Users.FindAsync(userId) == null) return NotFound(new { message = "The provided user ID does not exist in the system." });

                await _applicationDbContext.BoardingHouses.AddAsync(boardingHouse1);
                await _applicationDbContext.SaveChangesAsync();

                return CreatedAtAction(nameof(GetOwnerBoardingHouseById), new { id = boardingHouse.BoardinghouseId }, boardingHouse);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Internal server error.", error = ex.InnerException?.Message ?? ex.Message });
            }
        }

        [HttpPut("Owner-Update-BoardingHouse")]
        [Authorize]
        public async Task<ActionResult> OwnerTenantBoardingHouse([FromBody] BoardingHouse boardingHouse)
        {

            var claimsIdentity = this.User.Identity as ClaimsIdentity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.Name)?.Value;

            try
            {

                boardingHouse.TenantId = userId;

                _applicationDbContext.BoardingHouses.Update(boardingHouse);
                await _applicationDbContext.SaveChangesAsync();

                return Ok(new { message = "Data updated", boardingHouse });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Internal server error.", error = ex.InnerException?.Message ?? ex.Message });
            }
        }

        [HttpPut("Owner-Update-BoardingHousenew")]
        [Authorize]
        public async Task<ActionResult> OwnerUpdateBoardingHouse([FromBody] BoardingHouse boardingHouse)
        {
            var claimsIdentity = this.User.Identity as ClaimsIdentity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.Name)?.Value;

            try
            {
                var existingBoardingHouse = await _applicationDbContext.BoardingHouses.FindAsync(boardingHouse.BoardinghouseId);
                if (existingBoardingHouse == null)
                {
                    return NotFound(new { message = "Boarding house not found." });
                }

                if (existingBoardingHouse.TenantId != userId)
                {
                    return Unauthorized(new { message = "You are not authorized to update this boarding house." });
                }

                existingBoardingHouse.RoomNumber = boardingHouse.RoomNumber;
                existingBoardingHouse.RoomSize = boardingHouse.RoomSize;
                existingBoardingHouse.Descriptions = boardingHouse.Descriptions;
                existingBoardingHouse.PricePerMonth = boardingHouse.PricePerMonth;
                existingBoardingHouse.IsAvailble = boardingHouse.IsAvailble;
                existingBoardingHouse.TenantId = userId;

                await _applicationDbContext.SaveChangesAsync();

                return Ok(new { message = "Boarding house updated successfully.", boardingHouse = existingBoardingHouse });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Internal server error.", error = ex.InnerException?.Message ?? ex.Message });
            }
        }


        [HttpGet("BoardingHouse-/{id}")]
        [Authorize]
        public async Task<ActionResult<BoardingHouse?>> GetOwnerBoardingHouseById(int id)
        {
            var bh = await (from b in _applicationDbContext.BoardingHouses
                            where id == b.BoardinghouseId
                            select b).FirstOrDefaultAsync();

            if (bh == null) return NotFound();

            return Ok(bh);
        }

        [HttpGet("Get-Owner-BoardingHouse")]
        [Authorize]
        public async Task<ActionResult> GetOwnerBoardinghouse()
        {
            var claimsIdentity = this.User.Identity as ClaimsIdentity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.Name)?.Value;

            var tenantBoardinghouse = await (from s in _applicationDbContext.BoardingHouses
                                             where s.TenantId == userId
                                             select s).ToListAsync();

            return Ok(tenantBoardinghouse);
        }

        [HttpDelete("{id}")]
        [Authorize]
        public async Task<IActionResult> DeleteBoardinghouse(int id)
        {
            var boardinghouse = await _applicationDbContext.BoardingHouses.FindAsync(id);

            if (boardinghouse == null) return NotFound("Boardinghouse not found.");

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

        // Amenitie Owner Manage

        [HttpGet("GetOwnerBoardingHousesWithAmenities")]
        [Authorize]
        public async Task<IActionResult> GetOwnerBoardingHousesWithAmenities()
        {
            //List<string> logMessages = new List<string>();

            var claimsIdentity = this.User.Identity as ClaimsIdentity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.Name)?.Value;

            //_logger.LogInformation("API Accessed by UserId: {UserId}, Timestamp: {Timestamp}",
            //    userId, DateTime.UtcNow);

            //_logger.LogInformation("Fetching boarding houses and amenities for UserId: {UserId}.", userId);
            //logMessages.Add($"Fetching boarding houses for UserId: {userId} at {DateTime.UtcNow}");
    

            var boardingHouse = await (
                from bh in _applicationDbContext.BoardingHouses
                join a in _applicationDbContext.Amenities
                on bh.BoardinghouseId equals a.BoardinghouseId into amenitiesGroup
                where bh.TenantId == userId
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

            if (boardingHouse == null || !boardingHouse.Any()) return NotFound("No boarding houses found for the specified user.");

            return Ok(new { boardingHouse } ); //logMessages
        }

        [HttpGet("GetOwnerAmenitiesBy/{id}")]
        public async Task<ActionResult<BoardingHouse?>> GetOwnerAmenitiesById(int id)
        {
            var bh = await (from b in _applicationDbContext.Amenities
                            where id == b.AmenityId
                            select b).FirstOrDefaultAsync();

            if (bh == null) return NotFound();

            return Ok(bh);
        }

        [HttpPost("OwnerAddAmenity")]
        public async Task<IActionResult> OwnerAddAmenity([FromBody] Amenities amenity)
        {
            if (amenity == null)
            {
                return BadRequest("Amenity data is required.");
            }

            _applicationDbContext.Amenities.Add(amenity);
            await _applicationDbContext.SaveChangesAsync();

            return CreatedAtAction(nameof(GetOwnerAmenitiesById), new { id = amenity.AmenityId }, amenity);
        }

        [HttpPut("Owner-Update-Amenities")]
        public async Task<ActionResult> OwnerAmenities([FromBody] Amenities amenities)
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

            if (Amenities == null) return NotFound("Boardinghouse not found.");

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

        [HttpPost("New-Imafe/upload")]
        public async Task<IActionResult> UploadImage([FromBody] ImageFile imageFile)
        {
            if (imageFile == null || string.IsNullOrEmpty(imageFile.byteBase64.ToString()))
                return BadRequest("Invalid image data.");

            try
            {
                // Decode Base64 to byte array
                var imageData = Convert.FromBase64String(imageFile.byteBase64.ToString());

                // Example: Save the image to the database
                var uploadedImage = new ImageFile
                {
                    FileName = imageFile.FileName,
                    ContentType = imageFile.ContentType,
                    byteBase64 = imageData
                };

                _applicationDbContext.ImageFiles.Add(uploadedImage);
                await _applicationDbContext.SaveChangesAsync();

                return Ok(new { uploadedImage.Id });
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetImage(int id)
        {
            var imageEntity = await _applicationDbContext.ImageFiles.FindAsync(id);
            if (imageEntity == null)
                return NotFound();

            return File(imageEntity.byteBase64, imageEntity.ContentType, imageEntity.FileName);
        }

        [HttpPost("New-Image-iformfile/upload")]
        public async Task<IActionResult> UploadImage([FromForm] IFormFile imageFile)
        {
            if (imageFile == null || imageFile.Length == 0)
                return BadRequest("Invalid image data.");

            try
            {
                // Convert the IFormFile to a byte array
                using (var memoryStream = new MemoryStream())
                {
                    await imageFile.CopyToAsync(memoryStream);
                    var imageData = memoryStream.ToArray();

                    // Save the image to the database
                    var uploadedImage = new ImageFile
                    {
                        FileName = imageFile.FileName,
                        ContentType = imageFile.ContentType,
                        byteBase64 = imageData
                    };

                    _applicationDbContext.ImageFiles.Add(uploadedImage);
                    await _applicationDbContext.SaveChangesAsync();

                    return Ok(new { uploadedImage.Id });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

    }
}
