using MauiBookingApp.ViewModels;

namespace MauiBookingApp.Pages;

public partial class SignUpPage : ContentPage
{
	public SignUpPage(LoginAndSignupViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
	}
}