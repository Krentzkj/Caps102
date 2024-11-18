using HaBHAWebServerApi.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace HaBHAWebServerApi.Data
{
	public class BookingDbContext : IdentityDbContext
	{
		public BookingDbContext(DbContextOptions<BookingDbContext> options) : base(options) { }

		public DbSet<BoardingHouse> BoardingHouse { get; set;}
		public DbSet<BookingTransaction> Transaction { get; set; }


		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			base.OnModelCreating(modelBuilder);

			// Seed roles
			modelBuilder.Entity<IdentityRole>().HasData(
				new IdentityRole { Id = "1", Name = "SuperAdmin", NormalizedName = "SUPERADMIN" },
				new IdentityRole { Id = "2", Name = "Tenant", NormalizedName = "TENANT" },
				new IdentityRole { Id = "3", Name = "Client", NormalizedName = "CLIENT" }
			);
		}
	}
}
