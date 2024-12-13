using HaBHA.ClassLibrary.Models;
using HaBHA.ClassLibrary.Models.Establishments;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;  
using System.Threading.Tasks;

namespace HaBHA.ClassLibrary
{
    public class AppApiClientService
    {
        private readonly HttpClient _httpClient;

        public AppApiClientService(ApiClientOptions apiClientOptions)
        {
            _httpClient = new HttpClient();
            _httpClient.BaseAddress = new System.Uri(apiClientOptions.ApiBaseAddress);
        }

        public async Task<List<BoardingHouse>?> GetBoardingHousesAsync()
        {
            
            return await _httpClient.GetFromJsonAsync<List<BoardingHouse>?>("/api/Tenant/GetAllBoardingHouse");
        }
    }
}
