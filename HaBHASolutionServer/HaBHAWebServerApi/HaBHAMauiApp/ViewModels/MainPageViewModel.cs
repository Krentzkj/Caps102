using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using HaBHAMauiApp.Models;
using HaBHAMauiApp.Services;
using System.Text.Json;

namespace HaBHAMauiApp.ViewModels
{
	public partial class MainPageViewModel : ObservableObject
	{
		[ObservableProperty]
		private RegisterModel registerModel;
		[ObservableProperty]
		private LoginModel loginModel;

		[ObservableProperty]
		private string? userName;
		[ObservableProperty]
		private bool isAuthenticated;

		[ObservableProperty]
		private string? id;

		[ObservableProperty]
		private string? sensor1;

		[ObservableProperty]
		private string? sensor2;

		[ObservableProperty]
		private string? sensor3;


		private readonly ClientService clientService;
		public MainPageViewModel(ClientService clientService)
		{
			this.clientService = clientService;
			RegisterModel = new();
			LoginModel = new();
			IsAuthenticated = false;
			GetUserNameFromSecuredStorage();
		}

		[RelayCommand]
		private async Task Register()
		{
			await clientService.Register(RegisterModel);
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
