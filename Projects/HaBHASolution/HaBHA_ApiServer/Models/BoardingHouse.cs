using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace HaBHA_ApiServer.Models;

[Table("BoardingHouse")]
public partial class BoardingHouse
{
    [Key]
    [Column("BH_ID")]
    public int BhId { get; set; }

    [StringLength(255)]
    [Unicode(false)]
    public string? Descriptions { get; set; }

    [StringLength(255)]
    [Unicode(false)]
    public string? Roomsize { get; set; }

    [StringLength(255)]
    [Unicode(false)]
    public string? Locations { get; set; }

    [StringLength(255)]
    [Unicode(false)]
    public string? Amenities { get; set; }
}
