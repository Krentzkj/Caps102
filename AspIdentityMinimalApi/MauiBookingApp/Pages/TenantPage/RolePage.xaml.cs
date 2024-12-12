using App.ApiClient;
using App.ApiClient.Models.ApiModels.Authentication;

namespace MauiBookingApp.Pages.TenantPage;

public partial class RolePage : ContentPage
{
	private readonly AppApiClientService _appApiClientService;
	private UserRole _userRole;
	public RolePage(AppApiClientService appApiClientService, UserRole userRole)
	{
		InitializeComponent();
		_appApiClientService = appApiClientService;
		_userRole = userRole;
	}

    private async void btnAddRoles_Clicked(object sender, EventArgs e)
    {
		if (_userRole != null)
		{
			await _appApiClientService.AddRoles(new UserRole
			{
				Email = _userRole.Email,
				RoleName = _userRole.RoleName
			});
		}
    }
}