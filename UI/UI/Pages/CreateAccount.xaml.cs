namespace UI.Pages;

public partial class CreateAccount : ContentPage
{
    public CreateAccount()
    {
        InitializeComponent();
    }

    private void returntologin_cliked(object sender, EventArgs e)
	{
		Navigation.PushModalAsync(new MainPage());
	}

}