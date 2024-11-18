using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BackendApiServer.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ImageUploadController : ControllerBase
	{
		private readonly string _uploadPath;

		public ImageUploadController()
		{
			// Define upload directory
			_uploadPath = Path.Combine(Directory.GetCurrentDirectory(), "UploadedImages");

			// Ensure the directory exists
			if (!Directory.Exists(_uploadPath))
			{
				Directory.CreateDirectory(_uploadPath);
			}
		}

		[HttpPost("upload")]
		public async Task<IActionResult> UploadImage([FromForm] IFormFile file)
		{
			if (file == null || file.Length == 0)
			{
				return BadRequest("No file was uploaded.");
			}

			if (!file.ContentType.StartsWith("image/"))
			{
				return BadRequest("Only image files are allowed.");
			}

			try
			{
				var fileName = Path.GetFileName(file.FileName);
				var filePath = Path.Combine(_uploadPath, fileName);

				using (var stream = new FileStream(filePath, FileMode.Create))
				{
					await file.CopyToAsync(stream);
				}

				return Ok(new
				{
					Message = "Image uploaded successfully",
					FilePath = filePath
				});
			}
			catch (Exception ex)
			{
				return StatusCode(500, $"Internal server error: {ex.Message}");
			}
		}
	}
}
