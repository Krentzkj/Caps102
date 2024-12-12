using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace AspJWTAuth.Models;

public partial class Blog
{
    [Key]
    public int BlogId { get; set; }

    public string BlogTitle { get; set; } = null!;

    public string BlogDescription { get; set; } = null!;

    public string BlogAuthor { get; set; } = null!;
}
