using UI.Models;

namespace UI.Pages
{
    public partial class Dashboard : ContentPage
    {
        public Dashboard()
        {
            InitializeComponent();
            
            BindingContext = new DashboardViewModel();
        }
        public void ViewProfile_clicked(object sender, EventArgs e)
        {
            Navigation.PushModalAsync(new ProfilePage());
        }

    }
}
