using HaBHAMauiApp.ViewModels;

namespace HaBHAMauiApp
{
	public partial class MainPage : ContentPage
	{
		public MainPage(MainPageViewModel mainPageViewModel)
		{
			InitializeComponent();

			BindingContext = mainPageViewModel;
		}
	}
}
