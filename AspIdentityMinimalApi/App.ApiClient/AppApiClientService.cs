using App.ApiClient.Models;
using App.ApiClient.Models.ApiModels;
using App.ApiClient.Models.ApiModels.Authentication;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;

namespace App.ApiClient
{
    public class AppApiClientService
    {   
        private readonly HttpClient _httpClient;

        public AppApiClientService(ApiClientOptions apiClientOptions)
        {
            _httpClient = new HttpClient();
            _httpClient.BaseAddress = new System.Uri(apiClientOptions.ApiBaseAddress);
        }

        public async Task AddRoles(UserRole userRole)       
        {
            await _httpClient.PostAsJsonAsync("/api/Roles/AssignRoleByEmail", userRole);
        }

        public async Task AddBoardingHouse(BoardingHouse boardingHouse, string email)
        {
            await _httpClient.PostAsJsonAsync($"/api/Tenant/Tenant-Add-BoardingHouse-getemail-New/{email}", boardingHouse);
        }

        //withoutemail
        public async Task AddBoardingHousewithoutemail(BoardingHouse boardingHouse)
        {
            await _httpClient.PostAsJsonAsync($"/api/Tenant/Tenant-Add-BoardingHouse-getemail-withoutemail", boardingHouse);
        }

        public async Task<List<BoardingHouse>?> GetBoardingHouse()
        {
            return await _httpClient.GetFromJsonAsync<List<BoardingHouse>?>("/api/Tenant/Getall");
        }

        public async Task<List<BoardingHouse>?> GetBoardingHouseEmail(string email) 
        {
            return await _httpClient.GetFromJsonAsync<List<BoardingHouse>?>($"/api/Tenant/Get-Tenant-BoardingHouse/{email}");
        }
    }
}
