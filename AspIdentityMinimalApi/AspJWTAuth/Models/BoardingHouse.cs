using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace AspJWTAuth.Models;

public partial class BoardingHouse
{
    [Key]
    public int BoardinghouseId { get; set; }
    public int? RoomNumber { get; set; }
    //public string? UserEmail { get; set; } // temp
    public int? RoomSize { get; set; }
    [Column(TypeName = "decimal(18, 2)")]
    public decimal? PricePerMonth { get; set; }
    public bool IsAvailble { get; set; }
    public string? Descriptions { get; set; }
    public string? TenantId { get; set; }

    //public virtual IdentityUser? Tenant { get; set; }

    //public ICollection<Amenities>? Amenities { get; set; }
}
