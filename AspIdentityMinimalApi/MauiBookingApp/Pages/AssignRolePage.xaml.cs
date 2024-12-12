using MauiBookingApp.ViewModels;

namespace MauiBookingApp.Pages;

public partial class AssignRolePage : ContentPage
{
	public AssignRolePage(AssignRoleViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;	
	}
}