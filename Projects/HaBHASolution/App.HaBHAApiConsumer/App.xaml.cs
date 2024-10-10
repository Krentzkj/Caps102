using App.HaBHAApiConsumer.Pages;

namespace App.HaBHAApiConsumer
{
    public partial class App : Application
    {
        public App(CRUDPage cRUDPage)
        {
            InitializeComponent();

            MainPage = cRUDPage;
        }
    }
}
