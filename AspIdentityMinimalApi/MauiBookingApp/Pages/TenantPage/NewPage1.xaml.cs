using App.ApiClient;
using MauiBookingApp.Models.Authentication;
using MauiBookingApp.ViewModels;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace MauiBookingApp.Pages.TenantPage;

public partial class NewPage1 : ContentPage
{
	private readonly AppApiClientService _appApiClientService;
    private string UserName;

    public NewPage1(AppApiClientService appApiClientService)
	{
		InitializeComponent();
		_appApiClientService = appApiClientService;
	}

    //  private async void btnShowProducts_Clicked(object sender, EventArgs e)
    //  {
    //await LoadBordingHouse();
    //  }

    //private async Task LoadBordingHouse()
    //{
    //	var data = await _appApiClientService.GetBoardingHouse();
    //       productListView.ItemsSource = data;

    //   }
    //private async Task LoadBoardingHouseByEmail()
    //{

    //	var sr = await SecureStorage.Default.GetAsync("Authentication");
    //	if(sr != null)
    //	{
    //           UserName = JsonSerializer.Deserialize<LoginResponse>(sr)!.UserName!;
    //       }

    //	var data1 = await _appApiClientService.GetBoardingHouseEmail(UserName);
    //	productListView1.ItemsSource = data1;
    //}

    private async Task LoadBoardingHouseByEmail()
    {
        try
        {
            ActivityIndicator.IsRunning = true;
            ActivityIndicator.IsVisible = true;

            var sr = await SecureStorage.Default.GetAsync("Authentication");
            if (sr != null)
            {
                UserName = JsonSerializer.Deserialize<LoginResponse>(sr)!.UserName!;
            }

            var data1 = await _appApiClientService.GetBoardingHouseEmail(UserName);
            productListView1.ItemsSource = data1;
        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
        }
        finally
        {
            ActivityIndicator.IsRunning = false;
            ActivityIndicator.IsVisible = false;
        }
    }

    private async void btnAddemail_Clicked(object sender, EventArgs e)
    {
		await LoadBoardingHouseByEmail();
    }

    private async Task LoadBoardingHouseByEmails()
    {
        try
        {
            // Show the activity indicator
            ActivityIndicator.IsRunning = true;
            ActivityIndicator.IsVisible = true;

            // Retrieve authentication token from SecureStorage
            var sr = await SecureStorage.Default.GetAsync("Authentication");
            string token = string.Empty;
            string userName = string.Empty;

            if (!string.IsNullOrEmpty(sr))
            {
                var loginResponse = JsonSerializer.Deserialize<LoginResponse>(sr);
                if (loginResponse != null)
                {
                    token = loginResponse.AccessToken; // Assuming "Token" contains the JWT
                    userName = loginResponse.UserName!;
                }
            }

            if (string.IsNullOrEmpty(token))
            {
                await DisplayAlert("Error", "Authentication token not found. Please log in again.", "OK");
                return;
            }

            if (string.IsNullOrEmpty(userName))
            {
                await DisplayAlert("Error", "User information not found. Please log in again.", "OK");
                return;
            }

            var data = await _appApiClientService.GetBoardingHouseEmail(userName, token);

            productListView1.ItemsSource = data;
        }
        catch (Exception ex)
        {

            await DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
        }
        finally
        {
            ActivityIndicator.IsRunning = false;
            ActivityIndicator.IsVisible = false;
        }
    }

}