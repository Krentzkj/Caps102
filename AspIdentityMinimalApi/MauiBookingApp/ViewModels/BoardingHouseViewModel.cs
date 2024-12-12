using App.ApiClient;
using App.ApiClient.Models.ApiModels;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MauiBookingApp.Models.Authentication;
using MauiBookingApp.Pages.TenantPage;
using MauiBookingApp.Services;
using System.Collections.ObjectModel;
using System.Text.Json;
using BoardingHouse = MauiBookingApp.Models.Tenant.BoardingHouse;

namespace MauiBookingApp.ViewModels
{
    public partial class BoardingHouseViewModel : ObservableObject
    {
        private readonly ClientService clientService;
        [ObservableProperty]
        private bool isBusy;
        public ObservableCollection<BoardingHouse> Tenants { get; } = new();

        [ObservableProperty]
        private string description;
        [ObservableProperty]
        private int roomNumber;
        [ObservableProperty]
        private decimal price;
        [ObservableProperty]
        private int roomSize;
        [ObservableProperty]
        private string userName;

        public BoardingHouseViewModel(ClientService clientService)
        {
            this.clientService = clientService;
            
            LoadTenantsAsync();
            GetUserName();
        }

        private async void GetUserName()
        {
            var serializedLoginResponseInStorage = await SecureStorage.Default.GetAsync("Authentication");
            if (serializedLoginResponseInStorage != null)
            {
                UserName = JsonSerializer.Deserialize<LoginResponse>(serializedLoginResponseInStorage)!.UserName!;
                return;
            }
        }
        public async void LoadTenantsAsync()
        {
            if (IsBusy)
                return;

            try
            {
                IsBusy = true;
                var boardingHouses = await clientService.GetAllTenantsAsync(); //GetAllTenantsByEmailAsync(UserName);

                if (boardingHouses != null)
                {
                    Tenants.Clear();
                    foreach (var bh in boardingHouses)
                    {
                        Tenants.Add(new BoardingHouse
                        {
                            RoomNumber = bh.RoomNumber,
                            Descriptions = bh.Descriptions?.ToString(),
                            RoomSize = bh.RoomSize,
                            PricePerMonth = bh.PricePerMonth,
                        });
                    }
                }
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", $"An error occurred: {ex.Message}", "Ok");
            }
            finally
            {
                IsBusy = false;
            }
        }

        //public async Task NavigateToDetailsAsync(BoardingHouse selectedBoardingHouse)
        //{
        //    var navigationParameters = new Dictionary<string, object>
        //    {
        //        { "SelectedBoardingHouse", selectedBoardingHouse }
        //    };

        //    await Shell.Current.GoToAsync(nameof(TestPage), navigationParameters);
        //}

        [RelayCommand]
        public async Task NavigateToDetailsAsync(BoardingHouse selectedBoardingHouse)
        {
            if (selectedBoardingHouse == null)
                return;

            var navigationParameters = new Dictionary<string, object>
                {
                    { "SelectedBoardingHouse", selectedBoardingHouse }
                };

            await Shell.Current.GoToAsync(nameof(TestPage), false, navigationParameters);
        }

    }
} 
