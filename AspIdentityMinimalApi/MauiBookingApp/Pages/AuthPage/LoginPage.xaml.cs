using App.ApiClient;
using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;
using MauiBookingApp.Models.Authentication;
using MauiBookingApp.Pages.Client;
using MauiBookingApp.Pages.Owner;
using MauiBookingApp.Pages.Tenant;
using MauiBookingApp.Services;
using System.Text.Json;

namespace MauiBookingApp.Pages.AuthPage;

public partial class LoginPage : ContentPage
{
	private readonly AppApiClientService _appApiClientService;
    private readonly OwnerBoardingHouseService _boardingHouseService;
    private readonly ClientBoardersService _clientBoardersService;
    private readonly ClientService _clientService;

    private List<string> _items;
    private List<string> _filteredItems;
    private object imageEditor;

    public LoginPage(AppApiClientService appApiClientService, ClientService clientService, OwnerBoardingHouseService ownerBoardingHouseService, ClientBoardersService clientBoardersService)
	{
		InitializeComponent();
		_appApiClientService = appApiClientService;
        _boardingHouseService = ownerBoardingHouseService;
        _clientBoardersService = clientBoardersService;
		_clientService = clientService;

        _items = new List<string>
            {
                "Option 1",
                "Option 2",
                "Option 3",
                "Option 4",
                "Option 5"
            };

        _filteredItems = new List<string>(_items);

        searchResultsList.ItemsSource = _filteredItems;
    }

    private async void OnSendNotificationClicked(object sender, EventArgs e)
    {
        var toast = Toast.Make("This is a local notification", ToastDuration.Short, 14);
        await toast.Show();

        var filePicker = FilePicker.Default;
        var fileResult = await filePicker.PickAsync();
        var filePath = fileResult?.FullPath;

        if (string.IsNullOrEmpty(filePath))
        {
            return;
        }

        var imageSource = new FileImageSource
        {
            File = filePath
        };
    }

    private async void OnSearchTextChanged(object sender, TextChangedEventArgs e)
    {
        string searchText = e.NewTextValue?.ToLower() ?? string.Empty;

        var items = await _clientBoardersService.CLientSearchFielAsync(decimal.Parse(searchText));

        //_filteredItems = _items.Where(item => item.ToLower().Contains(searchText)).ToList();

        searchResultsList.ItemsSource = items; //_filteredItems
    }

    private void OnItemSelected(object sender, SelectedItemChangedEventArgs e)
    {
        if (e.SelectedItem != null)
        {
            DisplayAlert("Item Selected", e.SelectedItem.ToString(), "OK");
            searchResultsList.SelectedItem = null;
        }
    }

    private async void OnPickerSelectedIndexChanged(object sender, EventArgs e)
    {
        var picker = (Picker)sender;
        int selectedIndex = picker.SelectedIndex;

        var data = await _clientBoardersService.CLientSearchFielAsync(decimal.Parse((string)picker.ItemsSource[selectedIndex]));

        if (selectedIndex != -1)
        {
            ResultLabel.Text = $"You selected: {picker.ItemsSource[selectedIndex]}";
        }
        else
        {
            ResultLabel.Text = "You selected: None";
        }

        PriceSearchResultsList.ItemsSource = data;
    }
    private async void btnLogin_Clicked(object sender, EventArgs e)
    {
        string email = txtEmail.Text;
        string password = txtPassword.Text;
        string token;
        string roleName;

        if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
        {
            await DisplayAlert("Error", "Please enter both email and password.", "OK");
            return;
        }

        try
        {
            
            var model = new LoginModel
            {
                Email = email,
                Password = password
            };

            
            await _clientService.Login(model);

            var sr = await SecureStorage.Default.GetAsync("Authentication");
            if (sr != null)
            {
                roleName = JsonSerializer.Deserialize<UserRole>(sr)!.RoleName;
                token = JsonSerializer.Deserialize<LoginResponse>(sr)!.Token!;
            }

            token = txtToken.Text;

            await DisplayAlert("Success", "Login successful!", "OK");
            var toast = Toast.Make($"This is a local notification", ToastDuration.Short, 14);
            await toast.Show();
            await Navigation.PushModalAsync(new OwnerMainPage(_boardingHouseService)); //OwnerDashPage
            //await Navigation.PushModalAsync(new ClientNewsFeedPage(_clientBoardersService)); //OwnerDashPage


        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", $"Login failed: {ex.Message}", "OK");
        }
    }
}