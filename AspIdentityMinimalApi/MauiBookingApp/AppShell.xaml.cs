using MauiBookingApp.Pages;
using MauiBookingApp.Pages.TenantPage;

namespace MauiBookingApp
{
	public partial class AppShell : Shell
	{
		public AppShell()
		{
			InitializeComponent();
			//Routing.RegisterRoute(nameof(RolePage), typeof(RolePage));
			Routing.RegisterRoute(nameof(AssignRolePage), typeof(AssignRolePage));
			Routing.RegisterRoute(nameof(NewPage1), typeof(NewPage1));
			Routing.RegisterRoute(nameof(SignUpPage), typeof(SignUpPage));

			Routing.RegisterRoute(nameof(TestPage), typeof(TestPage));
		}
	}
}
