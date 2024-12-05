namespace UI.Pages;

public partial class CreatingAccountPage1 : ContentPage
{
    public CreatingAccountPage1()
    {
        InitializeComponent();
    }

    private void backbutton_clicked(object sender, EventArgs e)
	{
		Navigation.PopModalAsync();
	}

    private void Register_clicked(object sender, EventArgs e)

    {
		Navigation.PushModalAsync(new CreateAccount());
    }
}