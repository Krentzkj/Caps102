using UI.Pages;

namespace UI
{
    public partial class MainPage : ContentPage
    {
    

        public MainPage()
        {
            InitializeComponent();
        }

        private void createAccountPage1_Clicked(object sender, EventArgs e)
        {
            Navigation.PushModalAsync(new CreatingAccountPage1());
        } 
        private void Login(object sender, EventArgs e)
        {
            Navigation.PushModalAsync(new Dashboard());
        }
    }

}
