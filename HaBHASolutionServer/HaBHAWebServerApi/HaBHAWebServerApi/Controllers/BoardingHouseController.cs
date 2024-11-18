using HaBHAWebServerApi.Data;
using HaBHAWebServerApi.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HaBHAWebServerApi.Controllers;

[Route("api/[controller]")]
[ApiController]
public class BoardingHouseController : ControllerBase
{
	private readonly BookingDbContext _haBHADbContext;

	public BoardingHouseController(BookingDbContext haBHADbContext)
	{
		_haBHADbContext = haBHADbContext;
	}

	[HttpGet("GetAllUnits")]
	public ActionResult<IEnumerable<BoardingHouse>> GetboardingHouses()
	{
		return _haBHADbContext.BoardingHouse;
	}

	[HttpGet("{id}")]
	public async Task<ActionResult<BoardingHouse?>> GetBoardinghouseById(int id)
	{
		return await _haBHADbContext.BoardingHouse.Where(x => x.BoardinghouseId == id).SingleOrDefaultAsync();
	}

	[HttpPut("UpdateUnit")]
	public async Task<ActionResult> UpdateBoardinghouse(BoardingHouse boardinghouse)
	{
		_haBHADbContext.BoardingHouse.Update(boardinghouse);
		await _haBHADbContext.SaveChangesAsync();
		return Ok();
	}

	[HttpPost("SaveUnit")]
	public async Task<ActionResult> PostBoardinghouse(BoardingHouse boardinghouse)
	{
		await _haBHADbContext.BoardingHouse.AddAsync(boardinghouse);
		await _haBHADbContext.SaveChangesAsync();

		return CreatedAtAction(nameof(GetBoardinghouseById), new { id = boardinghouse.BoardinghouseId }, boardinghouse);
	}

	[HttpDelete("DeleteUnit/{id}")]
	public async Task<IActionResult> DeleteBoardinghouse(int id)
	{
		var GetBoardinghouseByIdResult = await GetBoardinghouseById(id);
		if (GetBoardinghouseByIdResult.Value is null)
			return BadRequest();

		_haBHADbContext.Remove(GetBoardinghouseByIdResult.Value);
		await _haBHADbContext.SaveChangesAsync();
		return Ok();
	}

	private bool BoardinghouseExists(int id)
	{
		return _haBHADbContext.BoardingHouse.Any(e => e.BoardinghouseId == id);
	}
}
