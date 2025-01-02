using MauiBookingApp.Models.Authentication;
using MauiBookingApp.Models.Tenant;
using MauiBookingApp.Services;
using System.Text.Json;

namespace MauiBookingApp.Pages.Client;

public partial class ClientNewsFeedPage : ContentPage
{
    //private readonly OwnerBoardingHouseService _ownerBoardingHouseService;
    private readonly ClientBoardersService _clientBoardersService;
	public ClientNewsFeedPage(ClientBoardersService clientBoardersService)
	{
		InitializeComponent();
        _clientBoardersService = clientBoardersService;
        //Task.Run( async () => productListView1.ItemsSource = await _clientBoardersService.CLientNewsFeedAsync() );
	}

    public async Task LoadBoardingHousesWithAmenities()
    {
        try
        {
            ActivityIndicator.IsRunning = true;
            ActivityIndicator.IsVisible = true;

            var data = await _clientBoardersService.CLientNewsFeedAsync();

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

    private async void btnShowBH_Clicked(object sender, EventArgs e)
    {
        await LoadBoardingHousesWithAmenities();
    }

    private async void productListView1_ItemTapped(object sender, ItemTappedEventArgs e)
    {
        var bh = (BoardingHouse)e.Item;
        await Navigation.PushModalAsync(new ClientMakeRequestPage(_clientBoardersService, bh));
    }
}