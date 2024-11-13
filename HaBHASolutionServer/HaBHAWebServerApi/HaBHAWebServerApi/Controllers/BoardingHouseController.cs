using HaBHAWebServerApi.Data;
using HaBHAWebServerApi.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HaBHAWebServerApi.Controllers;

[Route("api/[controller]")]
[ApiController]
public class BoardingHouseController : ControllerBase
{
	private readonly HaBHADbContext _haBHADbContext;

	public BoardingHouseController(HaBHADbContext haBHADbContext)
	{
		_haBHADbContext = haBHADbContext;
	}

	[HttpGet]
	public ActionResult<IEnumerable<BoardingHouse>> GetboardingHouses()
	{
		return _haBHADbContext.BoardingHouses;
	}

	[HttpGet("{id}")]
	public async Task<ActionResult<BoardingHouse?>> GetBoardinghouseById(int id)
	{
		return await _haBHADbContext.BoardingHouses.Where(x => x.BoardinghouseId == id).SingleOrDefaultAsync();
	}

	[HttpPut("UpdateBoardingHouse")]
	public async Task<ActionResult> UpdateBoardinghouse(BoardingHouse boardinghouse)
	{
		_haBHADbContext.BoardingHouses.Update(boardinghouse);
		await _haBHADbContext.SaveChangesAsync();
		return Ok();
	}

	[HttpPost]
	public async Task<ActionResult> PostBoardinghouse(BoardingHouse boardinghouse)
	{
		await _haBHADbContext.BoardingHouses.AddAsync(boardinghouse);
		await _haBHADbContext.SaveChangesAsync();

		return CreatedAtAction(nameof(GetBoardinghouseById), new { id = boardinghouse.BoardinghouseId }, boardinghouse);
	}

	[HttpDelete("DeleteBoardingHouse/{id}")]
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
		return _haBHADbContext.BoardingHouses.Any(e => e.BoardinghouseId == id);
	}
}
