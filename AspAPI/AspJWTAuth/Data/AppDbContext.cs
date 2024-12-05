using AspJWTAuth.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace AspJWTAuth.Data
{
	public class AppDbContext : IdentityDbContext<IdentityUser>
	{
		public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

		public DbSet<Blogs> Blogs { get; set; }

		//public DbSet<BookingTransaction> BookingTransactions { get; set; }

		public DbSet<BoardingHouse> BoardingHouses { get; set; }
		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			base.OnModelCreating(modelBuilder);

           // Seed roles
            modelBuilder.Entity<IdentityRole>().HasData(
                new IdentityRole { Id = "1", Name = "SuperAdmin", NormalizedName = "SUPERADMIN" },
                new IdentityRole { Id = "2", Name = "Tenant", NormalizedName = "TENANT" },
                new IdentityRole { Id = "3", Name = "Client", NormalizedName = "CLIENT" }
            );

           // Define the relationship between BoardingHouse and AspNetUsers
            modelBuilder.Entity<BoardingHouse>()
                .HasOne(b => b.Tenant)  // Navigation property
                .WithMany()  // Assuming one-to-many, adjust if different
                .HasForeignKey(b => b.TenantId)
                .OnDelete(DeleteBehavior.Restrict);  // Adjust delete behavior as needed
        }
    }
}
