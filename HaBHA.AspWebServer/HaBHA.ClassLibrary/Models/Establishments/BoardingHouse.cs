using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace HaBHA.ClassLibrary.Models.Establishments
{
    public class BoardingHouse
    {
        [Key]
        public int BoardinghouseId { get; set; }
        public int? RoomNumber { get; set; }
        public int? RoomSize { get; set; }
        [Column(TypeName = "decimal(18, 2)")]
        public decimal? PricePerMonth { get; set; }
        public bool IsAvailble { get; set; }
        public string? Descriptions { get; set; }
        public string? TenantId { get; set; }
    }
}
