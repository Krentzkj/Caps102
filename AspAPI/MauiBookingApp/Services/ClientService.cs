using MauiBookingApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
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

		public async Task Register(RegisterModel model)
		{
			var httpClient = httpClientFactory.CreateClient("custom-httpclient");
			var result = await httpClient.PostAsJsonAsync("/register", model);	
			if (result.IsSuccessStatusCode)
			{
				await Shell.Current.DisplayAlert("Alert", "sucessfully Register", "Ok");
			}
			await Shell.Current.DisplayAlert("Alert", result.ReasonPhrase, "Ok"); ;
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
	}
}
