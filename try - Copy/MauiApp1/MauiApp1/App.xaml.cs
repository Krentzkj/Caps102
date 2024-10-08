using MauiApp1.Views;

namespace MauiApp1
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new AppShell();

            Routing.RegisterRoute(nameof(HomePage), typeof(HomePage));


            InitializeComponent();

            MainPage = new AppShell();

            Routing.RegisterRoute(nameof(UserPage), typeof(UserPage));


        }

    }
}
