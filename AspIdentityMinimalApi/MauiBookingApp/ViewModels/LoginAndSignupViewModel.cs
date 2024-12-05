using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MauiBookingApp.Models;
using MauiBookingApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace MauiBookingApp.ViewModels
{
	public partial class LoginAndSignupViewModel : ObservableObject
	{
		[ObservableProperty]
		private RegisterModel registerModel;
		[ObservableProperty]
		private LoginModel loginModel;
		[ObservableProperty]
		private EmailConfirmation emailConfirmation;

		[ObservableProperty]
		private string? userName;
		[ObservableProperty]
		private bool isAuthenticated;

		private readonly ClientService clientService;
		public LoginAndSignupViewModel(ClientService clientService)
		{
			this.clientService = clientService;
			EmailConfirmation = new();
			RegisterModel = new();
			LoginModel = new();
			IsAuthenticated = false;
			GetUserNameFromSecuredStorage();
		}

		[RelayCommand]
		private async Task Register()
		{
			await clientService.Register(RegisterModel);
			await clientService.ConfirmEmail(EmailConfirmation);
		}

		[RelayCommand]
		private async Task Login()
		{
			await clientService.Login(LoginModel);
			GetUserNameFromSecuredStorage();
		}

		[RelayCommand]
		private async Task Logout()
		{
			SecureStorage.Default.Remove("Authentication");
			IsAuthenticated = false;
			UserName = "Guest";
			await Shell.Current.GoToAsync("..");
		}

		private async void GetUserNameFromSecuredStorage()
		{
			if (!string.IsNullOrEmpty(UserName) && userName! != "Guest")
			{
				IsAuthenticated = true;
				return;
			}
			var serializedLoginResponseInStorage = await SecureStorage.Default.GetAsync("Authentication");
			if (serializedLoginResponseInStorage != null)
			{
				UserName = JsonSerializer.Deserialize<LoginResponse>(serializedLoginResponseInStorage)!.UserName!;
				IsAuthenticated = true;
				return;
			}
			UserName = "Guest";
			IsAuthenticated = false;
		}
	}
}
