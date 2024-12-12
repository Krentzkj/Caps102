using BoardingHouse = MauiBookingApp.Models.Tenant.BoardingHouse;
using MauiBookingApp.Models.Authentication;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace MauiBookingApp.Services
{
    public class ClientService
	{
		private readonly IHttpClientFactory httpClientFactory;
		public ClientService(IHttpClientFactory httpClientFactory)
		{
			this.httpClientFactory = httpClientFactory;
		}

        //public async Task Register(RegisterModel model)
        //{
        //	var httpClient = httpClientFactory.CreateClient("custom-httpclient");
        //	var result = await httpClient.PostAsJsonAsync("/register", model);	
        //	if (result.IsSuccessStatusCode)
        //	{
        //		await Shell.Current.DisplayAlert("Alert", "sucessfully Register", "Ok");
        //	}
        //	await Shell.Current.DisplayAlert("Alert", result.ReasonPhrase, "Ok");
        //}
        public async Task Register(RegisterModel model)
        {
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");

            try
            {
                var result = await httpClient.PostAsJsonAsync("/register", model);

                if (result.IsSuccessStatusCode)
                {
                    await Shell.Current.DisplayAlert("Success", "Successfully registered!", "Ok");
                }
                else
                {
                    await Shell.Current.DisplayAlert("Error", $"Failed to register: {result.ReasonPhrase}", "Ok");
                }
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", $"An unexpected error occurred: {ex.Message}", "Ok");
            }
        }
        

		public async Task Login(LoginModel model)
		{
			var httpClient = httpClientFactory.CreateClient("custom-httpclient");
			var result = await httpClient.PostAsJsonAsync("/login", model);
			var response = await result.Content.ReadFromJsonAsync<LoginResponse>();
			if (response is not null)
			{
				var serializeResponse = JsonSerializer.Serialize(
					new LoginResponse() { AccessToken = response.AccessToken, RefreshToken = response.RefreshToken, UserName = model.Email });
				await SecureStorage.Default.SetAsync("Authentication", serializeResponse);
			}
		}
		public async Task AsignRoles(UserRole userRole)
		{
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");
            var result = await httpClient.PostAsJsonAsync("/api/Roles/AssignRoleByEmail", userRole);
            if (result.IsSuccessStatusCode)
            {
                await Shell.Current.DisplayAlert("Alert", "sucessfully Assign Role", "Ok");
            }
            await Shell.Current.DisplayAlert("Alert", result.ReasonPhrase, "Ok");

        }
		public async Task ConfirmEmail(EmailConfirmation emailConfirmation)
		{
			var httpClient = httpClientFactory.CreateClient("custom-httpclient");
			var result = await httpClient.PostAsJsonAsync("/confirmEmail", emailConfirmation);
			var response = await result.Content.ReadFromJsonAsync<EmailConfirmation>();
			
			if (result is not null)
			{
				var seresponse = JsonSerializer.Serialize(
					new EmailConfirmation() { UserId = response.UserId, Code = response.Code });
			}
		}
		public async Task TenantAddBoardingHouse(BoardingHouse boardingHouse)
		{
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");
            var result = await httpClient.PostAsJsonAsync("/api/Roles/AssignRoleByEmail", boardingHouse);
            if (result.IsSuccessStatusCode)
            {
                await Shell.Current.DisplayAlert("Alert", "sucessfully Assign Role", "Ok");
            }
            await Shell.Current.DisplayAlert("Alert", result.ReasonPhrase, "Ok");
        }


        //public async Task<List<BoardingHouse> GetTenantBoardingHouse()
        //{
        //	var httpClient = httpClientFactory.CreateClient("custom-httpclient");
        //var result = await httpClient.GetFromJsonAsync<List<BoardingHouse>("/api/Tenant/Get-Tenant-BoardingHouse");
        //	if (result.IsSuccessStatusCode)
        //	{

        //	}
        //	await Shell.Current.DisplayAlert("Alert", result.ReasonPhrase, "Ok");
        //}

        //public async Task<List<BoardingHouse>?> GetProducts()
        //{
        //    return await httpClientFactory.GetFromJsonAsync<List<BoardingHouse>?>("/api/Tenant/Get-Tenant-BoardingHouse");
        //}

        public async Task<List<BoardingHouse>?> GetAllTenantsAsync()
        {
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");

            try
            {
                var response = await httpClient.GetAsync("/api/Tenant/Getall");

                if (response.IsSuccessStatusCode)
                {
                    var tenants = await response.Content.ReadFromJsonAsync<List<BoardingHouse>>();
                    //await Shell.Current.DisplayAlert("Success", "Tenants retrieved successfully!", "Ok");
                    return tenants;
                }
                else
                {
                    await Shell.Current.DisplayAlert("Error", $"Failed to fetch tenants: {response.ReasonPhrase}", "Ok");
                    return null;
                }
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", $"An error occurred: {ex.Message}", "Ok");
                return null;
            }
        }

        public async Task<bool> DeleteTenantAsync(int tenantId)
        {
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");

            try
            {

                var response = await httpClient.DeleteAsync($"/api/Tenant/{tenantId}");

                if (response.IsSuccessStatusCode)
                {
                    await Shell.Current.DisplayAlert("Success", "Tenant deleted successfully!", "OK");
                    return true;
                }
                else
                {

                    await Shell.Current.DisplayAlert("Error", $"Failed to delete tenant: {response.ReasonPhrase}", "OK");
                    return false;
                }
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
                return false;
            }
        }


        public async Task<List<BoardingHouse>?> GetAllTenantsByEmailAsync(string email)
        {
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");

            try
            {
                var response = await httpClient.GetAsync($"/api/Tenant/Get-Tenant-BoardingHouse?status={Uri.EscapeDataString(email)}");

                if (response.IsSuccessStatusCode)
                {
                    var tenants = await response.Content.ReadFromJsonAsync<List<BoardingHouse>>();
                   // await Shell.Current.DisplayAlert("Success", "Tenants retrieved successfully!", "Ok");
                    return tenants;
                }
                else
                {
                   // await Shell.Current.DisplayAlert("Error", $"Failed to fetch tenants: {response.ReasonPhrase}", "Ok");
                    return null;
                }
            }
            catch (Exception ex)
            {
                //await Shell.Current.DisplayAlert("Error", $"An error occurred: {ex.Message}", "Ok");
                return null;
            }
        }

        public async Task<bool> UpdateBoardingHouseAsync(int id, int roomNumber, int roomSize, decimal pricePerMonth, string email, string descriptions, bool isAvailable)
        {
            var httpClient = httpClientFactory.CreateClient("custom-httpclient");

            try
            {
                var queryString = $"?id={id}&room_Number={roomNumber}&room_Size={roomSize}&price_Per_Month={pricePerMonth}&email={Uri.EscapeDataString(email)}&descriptions={Uri.EscapeDataString(descriptions)}&is_Available={isAvailable}";

                var response = await httpClient.GetAsync($"/api/Tenant/Tenant-Update-BoardingHouse{queryString}");

                if (response.IsSuccessStatusCode)
                {
                    await Shell.Current.DisplayAlert("Success", "Boarding house updated successfully!", "OK");
                    return true;
                }
                else
                {
                    await Shell.Current.DisplayAlert("Error", $"Failed to update boarding house: {response.ReasonPhrase}", "OK");
                    return false;
                }
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
                return false;
            }
        }


        //public async Task<List<BoardingHouse>?> GetAllTenantsAsync(string status)
        //{
        //    var httpClient = httpClientFactory.CreateClient("custom-httpclient");

        //    try
        //    {
        //var response = await httpClient.GetAsync($"/api/Tenant/Getall?status={Uri.EscapeDataString(status)}");

        //        if (response.IsSuccessStatusCode)
        //        {
        //            var tenants = await response.Content.ReadFromJsonAsync<List<BoardingHouse>>();
        //            await Shell.Current.DisplayAlert("Success", "Tenants retrieved successfully!", "Ok");
        //            return tenants;
        //        }
        //        else
        //        {
        //            await Shell.Current.DisplayAlert("Error", $"Failed to fetch tenants: {response.ReasonPhrase}", "Ok");
        //            return null;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        await Shell.Current.DisplayAlert("Error", $"An error occurred: {ex.Message}", "Ok");
        //        return null;
        //    }
        //}

        //public async Task<List<BoardingHouse>?> GetAllTenantsAsync(string status, string location)
        //{
        //    var httpClient = httpClientFactory.CreateClient("custom-httpclient");

        //    try
        //    {
        //        // Include multiple parameters in the query string
        //        var queryString = $"?status={Uri.EscapeDataString(status)}&location={Uri.EscapeDataString(location)}";
        //        var response = await httpClient.GetAsync($"/api/Tenant/Getall{queryString}");

        //        if (response.IsSuccessStatusCode)
        //        {
        //            var tenants = await response.Content.ReadFromJsonAsync<List<BoardingHouse>>();
        //            await Shell.Current.DisplayAlert("Success", "Tenants retrieved successfully!", "Ok");
        //            return tenants;
        //        }
        //        else
        //        {
        //            await Shell.Current.DisplayAlert("Error", $"Failed to fetch tenants: {response.ReasonPhrase}", "Ok");
        //            return null;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        await Shell.Current.DisplayAlert("Error", $"An error occurred: {ex.Message}", "Ok");
        //        return null;
        //    }
        //}

    }
}
