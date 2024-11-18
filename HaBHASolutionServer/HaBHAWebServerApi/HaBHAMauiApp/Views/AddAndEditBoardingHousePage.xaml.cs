using ApiLibrary;
using HaBHAWebServerApi.Models;

namespace HaBHAMauiApp.Views;

public partial class AddAndEditBoardingHousePage : ContentPage
{
	private readonly ApiClientService _apiClientService;
	private BoardingHouse _boardingHouse;

	public AddAndEditBoardingHousePage(ApiClientService apiClientService, BoardingHouse boardingHouse)
	{
		InitializeComponent();

		_apiClientService = apiClientService;
		_boardingHouse = boardingHouse;
		LoadBoardingHouses();
	}

	private void LoadBoardingHouses()
	{
		if (_boardingHouse is not null)
		{
			txtRoomNumber.Text = _boardingHouse.RoomNumber.ToString();
			txtRoomSize.Text = _boardingHouse.RoomSize.ToString();
			txtPricePerMonth.Text = _boardingHouse.PricePerMonth.ToString();
			txtDescriptions.Text = _boardingHouse.Descriptions;
			txtAmenities.Text = _boardingHouse.Amenities;
			
		}
	}

	//private async void btnSave_Clicked(object sender, EventArgs e)
	//{
	//	if (_boardingHouse is not null)
	//	{
	//		await _apiClientService.SaveUnit(new BoardingHouse
	//		{
	//			RoomNumber = int.Parse(txtRoomNumber.Text),
	//			RoomSize = int.Parse(txtRoomSize.Text),
	//			PricePerMonth = decimal.Parse(txtPricePerMonth.Text),
	//			Descriptions = txtDescriptions.Text,
	//			Amenities = txtAmenities.Text
	//		});
	//	}
	//	else
	//	{
	//		await _apiClientService.UpdateUnit(new BoardingHouse
	//		{
	//			BoardinghouseId = _boardingHouse.BoardinghouseId,
	//			RoomNumber = int.Parse(txtRoomNumber.Text),
	//			RoomSize = int.Parse(txtRoomSize.Text),
	//			PricePerMonth = decimal.Parse(txtPricePerMonth.Text),
	//			Descriptions = txtDescriptions.Text,
	//			Amenities = txtAmenities.Text
	//		});
	//	}

	//	await Navigation.PopModalAsync();
	//}

	private async void btnSave_Clicked(object sender, EventArgs e)
	{
		try
		{

			int roomNumber = string.IsNullOrWhiteSpace(txtRoomNumber.Text) ? 0 : int.Parse(txtRoomNumber.Text);
			int roomSize = string.IsNullOrWhiteSpace(txtRoomSize.Text) ? 0 : int.Parse(txtRoomSize.Text);
			decimal pricePerMonth = string.IsNullOrWhiteSpace(txtPricePerMonth.Text) ? 0 : decimal.Parse(txtPricePerMonth.Text);
			bool isAvailable = txtIsAvailble.IsToggled;

			var boardingHouse = new BoardingHouse
			{
				RoomNumber = roomNumber,
				RoomSize = roomSize,
				PricePerMonth = pricePerMonth,
				Descriptions = txtDescriptions.Text,
				Amenities = txtAmenities.Text,
				IsAvailble = isAvailable
			};

			if (_boardingHouse is not null)
			{
				boardingHouse.BoardinghouseId = _boardingHouse.BoardinghouseId;
				await _apiClientService.UpdateUnit(boardingHouse);
			}
			else
			{
				await _apiClientService.SaveUnit(boardingHouse);
			}

			await Navigation.PopModalAsync();
		}
		catch (Exception ex)
		{
			await DisplayAlert("Error", $"Failed to save the unit: {ex.Message}", "OK");
		}
	}


	private async void btnCancel_Clicked(object sender, EventArgs e)
	{
		await Navigation.PopModalAsync();
	}
}