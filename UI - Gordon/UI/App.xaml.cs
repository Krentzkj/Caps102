using UI.Pages;
using UI.Pages.Owner;

namespace UI
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new Pages.Owner.ManageEstablishment();
           
        }
    }
}
