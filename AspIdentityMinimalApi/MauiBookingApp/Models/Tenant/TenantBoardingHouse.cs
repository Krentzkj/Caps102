using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiBookingApp.Models.Tenant
{
    public class BoardingHouse
    {
        public int? RoomNumber { get; set; }
        public int? RoomSize { get; set; }
        public decimal? PricePerMonth { get; set; }
        public bool IsAvailble { get; set; }
        public string? Descriptions { get; set; }

    }
}
