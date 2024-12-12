using MauiBookingApp.Pages.Tenant;
using MauiBookingApp.Pages.TenantPage;

namespace MauiBookingApp
{
	public partial class App : Application
	{
		public App(OwnerDashboardPage vm)
		{
			InitializeComponent();

			MainPage = vm;//new AppShell();

        }
	}
}
