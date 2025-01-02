using AspJWTAuth.Data;
using AspJWTAuth.Models.ApiResponse;
using AspJWTAuth.Models.Authentication;
using AspJWTAuth.Models.ModelsDto;
using AspJWTAuth.Models.TenantModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SendGrid.Helpers.Mail;
using System.Security.Claims;

namespace AspJWTAuth.Controllers.Client
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientAddBookingRequestController : ControllerBase
    {
        private readonly ApplicationDbContext _applicationDbContext;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IConfiguration _configuration;

        public ClientAddBookingRequestController(ApplicationDbContext applicationDbContext, UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, IConfiguration configuration)
        {
            _applicationDbContext = applicationDbContext;
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
        }

        //[HttpPost("AddBookingTransaction")]
        //[Authorize]
        //public async Task<IActionResult> AddBookingTransaction([FromBody] BookingTransactionDto bookingTransactionDto)
        //{
        //    var claimsIdentity = this.User.Identity as ClaimsIdentity;
        //    var userId = claimsIdentity?.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value;

        //    if (string.IsNullOrEmpty(userId)) return Unauthorized("User not authenticated.");

        //    _applicationDbContext.BookingTransactions.Add(bookingTransactionDto);
        //    await _applicationDbContext.SaveChangesAsync();

        //    return Ok(new { Message = "Booking Transaction Created", BookingTransactionId = bookingTransaction.BookingTransactionId });
        //    return CreatedAtAction(nameof(GetBookingTransactionById), new { id = bookingTransactionDto.BookingTransactionId }, bookingTransactionDto);
        //}

        [HttpPost("Client-Make-Request")]
        [Authorize]
        public async Task<ActionResult<ClientRequest>> MakeClientRequest([FromBody] BookingRequestDto requestDto)
        {
            try
            {
                // Get the ClientId from the current user's claims
                var claimsIdentity = this.User.Identity as ClaimsIdentity;
                var clientId = claimsIdentity?.FindFirst(ClaimTypes.Name)?.Value;

                if (string.IsNullOrEmpty(clientId))
                {
                    return Unauthorized(new { message = "User not authenticated." });
                }

                // Check if the boarding house exists
                //var boardingHouseExists = await _applicationDbContext.BoardingHouses
                //    .AnyAsync(bh => bh.BoardinghouseId == clientRequest.BoardinghouseId);

                //if (!boardingHouseExists)
                //{
                //    return NotFound(new { message = "Boarding house not found." });
                //}

                // Create a new client request
                var newClientRequest = new ClientRequest
                {
                    BoardinghouseId = requestDto.BoardinghouseId,
                    ClientId = clientId,
                    RequestDate = DateTime.Now, // or clientRequest.RequestDate if provided
                    Status = "Pending", // Default status is 'Pending'
                    Message = requestDto.Message
                };

                // Add the new request to the database
                await _applicationDbContext.ClientRequests.AddAsync(newClientRequest);
                await _applicationDbContext.SaveChangesAsync();

                // Return the created request
                return CreatedAtAction(nameof(GetClientRequestById), new { id = newClientRequest.ClientRequestId }, newClientRequest);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Internal server error.", error = ex.Message });
            }
        }

        [HttpGet("Client-Request/{id}")]
        //[Authorize]
        public async Task<ActionResult<ClientRequest>> GetClientRequestById(int id)
        {
            try
            {
                // Use LINQ to query the database for the ClientRequest with the given id
                var clientRequest = await _applicationDbContext.ClientRequests
                    .Where(cr => cr.ClientRequestId == id)
                    .FirstOrDefaultAsync();

                if (clientRequest == null)
                {
                    return NotFound(new { message = "Client request not found." });
                }

                return Ok(clientRequest);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Internal server error.", error = ex.Message });
            }
        }


        [HttpPost("MakeRequest")]
        [Authorize]
        public async Task<ActionResult> MakeBookingRequest([FromBody] BookingRequestDto requestDto)
        {
            // Get the current client's ID from claims
            var claimsIdentity = this.User.Identity as ClaimsIdentity;
            var clientId = claimsIdentity?.FindFirst(ClaimTypes.NameIdentifier)?.Value;

            if (clientId == null)
            {
                return Unauthorized(new { message = "Unauthorized access." });
            }

            // Check if the boarding house exists
            var boardingHouse = await _applicationDbContext.BoardingHouses.FindAsync(requestDto.BoardinghouseId);
            if (boardingHouse == null)
            {
                return NotFound(new { message = "Boarding house not found." });
            }

            // Create a new booking request
            var bookingRequest = new ClientRequest
            {
                BoardinghouseId = requestDto.BoardinghouseId,
                ClientId = clientId,
                Message = requestDto.Message,
                RequestDate = DateTime.UtcNow,
                Status = "Pending"
            };

            try
            {
                await _applicationDbContext.ClientRequests.AddAsync(bookingRequest);
                await _applicationDbContext.SaveChangesAsync();

                return Ok(new { message = "Booking request submitted successfully.", bookingRequest });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Internal server error.", error = ex.Message });
            }
        }

        [HttpPost("AddBookingTransaction")]
        [Authorize]
        public async Task<IActionResult> AddBookingTransaction([FromBody] BookingTransactionDto bookingTransactionDto)
        {
            var claimsIdentity = this.User.Identity as ClaimsIdentity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.Name)?.Value;

            if (string.IsNullOrEmpty(userId)) return Unauthorized("User not authenticated.");

            var bookingTransaction = new BookingTransaction
            {
                BoardingHouseId = bookingTransactionDto.BoardingHouseId,
                ClientId = userId, 
                BookingDate = DateTime.UtcNow, 
                CheckInDate = bookingTransactionDto.CheckInDate,
                CheckOutDate = bookingTransactionDto.CheckOutDate,
                AmountPaid = bookingTransactionDto.AmountPaid,
                Status = "Pending" 
            };
          
            _applicationDbContext.BookingTransactions.Add(bookingTransaction);
            await _applicationDbContext.SaveChangesAsync();

            var response = new MessageResponse
            {
                Message = "Booking Transaction Created successfully.",
                Success = true,
                Data = bookingTransaction
            };

            return CreatedAtAction(nameof(GetBookingTransactionById), new { id = bookingTransaction.BookingTransactionId }, response); //bookingTransaction 
        }


        [HttpGet("GetBookingTransactionById/{id}")]
        public async Task<IActionResult> GetBookingTransactionById(int id)
        {
            var bookingTransaction = await _applicationDbContext.BookingTransactions
                .Include(bt => bt.BoardingHouse)  
                .Include(bt => bt.Client)         
                .FirstOrDefaultAsync(bt => bt.BookingTransactionId == id);

            if (bookingTransaction == null) return NotFound("Booking transaction not found.");

            return Ok(new
            {
                BookingTransactionId = bookingTransaction.BookingTransactionId,
                BoardingHouseId = bookingTransaction.BoardingHouseId,
                ClientId = bookingTransaction.ClientId,
                BookingDate = bookingTransaction.BookingDate,
                CheckInDate = bookingTransaction.CheckInDate,
                CheckOutDate = bookingTransaction.CheckOutDate,
                Status = bookingTransaction.Status,
                AmountPaid = bookingTransaction.AmountPaid,
                ClientName = bookingTransaction.Client.UserName, 
                BoardingHouseDescription = bookingTransaction.BoardingHouse.Descriptions 
            });
        }

        [HttpGet("GetBookignTransactionsById/{id}")]
        public async Task<ActionResult<BookingTransaction?>> GetBookignTransactionsById(int id)
        {
            var bh = await (from b in _applicationDbContext.BookingTransactions
                            where id == b.BookingTransactionId
                            select b).FirstOrDefaultAsync();

            if (bh == null) return NotFound();

            return Ok(bh);
        }
    }
}
