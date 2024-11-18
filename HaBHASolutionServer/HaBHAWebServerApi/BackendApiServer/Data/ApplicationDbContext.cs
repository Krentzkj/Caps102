using BackendApiServer.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace BackendApiServer.Data
{
	public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
	{
		public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

		public DbSet<ApplicationUser> applicationUsers { get; set; }
		public DbSet<Booking> bookings { get; set; }
		public DbSet<Service> services { get; set; }

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
