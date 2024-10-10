using HaBHA_ApiServer.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace HaBHA_ApiServer.Data
{
    public class AppDbContext : IdentityDbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public virtual DbSet<BoardingHouse> BoardingHouses { get; set; }
        public virtual DbSet<Border> Borders { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }

    }
}
