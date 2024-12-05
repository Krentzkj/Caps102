using System.Collections.ObjectModel;
using System.Windows.Input;

namespace UI.Models
{
    public class Room
    {
        public string Rating { get; set; }
        public string Price { get; set; }
        public string Name { get; set; }
        public string Distance { get; set; }
        public int Id { get; set; }
    }

    public class DashboardViewModel
    {
        // ObservableCollection for data binding
        public ObservableCollection<Room> Rooms { get; set; }

        // Command for navigating to room details
        public ICommand ViewDetailsCommand { get; }

        public DashboardViewModel()
        {
            // Sample data
            Rooms = new ObservableCollection<Room>
            {
                new Room { Id = 1, Rating = "⭐ 4", Price = "₱25000", Name = "Rowhouse", Distance = "3kms away" },
                new Room { Id = 2, Rating = "⭐ 5", Price = "₱30000", Name = "Apartment", Distance = "5kms away" },
                new Room { Id = 3, Rating = "⭐ 3", Price = "₱20000", Name = "Studio", Distance = "2kms away" }
            };

            // Initialize the command
            ViewDetailsCommand = new Command<int>(ViewRoomDetails);
        }

        // Method to handle the command
        private async void ViewRoomDetails(int roomId)
        {
            // Logic to navigate to room details page
            // Example: You can use Shell navigation or a Navigation service
            await App.Current.MainPage.DisplayAlert("Room Details", $"Navigating to details of room ID: {roomId}", "OK");
        }
    }
}
