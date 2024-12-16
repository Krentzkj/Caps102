using Microsoft.Maui.Controls;
using Microsoft.Maui.Controls.Maps;
using Microsoft.Maui.Maps;

namespace MapsTheReturn
{
    public partial class MainPage : ContentPage
    {
        public MapViewModel ViewModel { get; set; }

        public MainPage()
        {
            InitializeComponent();
            ViewModel = new MapViewModel();
            BindingContext = ViewModel;

            // Add Pin programmatically in the code-behind
            var pin = new Pin
            {
                 // Use the center from ViewModel
                Label = "Center Location"
            };

            mapControl.Pins.Add(pin);  // Add the pin to the map control
        }
    }
}
