using App.HaBHAApiClient;
using App.HaBHAApiClient.Models.ApiModels;

namespace App.HaBHAApiConsumer.Pages;

public partial class EditPage : ContentPage
{
	private readonly ApiClientService _apiClient;
	private BoardingHouse _boardingHouse;
	public EditPage(ApiClientService apiClient, BoardingHouse boardingHouse)
	{
		InitializeComponent();

		_apiClient = apiClient;
		_boardingHouse = boardingHouse;
		LoadBoardingHouses();
	}

	private void LoadBoardingHouses()
	{
		if (_boardingHouse is not null)
		{
			txtDescriptions.Text = _boardingHouse.Descriptions;
            txtLocations.Text = _boardingHouse.Locations;
            txtRoomsize.Text = _boardingHouse.Roomsize;

        }
	}

    private async void btnSave_Clicked(object sender, EventArgs e)
    {
		if (_boardingHouse is not null)
		{
			await _apiClient.SaveBoardingHouse(new BoardingHouse
			{
				Descriptions = txtDescriptions.Text,
				Locations = txtLocations.Text,
				Roomsize = txtRoomsize.Text
			});
		}
		else
		{
			await _apiClient.UpdateBoardingHouse(new BoardingHouse
			{
				//Id = _boardingHouse.BhId,
                Descriptions = txtDescriptions.Text,
				Locations = txtLocations.Text,
				Roomsize = txtRoomsize.Text
			});
		}
		await Navigation.PopModalAsync();
    }

    private async void btnCancel_Clicked(object sender, EventArgs e)
	{
		await Navigation.PopModalAsync();
	}
}