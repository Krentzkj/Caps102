using AspJWTAuth.Models.Authentication;
using AspJWTAuth.Models.ImageFile;
using AspJWTAuth.Models.TenantModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace AspJWTAuth.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
	{
		public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }
        public DbSet<BoardingHouse> BoardingHouses { get; set; }    
        public DbSet<Amenities> Amenities { get; set; }
        public DbSet<BookingTransaction> BookingTransactions { get; set; }
        public DbSet<ClientRequest> ClientRequests { get; set; }
        public DbSet<ImageFile> ImageFiles {  get; set; }
        public DbSet<Image> Images { get; set; }
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
