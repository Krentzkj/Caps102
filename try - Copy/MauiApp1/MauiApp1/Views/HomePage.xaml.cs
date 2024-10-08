using MauiApp1.ViewModels;

namespace MauiApp1.Views;

public partial class HomePage : ContentPage
{
    public HomePage(LoginPageViewModel vm)
    {
        InitializeComponent();

        BindingContext = vm;
    }
}