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
        public DbSet<Amenities> Amenities { get; set; }
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

            //modelBuilder.Entity<BoardingHouse>(entity =>
            //{
            //    entity.HasKey(b => b.BoardinghouseId);

            //    entity.HasOne(b => b.Tenant)
            //        .WithMany()
            //        .HasForeignKey(b => b.TenantId)
            //        .OnDelete(DeleteBehavior.Restrict);

            //    entity.HasMany(b => b.Amenities)
            //        .WithOne(a => a.BoardingHouse)
            //        .HasForeignKey(a => a.BoardinghouseId)
            //        .OnDelete(DeleteBehavior.Cascade);
            //});

            // Configure Amenity
            modelBuilder.Entity<Amenities>(entity =>
            {
                entity.HasKey(a => a.AmenityId);

                entity.Property(a => a.Name)
                    .IsRequired()
                    .HasMaxLength(255);
            });
        }
    }
}
