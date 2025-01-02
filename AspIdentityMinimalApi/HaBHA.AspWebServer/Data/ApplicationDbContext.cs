using HaBHA.AspWebServer.Models.Authentication;
using HaBHA.AspWebServer.Models.Establishments;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace HaBHA.AspWebServer.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options) { }
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
        }
    }
}
