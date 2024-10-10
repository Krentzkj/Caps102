using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace HaBHA_ApiServer.Models;

[Table("Payment")]
public partial class Payment
{
    [Key]
    [Column("Payment_Id")]
    public int PaymentId { get; set; }

    public DateOnly? Dates { get; set; }

    public int? Amount { get; set; }

    [Column("Payment_Method")]
    [StringLength(255)]
    [Unicode(false)]
    public string? PaymentMethod { get; set; }

    [Column("Reference_Number")]
    public int? ReferenceNumber { get; set; }
}
