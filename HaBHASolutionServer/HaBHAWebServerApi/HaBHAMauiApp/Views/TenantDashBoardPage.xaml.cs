using ApiLibrary;
using HaBHAWebServerApi.Models;

namespace HaBHAMauiApp.Views;

public partial class TenantDashBoardPage : ContentPage
{
	private readonly ApiClientService _apiClientService;
	public TenantDashBoardPage(ApiClientService apiClientService)
	{
		InitializeComponent();
		_apiClientService = apiClientService;
	}

	private async void btnAddUnit_Clicked(object sender, EventArgs e)
	{
		await Navigation.PushModalAsync(new AddAndEditBoardingHousePage(_apiClientService, boardingHouse: null));
    }

	private async void btnShowUnit_Clicked(object sender, EventArgs e)
	{
		await LoadUnits();
    }

	private async void UnitListView_ItemTapped(object sender, ItemTappedEventArgs e)
	{
		var unit = (BoardingHouse)e.Item;
		var action = await DisplayActionSheet("Action", "Cancel", null, "Edit", "Delete");		

		switch (action)
		{
			case "Edit":
				await Navigation.PushModalAsync(new AddAndEditBoardingHousePage(_apiClientService, unit));
				break;
			case "Delete":
				await _apiClientService.DeleteUnit(unit.BoardinghouseId);
				await LoadUnits();
				break;
		}
	}

	private async Task LoadUnits()
	{
		var units = await _apiClientService.GetAllUnits();
		UnitListView.ItemsSource = units;
	}
}