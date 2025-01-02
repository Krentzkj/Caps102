using MauiBookingApp.Models.Authentication;
using MauiBookingApp.Models.Client;
using MauiBookingApp.Models.Tenant;
using MauiBookingApp.Services;
using System.Text.Json;
using BoardingHouse = MauiBookingApp.Models.Tenant.BoardingHouse;

namespace MauiBookingApp.Pages.Client;

public partial class ClientMakeRequestPage : ContentPage
{
	private readonly ClientBoardersService _clientBoardersService;
    private BoardingHouse _boardingHouse;
    private ClientRequest _clientRequest;

	public ClientMakeRequestPage(ClientBoardersService clientBoardersService, BoardingHouse boardingHouse)
	{
		InitializeComponent();
		_clientBoardersService = clientBoardersService;
        //_clientRequest = clientRequest; 
        _boardingHouse = boardingHouse;
	}

    private async void btnAdd_Clicked(object sender, EventArgs e)
    {
        var sr = await SecureStorage.Default.GetAsync("Authentication");
        string token = string.Empty;

        var loginResponse = JsonSerializer.Deserialize<LoginResponse>(sr);
        if (loginResponse != null)
        {
            token = loginResponse.Token;

        }

        await _clientBoardersService.AddClientRequestAsync(new ClientRequest
        {
            BoardinghouseId = _boardingHouse.BoardinghouseId,
            Message = txtMessage.Text
        }, token) ;

    }

    private async void btnCancel_Clicked(object sender, EventArgs e)
    {
        await Navigation.PopModalAsync();
    }
}