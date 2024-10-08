using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MauiApp1.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiApp1.ViewModels
{
    public partial  class LoginPageViewModel : BaseViewModel
    {
        [ObservableProperty]
        private string? _userName;

        [ObservableProperty]
        private string? _password;

        [RelayCommand]
        public async void GoToLoginPage()
        {
            await Shell.Current.GoToAsync(nameof(HomePage));
        }
    }
}
