using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiBookingApp.Models.Client
{
    public class ClientRequest
    {
        public int ClientRequestId { get; set; }
        public int BoardinghouseId { get; set; }
        public string ClientId { get; set; }
        public DateTime RequestDate { get; set; }
        public string Status { get; set; }
        public string Message { get; set; }
    }
}
