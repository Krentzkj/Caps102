using MauiBookingApp.ViewModels;

namespace MauiBookingApp
{
	public partial class MainPage : ContentPage
	{
		public MainPage(LoginAndSignupViewModel vm)
		{
			InitializeComponent();
			BindingContext = vm;
		}
	}

}
