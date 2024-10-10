using System;

namespace App.HaBHAApiClient.Models.ApiModels
{
    public class Payment
    {
        public int PaymentId { get; set; }

        public DateTime Dates { get; set; }

        public int? Amount { get; set; }
        public string? PaymentMethod { get; set; }
        public int? ReferenceNumber { get; set; }
    }
}
