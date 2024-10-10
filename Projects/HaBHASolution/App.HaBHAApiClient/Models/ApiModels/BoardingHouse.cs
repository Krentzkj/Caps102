using System;
using System.Collections.Generic;
using System.Text;

namespace App.HaBHAApiClient.Models.ApiModels
{
    public class BoardingHouse
    {
        public int BhId { get; set; }

        public int Id { get; set; }

        public string? Descriptions { get; set; }

        public string? Roomsize { get; set; }

        public string? Locations { get; set; }

        public string? Amenities { get; set; }
    }
}
