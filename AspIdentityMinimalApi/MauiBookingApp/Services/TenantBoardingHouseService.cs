using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiBookingApp.Services
{
    public class TenantBoardingHouseService
    {
        private readonly IHttpClientFactory httpClientFactory;

        public TenantBoardingHouseService(IHttpClientFactory httpClientFactory)
        {
            this.httpClientFactory = httpClientFactory;
        }
    }
}
