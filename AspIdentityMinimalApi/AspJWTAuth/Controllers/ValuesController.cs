using AspJWTAuth.Data;
using AspJWTAuth.Models.ImageFile;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AspJWTAuth.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ValuesController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpPost("NewImageupload")]
        public async Task<IActionResult> UploadImage([FromForm] IFormFile file)
        {
            if (file == null || file.Length == 0)
                return BadRequest("File not selected");

            using var memoryStream = new MemoryStream();
            await file.CopyToAsync(memoryStream);

            var imageFile = new Image
            {
                FileName = file.FileName,
                ContentType = file.ContentType,
                ImageData = memoryStream.ToArray()
            };

            _context.Images.Add(imageFile);
            await _context.SaveChangesAsync();

            return Ok(new { imageFile.Id });
        }

        [HttpGet("Image/{id}")]
        public async Task<IActionResult> GetImage(int id)
        {
            var image = await _context.Images.FindAsync(id);

            if (image == null)
                return NotFound();

            return File(image.ImageData, image.ContentType, image.FileName);
        }

    }
}
