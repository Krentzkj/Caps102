using HaBHAWebServerApi.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace HaBHAWebServerApi.Data
{
	public class HaBHADbContext : IdentityDbContext
	{
		public HaBHADbContext(DbContextOptions<HaBHADbContext> options) :base(options) { }

		public DbSet<BoardingHouse> BoardingHouses { get; set; }

		public DbSet<BookingTransaction> BookingTransactions { get; set; }
	}
}
