using MauiBookingApp.ViewModels;

namespace MauiBookingApp.Pages.TenantPage;

public partial class TestPage : ContentPage
{
	public TestPage(TestPageViewModel vm)
	{
		InitializeComponent();

		BindingContext = vm;
	}
}