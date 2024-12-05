using UI.Pages;

namespace UI
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new Pages.Owner.ManageRequest();
           
        }
    }
}
