using MauiBookingApp.Pages.AuthPage;
using MauiBookingApp.Pages.Owner;
using MauiBookingApp.Pages.Tenant;
using MauiBookingApp.Pages.TenantPage;

namespace MauiBookingApp
{
	public partial class App : Application
	{
		public App(UploadImagetodb vm) //OwnerDashPage LoginPage
        {
			InitializeComponent();

			MainPage = vm;//new AppShell();

        }
	}
}
