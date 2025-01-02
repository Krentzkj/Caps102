using MauiBookingApp.Models.Authentication;
using MauiBookingApp.Models.Tenant;
using MauiBookingApp.Services;
using System.Text.Json;

namespace MauiBookingApp.Pages.Owner;

public partial class OwnerDashPage : ContentPage
{
    private readonly OwnerBoardingHouseService _ownerBoardingHouseService;
    public OwnerDashPage(OwnerBoardingHouseService ownerBoardingHouseService)
	{
		InitializeComponent();
        _ownerBoardingHouseService = ownerBoardingHouseService;
	}

    private async Task<string> GetAuthenticationTokenAsync()
    {
        var sr = await SecureStorage.Default.GetAsync("Authentication");
        if (string.IsNullOrEmpty(sr)) return null;

        var loginResponse = JsonSerializer.Deserialize<LoginResponse>(sr);
        return loginResponse?.Token;
    }

    public async Task LoadBoardingHousesWithAmenities()
    {
        try
        {
            //string token = await GetAuthenticationTokenAsync();
            //ActivityIndicator.IsRunning = true;
            //ActivityIndicator.IsVisible = true;

            var sr = await SecureStorage.Default.GetAsync("Authentication");
            string token = string.Empty;

            if (!string.IsNullOrEmpty(sr))
            {
                var loginResponse = JsonSerializer.Deserialize<LoginResponse>(sr);
                if (loginResponse != null)
                {
                    token = loginResponse.Token;

                }
            }

            var data = await _ownerBoardingHouseService.GetOwnerBoardingHousesWithAmenitiesAsync(token);

            productListView.ItemsSource = data;

        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
        }
        finally
        {
            //ActivityIndicator.IsRunning = false;
            //ActivityIndicator.IsVisible = false;
        }

    }

    private async void productListView_ItemTapped(object sender, ItemTappedEventArgs e)
    {
        string token = await GetAuthenticationTokenAsync();
        var boardingHouse = (BoardingHouse)e.Item;
        var action = await DisplayActionSheet("Action", "Cancel", null, "Edit", "Delete");

        switch (action)
        {
            case "Edit":
                await Navigation.PushModalAsync(new OwnerAddEditBoardingHousePage(_ownerBoardingHouseService, boardingHouse));
                break;
            case "Delete":
                await _ownerBoardingHouseService.DeleteOwnerBoardingHouseAsync(boardingHouse.BoardinghouseId, token);
                break;
        }
    }

    private void btnAdd_Clicked(object sender, EventArgs e) 
    {

    }

    private async void btnShowProducts_Clicked(object sender, EventArgs e)
    {
        await LoadBoardingHousesWithAmenities();
    }
}