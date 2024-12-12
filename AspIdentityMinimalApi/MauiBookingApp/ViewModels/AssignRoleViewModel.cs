using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MauiBookingApp.Models.Authentication;
using MauiBookingApp.Pages;
using MauiBookingApp.Pages.TenantPage;
using MauiBookingApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace MauiBookingApp.ViewModels
{
    public partial class AssignRoleViewModel : ObservableObject
    {
        [ObservableProperty]
        private UserRole userRole;
        [ObservableProperty]
        private string userName;
        [ObservableProperty]
        private string roleName;
        [ObservableProperty]
        private bool isRoleAssigned;

        private readonly ClientService clientService;

        public AssignRoleViewModel(ClientService clientService)
        {
            this.clientService = clientService;
            UserRole = new();
            IsRoleAssigned = false;
            GetUserName();
        }

        [RelayCommand]
        private async Task AssignRole()
        {
            await clientService.AsignRoles(UserRole);
            IsRoleAssigned = true;
            if (IsRoleAssigned == true)
            {
                await Shell.Current.GoToAsync(nameof(NewPage1));
            }
            else
            {
                await Shell.Current.GoToAsync(nameof(AssignRolePage));
            }
            
        }
        private async void GetUserName()
        {
            var serializedLoginResponseInStorage = await SecureStorage.Default.GetAsync("Authentication");
            if (serializedLoginResponseInStorage != null)
            {
                UserName = JsonSerializer.Deserialize<LoginResponse>(serializedLoginResponseInStorage)!.UserName!;
                RoleName = JsonSerializer.Deserialize<UserRole>(serializedLoginResponseInStorage)!.RoleName!;
                return;
            }
        }
    }
}
