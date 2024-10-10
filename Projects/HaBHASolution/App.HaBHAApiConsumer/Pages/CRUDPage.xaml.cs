using App.HaBHAApiClient;
using App.HaBHAApiClient.Models.ApiModels;
using App.HaBHAApiConsumer.Pages;

namespace App.HaBHAApiConsumer.Pages;

public partial class CRUDPage : ContentPage
{
    private readonly ApiClientService _apiClient;
	public CRUDPage(ApiClientService apiClients)
	{
		InitializeComponent();

        _apiClient = apiClients;
	}

    private async void btnadd_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushModalAsync(new EditPage(_apiClient, null));
    }

    private async void btnShowBoardingHouse_Clicked(object sender, EventArgs e)
    {
        await LoadBoardingHouse();
    }
    private async void BoardingHouseListView_ItemTapped(object sender, ItemTappedEventArgs e)
    {
        var boardingHouse = (BoardingHouse)e.Item;
        var action = await DisplayActionSheet("Action", "Cancel", null, "Edit", "Delete");

        switch (action)
        {
            case "Edit":
                await Navigation.PushModalAsync(new EditPage(_apiClient, boardingHouse));
                break;
            case "Delete":
                await _apiClient.DeleteBoardingHouse(boardingHouse.BhId);
                await LoadBoardingHouse();
                break;
        }
    }

    private async Task LoadBoardingHouse()
    {
        var boardingHouse = await _apiClient.GetBoardingHouse();
        BoardingHouseListView.ItemsSource = boardingHouse;
    }
}