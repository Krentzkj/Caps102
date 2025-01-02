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

        public async Task<List<BoardingHouse>?> GetBoardingHouseEmail(string email, string token)
        {
            try
            {
                _httpClient.DefaultRequestHeaders.Authorization =
                    new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);

                return await _httpClient.GetFromJsonAsync<List<BoardingHouse>?>($"/api/Tenant/Get-Tenant-BoardingHouse/{email}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return null;
            }
        }

        public async Task<List<BoardingHouse>?> GetBoardingHouseEmails(string email, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);

            return await _httpClient.GetFromJsonAsync<List<BoardingHouse>?>($"/api/Tenant/Get-Tenant-BoardingHouse/{email}");
        }

        public async Task<List<BoardingHouse>?> GetAllBoardingHousesAsync(string token)
        {
            try
            {
                // Add the Bearer token to the Authorization header
                _httpClient.DefaultRequestHeaders.Authorization =
                    new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);

                // Send GET request
                var response = await _httpClient.GetAsync("/api/Tenant/Getall");

                if (response.IsSuccessStatusCode)
                {
                    // Deserialize response to a list of BoardingHouse
                    return await response.Content.ReadFromJsonAsync<List<BoardingHouse>>();
                }
                else
                {
                    Console.WriteLine($"Error: {response.StatusCode} - {response.ReasonPhrase}");
                    return null;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return null;
            }
        }

        
    }
}
