using MauiBookingApp.Models.Client;
using MauiBookingApp.Models.Tenant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;

namespace MauiBookingApp.Services
{
    public class ClientBoardersService
    {
        private readonly IHttpClientFactory httpClientFactory;

        public ClientBoardersService(IHttpClientFactory httpClientFactory)
        {
            this.httpClientFactory = httpClientFactory;
        }

        public async Task<List<BoardingHouse>?> CLientNewsFeedAsync()
        {
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");

            try
            {
                //httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

                //var response = await httpClient.GetAsync("/api/OwnerBoardingHouseManagement/GetOwnerBoardingHousesWithAmenities");
                var response = await httpClient.GetAsync("/api/NewsFeelQuery/AvailableBoardingHouseFeed");

                if (response.IsSuccessStatusCode)
                {
                    var boardingHouses = await response.Content.ReadFromJsonAsync<List<BoardingHouse>>();
                    //await Shell.Current.DisplayAlert("Success", "Tenants retrieved successfully!", "Ok");
                    return boardingHouses;
                }
                else
                {
                    //await Shell.Current.DisplayAlert("Error", $"Failed to fetch tenants: {response.ReasonPhrase}", "Ok");
                    return null;
                }
            }
            catch (Exception ex)
            {
                //await Shell.Current.DisplayAlert("Error", $"An error occurred: {ex.Message}", "Ok");
                return null;
            }
        }

        public async Task<List<BoardingHouse>?> CLientSearchFielAsync(decimal price)
        {
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");

            try
            {
                //httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

                //var response = await httpClient.GetAsync("/api/OwnerBoardingHouseManagement/GetOwnerBoardingHousesWithAmenities");
                var response = await httpClient.GetAsync($"/api/Tenant/GetBoardingHousesByPrice/{price}");

                if (response.IsSuccessStatusCode)
                {
                    var boardingHouses = await response.Content.ReadFromJsonAsync<List<BoardingHouse>>();
                    //await Shell.Current.DisplayAlert("Success", "Tenants retrieved successfully!", "Ok");
                    return boardingHouses;
                }
                else
                {
                    //await Shell.Current.DisplayAlert("Error", $"Failed to fetch tenants: {response.ReasonPhrase}", "Ok");
                    return null;
                }
            }
            catch (Exception ex)
            {
                //await Shell.Current.DisplayAlert("Error", $"An error occurred: {ex.Message}", "Ok");
                return null;
            }
        }

        public async Task AddClientRequestAsync(ClientRequest clientRequest, string? token)
        {
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");

            try
            {
                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

                var response = await httpClient.PostAsJsonAsync("/api/ClientAddBookingRequest/Client-Make-Request", clientRequest);

                if (response.IsSuccessStatusCode)
                {
                    //await Shell.Current.DisplayAlert("Success", "Boarding house added successfully!", "OK");
                }
                else
                {
                    //await Shell.Current.DisplayAlert("Error", $"Failed to update boarding house: {response.ReasonPhrase}", "OK");
                }
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }

            //var result = await httpClient.PostAsJsonAsync("/api/Roles/AssignRoleByEmail", boardingHouse);
            //if (result.IsSuccessStatusCode)
            //{
            //    await Shell.Current.DisplayAlert("Alert", "sucessfully Assign Role", "Ok");
            //}
            //await Shell.Current.DisplayAlert("Alert", result.ReasonPhrase, "Ok");
        }
    }
}
