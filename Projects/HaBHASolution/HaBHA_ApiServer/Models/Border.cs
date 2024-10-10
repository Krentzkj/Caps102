using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace HaBHA_ApiServer.Models;

public partial class Border
{
    [Key]
    [Column("Borders_Id")]
    public int BordersId { get; set; }

    [StringLength(255)]
    [Unicode(false)]
    public string? ContactNumber { get; set; }

    public int? Age { get; set; }
}
