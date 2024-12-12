using CommunityToolkit.Mvvm.ComponentModel;
using MauiBookingApp.Models.Tenant;
using System.Collections.ObjectModel;

namespace MauiBookingApp.ViewModels
{
    public partial class TestPageViewModel : ObservableObject, IQueryAttributable
    {

        public ObservableCollection<BoardingHouse> Tenants { get; } = new();

        [ObservableProperty]
        private int roomNumber;

        [ObservableProperty]
        private string descriptions;

        [ObservableProperty]
        private int roomSize;

        [ObservableProperty]
        private decimal pricePerMonth;

        public void ApplyQueryAttributes(IDictionary<string, object> query)
        {
            if (query.TryGetValue("SelectedBoardingHouse", out var boardingHouseObj) && boardingHouseObj is BoardingHouse boardingHouse)
            {
                RoomNumber = (int)boardingHouse.RoomNumber;
                Descriptions = boardingHouse.Descriptions;
                RoomSize = (int)boardingHouse.RoomSize;
                PricePerMonth = (decimal)boardingHouse.PricePerMonth;
            }
        }
    }
}
