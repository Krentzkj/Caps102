using MauiBookingApp.ViewModels;

namespace MauiBookingApp.Pages.TenantPage;

public partial class TenantMainPage : ContentPage
{
	public TenantMainPage(BoardingHouseViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
	}
}