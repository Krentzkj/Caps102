using System;
using System.Collections.Generic;
using System.Text;

namespace App.ApiClient.Models.ApiModels
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
