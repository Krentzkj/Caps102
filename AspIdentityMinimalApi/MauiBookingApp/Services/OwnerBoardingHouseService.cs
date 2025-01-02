using MauiBookingApp.Models.Authentication;
using MauiBookingApp.Models.Images;
using MauiBookingApp.Models.Tenant;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text.Json;

namespace MauiBookingApp.Services
{
    public class OwnerBoardingHouseService
    {
        private readonly IHttpClientFactory httpClientFactory;

        public OwnerBoardingHouseService(IHttpClientFactory httpClientFactory)
        {
            this.httpClientFactory = httpClientFactory;
        }

        public async Task Login(LoginModel model)
        {
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");
            var result = await httpClient.PostAsJsonAsync("/api/Account/login", model);
            var response = await result.Content.ReadFromJsonAsync<LoginResponse>();
            if (response is not null)
            {
                var serializeResponse = JsonSerializer.Serialize(
                    new LoginResponse() { Token = response.Token, UserName = model.Email });
                await SecureStorage.Default.SetAsync("Authentication", serializeResponse);
            }
        }

        public async Task DeleteOwnerBoardingHouseAsync(int tenantId, string? token)
        {
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");

            try
            {
                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

                var response = await httpClient.DeleteAsync($"/api/Tenant/{tenantId}");

                if (response.IsSuccessStatusCode)
                {
                    await Shell.Current.DisplayAlert("Success", "Tenant deleted successfully!", "OK");
                }
                else
                {

                    //await Shell.Current.DisplayAlert("Error", $"Failed to delete tenant: {response.ReasonPhrase}", "OK");
                }
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }
        }

        public async Task UpdateOwnerBoardingHouseAsync(BoardingHouse boardingHouse, string? token)
        {
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");

            try
            {
                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

                var response = await httpClient.PutAsJsonAsync("/api/Tenant/Tenant-Update-BoardingHouse", boardingHouse);

                if (response.IsSuccessStatusCode)
                {
                    //await Shell.Current.DisplayAlert("Success", "Boarding house updated successfully!", "OK");
                }
                else
                {
                   // await Shell.Current.DisplayAlert("Error", $"Failed to update boarding house: {response.ReasonPhrase}", "OK");
                }
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }
        }

        public async Task AddOwnerBoardingHouseAsync(BoardingHouse boardingHouse, string? token)
        {
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");

            try
            {
                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

                var response = await httpClient.PostAsJsonAsync("/api/OwnerBoardingHouseManagement/Owner-Add-BoardingHouse-getemail", boardingHouse);

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
        }

        public async Task<List<BoardingHouse>?> GetOwnerBoardingHousesWithAmenitiesAsync(string? token)
        {
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");

            try
            {
                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

                //var response = await httpClient.GetAsync("/api/OwnerBoardingHouseManagement/GetOwnerBoardingHousesWithAmenities");
                var response = await httpClient.GetAsync("/api/OwnerBoardingHouseManagement/Get-Owner-BoardingHouse");

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

        public async Task UploadImageAsync(ImageFile imageFile)
        {
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");

            try
            {
                var response = await httpClient.PostAsJsonAsync("/api/OwnerBoardingHouseManagement/New-Imafe/upload", imageFile);

                if (response.IsSuccessStatusCode)
                {
                    await Shell.Current.DisplayAlert("Success", "Image uploaded successfully!", "OK");
                }
                else
                {
                    //await Shell.Current.DisplayAlert("Error", $"Failed to upload image: {response.ReasonPhrase}", "OK");
                }
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }
        }

    }
}
