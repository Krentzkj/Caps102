namespace UI.Pages;

public partial class ProfilePage : ContentPage
{
	public ProfilePage()
	{
		InitializeComponent();
	}
	private void Back_Clicked(object sender, EventArgs e)
	{
		Navigation.PushModalAsync(new Dashboard());
	}
}