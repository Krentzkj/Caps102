using HaBHA.ClassLibrary.Models.Authentication;
using HaBHA.ClassLibrary;
using System.Text.Json;

namespace HaBHA.MauiAppBooking
{
    public partial class MainPage : ContentPage
    {
        private readonly AppApiClientService _appApiClientService;
        private string UserName;

        public MainPage(AppApiClientService appApiClientService)
        {
            InitializeComponent();
            _appApiClientService = appApiClientService;
        }

        private async Task LoadBoardingHouseByEmail()
        {
            try
            {
                ActivityIndicator.IsRunning = true;
                ActivityIndicator.IsVisible = true;

                //var sr = await SecureStorage.Default.GetAsync("Authentication");
                //if (sr != null)
                //{
                //    UserName = JsonSerializer.Deserialize<LoginResponse>(sr)!.UserName!;
                //}

                var data1 = await _appApiClientService.GetBoardingHousesAsync();
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
    }

}
