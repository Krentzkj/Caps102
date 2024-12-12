using App.ApiClient;
using App.ApiClient.Models.ApiModels;
using MauiBookingApp.Models.Authentication;
using System.Runtime.CompilerServices;
using System.Text.Json;

namespace MauiBookingApp.Pages.TenantPage;

public partial class TenantDashboardPage : ContentPage
{
    private readonly AppApiClientService _appApiClientService;
    private BoardingHouse _boardingHouse;

    private string UserName;
    private bool IsAuthenticated;

    public TenantDashboardPage(AppApiClientService appApiClientService, BoardingHouse boardingHouse)
	{
		InitializeComponent();
        _appApiClientService = appApiClientService;
        _boardingHouse = boardingHouse;
        LoadBoardingHouseDetails();
    }
    private void LoadBoardingHouseDetails()
    {
       if (_boardingHouse is not null)
        {
            var serial = SecureStorage.Default.GetAsync("Authentication");
            if (serial != null)
            {
                UserName = JsonSerializer.Deserialize<LoginResponse>(serial.ToString())!.UserName!;
                UserName = txtUsername.Text;
            }
        }
    }
}