using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MauiBookingApp.Models.Authentication;
using MauiBookingApp.Pages;
using MauiBookingApp.Pages.TenantPage;
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

		[ObservableProperty]
		private bool loader;

		private readonly ClientService clientService;
		public LoginAndSignupViewModel(ClientService clientService)
		{
			this.clientService = clientService;
			EmailConfirmation = new();
			RegisterModel = new();
			LoginModel = new();
			Loader = false;
			IsAuthenticated = false;
			GetUserNameFromSecuredStorage();
		}

		[RelayCommand]
		private async Task Register()
		{
			await clientService.Register(RegisterModel);
			/*await Shell.Current.GoToAsync(nameof(AssignRolePage));*/ //AssignRolePage
            //await clientService.ConfirmEmail(EmailConfirmation);
			
        }

		[RelayCommand]
		private async Task Login()
		{
			await clientService.Login(LoginModel);
            //await Shell.Current.GoToAsync(nameof(AssignRolePage));
            IsAuthenticated = true;
			if (IsAuthenticated is true)
			{
				var action = Shell.Current.DisplayAlert("Success", "Successfully loggedin!", "Ok");
            }
			else
			{
                await Shell.Current.DisplayAlert("Error", "Credentials Does Not Match!", "Ok");
            }
            GetUserNameFromSecuredStorage();
		}

		[RelayCommand]
		private async Task GotoLoginPage()
		{
			await Shell.Current.GoToAsync(nameof(MainPage));
		}

        [RelayCommand]
        private async Task GotoSignUpPage()
        {
            await Shell.Current.GoToAsync(nameof(SignUpPage));
        }

        [RelayCommand]
		private async Task Logout()
		{
			Loader = true;
            SecureStorage.Default.Remove("Authentication");
			IsAuthenticated = false;
			UserName = "Guest";
			Loader = false;
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
