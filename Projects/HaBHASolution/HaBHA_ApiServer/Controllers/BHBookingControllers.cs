using HaBHA_ApiServer.Data;
using HaBHA_ApiServer.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HaBHA_ApiServer.Controllers;

[Route("api/[controller]")]
[ApiController]
public class BHBookingControllers : ControllerBase
{
    private readonly AppDbContext _appDbContext;

    public BHBookingControllers(AppDbContext appDbContext) => _appDbContext = appDbContext;


    [HttpGet("BoardingHouse")]
    public ActionResult<IEnumerable<BoardingHouse>> GetBoardingHouse()
    {
        return _appDbContext.BoardingHouses;
    }

    [HttpGet("Boarders")]
    public ActionResult<IEnumerable<Border>> GetBoarders()
    {
        return _appDbContext.Borders;
    }

    [HttpGet("Payments")]
    public ActionResult<IEnumerable<Payment>> GetPayments()
    {
        return _appDbContext.Payments;
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<BoardingHouse>> GetBoardingHouseById(int id)
    {
        return await _appDbContext.BoardingHouses.Where(x => x.BhId == id).SingleOrDefaultAsync();
    }

    [HttpPost]
    public async Task<ActionResult> CreateBoardingHouse(BoardingHouse boardingHouse)
    {
        await _appDbContext.BoardingHouses.AddAsync(boardingHouse);
        await _appDbContext.SaveChangesAsync();

        return CreatedAtAction(nameof(GetBoardingHouseById), new { id = boardingHouse.BhId }, boardingHouse);
    }

    [HttpPut]
    public async Task<ActionResult> UpdateBoardingHouse(BoardingHouse boardingHouse)
    {
        _appDbContext.BoardingHouses.Update(boardingHouse);
        await _appDbContext.SaveChangesAsync();
        return Ok();
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult> DeleteBoardingHouse(int id)
    {
        var BoardingGetById = await GetBoardingHouseById(id);
        if (BoardingGetById.Value is null)
            return NotFound();

        _appDbContext.Remove(BoardingGetById.Value);
        await _appDbContext.SaveChangesAsync();
        return Ok();
    }
}
