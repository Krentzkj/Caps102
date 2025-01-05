
using Microsoft.Maui.Controls.Maps;
using Microsoft.Maui.Maps;

namespace MapforMaui
{
    public partial class MainPage : ContentPage
    {
        private bool isPinPlacementMode = false;

        public MainPage()
        {
            InitializeComponent();
            // Set the initial camera update to the default location
            var initialLocation = new Location(7.197010762417296, 124.5367950297242);
            mappy.MoveToRegion(MapSpan.FromCenterAndRadius(initialLocation, Distance.FromMiles(1)));

           
        }

        private void AddPinButton_Clicked(object sender, EventArgs e)
        {
            isPinPlacementMode = true;
            DisplayAlert("Pin Placement", "Tap on the map to place a pin on your establishment." +
                "\n \nNote: Please Zoom in for better accuracy", "OK");
        }

        private async void OnMapClicked(object sender, MapClickedEventArgs e)
        {
            if (isPinPlacementMode)
            {
                string label = await DisplayPromptAsync("Boarding House Name", "Enter the name of your Boarding House.:");
                if (string.IsNullOrEmpty(label))
                {
                    await DisplayAlert("Invalid Input", "Enter the name of your Boarding House.", "OK");
                    return;
                }

                string description = await DisplayPromptAsync("Pin Description", "Enter the description of your Boarding House.:");
                if (string.IsNullOrEmpty(description))
                {
                    await DisplayAlert("Invalid Input", "Please enter a description of your Boarding House.", "OK");
                    return;
                }

                AddPin(label, description, e.Location.Latitude, e.Location.Longitude);
                isPinPlacementMode = false; // Reset the flag after placing the pin
            }
        }

        private void AddPin(string label, string description, double latitude, double longitude)
        {
            var pin = new Pin
            {
                Label = label,
                Address = description,
                Location = new Location(latitude, longitude),

                // Customize the pin appearance here if needed
            };

            pin.MarkerClicked += OnPinClicked;

            mappy.Pins.Add(pin);
        }

        private async void OnPinClicked(object sender, PinClickedEventArgs e)
        {
            var pin = sender as Pin;
            if (pin != null)
            {
                // Display the pin details first
                await DisplayAlert("Pin Details", $"Name: {pin.Label}\nDescription: {pin.Address}", "OK");

                
                // Then offer options to edit or delete
                string action = await DisplayActionSheet("Pin Options", "Cancel", null, "Edit", "Delete");
                if (action == "Edit")
                {
                    string newLabel = await DisplayPromptAsync("Edit Pin", "Enter new name:", initialValue: pin.Label);
                    if (!string.IsNullOrEmpty(newLabel))
                    {
                        pin.Label = newLabel;
                    }

                    string newDescription = await DisplayPromptAsync("Edit Description", "Enter new description:", initialValue: pin.Address);
                    if (!string.IsNullOrEmpty(newDescription))
                    {
                        pin.Address = newDescription;
                    }
                }
                else if (action == "Delete")
                {
                    mappy.Pins.Remove(pin);
                }
            }
        }

    }
}