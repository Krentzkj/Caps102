using App.ApiClient;
using MauiBookingApp.Models.Authentication;
using MauiBookingApp.Models.Tenant;
using MauiBookingApp.Services;
using System.Text.Json;

namespace MauiBookingApp.Pages.Owner;

public partial class OwnerMainPage : ContentPage
{
    private readonly OwnerBoardingHouseService _service;
    public OwnerMainPage(OwnerBoardingHouseService ownerBoardingHouseService)
    {
        InitializeComponent();
        _service = ownerBoardingHouseService;
    }

    public async Task LoadBoardingHousesWithAmenities()
    {
        try
        {   
            ActivityIndicator.IsRunning = true;
            ActivityIndicator.IsVisible = true;

            var sr = await SecureStorage.Default.GetAsync("Authentication");
            string token = string.Empty;

            if (!string.IsNullOrEmpty(sr))
            {
                var loginResponse = JsonSerializer.Deserialize<LoginResponse>(sr);
                if (loginResponse != null)
                {
                    token = loginResponse.Token; 

                }
            }

            var data = await _service.GetOwnerBoardingHousesWithAmenitiesAsync(token);

            productListView1.ItemsSource = data;

        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
        }
        finally
        {
            ActivityIndicator.IsRunning = false;
            ActivityIndicator.IsVisible = false;
        }

    }
    private async void btnShowBH_Clicked(object sender, EventArgs e)
    {
        await LoadBoardingHousesWithAmenities();
    }

    private async Task<string> GetAuthenticationTokenAsync()
    {
        var sr = await SecureStorage.Default.GetAsync("Authentication");
        if (string.IsNullOrEmpty(sr)) return null;

        var loginResponse = JsonSerializer.Deserialize<LoginResponse>(sr);
        return loginResponse?.Token;
    }

    private async void productListView1_ItemTapped(object sender, ItemTappedEventArgs e)
    {
        
        var bh = (BoardingHouse)e.Item;
        //var action = await DisplayActionSheet("Action", "Cancel", null, "Edit", "Delete");
        //await DisplayAlert("Alert", "You have been alerted", "OK");
        await Navigation.PushModalAsync(new OwnerAddEditBoardingHousePage(_service, bh));


        //switch (action)
        //{
        //    case "Edit":
        //        //await Navigation.PushModalAsync(new OwnerAddEditBoardingHousePage(_service, bh));
        //        await DisplayAlert("Error", "Edit", "OK");
        //        break;
        //    case "Delete":
        //        await DisplayAlert("Error", "Delete", "OK");
        //        break;
        //}
    }


    //private async void productListView1_ItemTapped(object sender, ItemTappedEventArgs e)
    //{
    //    // Deselect the tapped item
    //    ((ListView)sender).SelectedItem = null;

    //    if (e.Item is not BoardingHouse BH) return;

    //    var action = await DisplayActionSheet($"Actions for {BH.Descriptions}", "Cancel", null, "Edit", "Delete");

    //    switch (action)
    //    {
    //        case "Edit":
    //            await Navigation.PushModalAsync(new OwnerAddEditBoardingHousePage(_ownerBoardingHouseService, BH));
    //            break;

    //        case "Delete":
    //            var confirm = await DisplayAlert("Confirm Delete", $"Are you sure you want to delete {BH.Descriptions}?", "Yes", "No");
    //            if (!confirm) return;

    //            try
    //            {
    //                var token = await GetAuthenticationTokenAsync();
    //                if (string.IsNullOrWhiteSpace(token))
    //                {
    //                    await DisplayAlert("Error", "Authentication token is missing.", "OK");
    //                    return;
    //                }

    //                await _ownerBoardingHouseService.DeleteOwnerBoardingHouseAsync(BH.BoardinghouseId, token);
    //                await LoadBoardingHousesWithAmenities();
    //            }
    //            catch (Exception deleteEx)
    //            {
    //                await DisplayAlert("Error", $"Failed to delete: {deleteEx.Message}", "OK");
    //            }
    //            break;

    //        default:
    //            break;
    //    }
    //}


    //private async void productListView1_ItemTapped(object sender, ItemTappedEventArgs e)
    //{
    //    try
    //    {
    //        // Ensure the tapped item is valid
    //        if (e.Item == null)
    //        {
    //            await DisplayAlert("Error", "No item selected.", "OK");
    //            return;
    //        }

    //        var boardingHouse = e.Item as BoardingHouse;
    //        if (boardingHouse == null)
    //        {
    //            await DisplayAlert("Error", "Invalid item type.", "OK");
    //            return;
    //        }

    //        // Simulated action sheet for debugging
    //        await Task.Delay(100); // Stabilize UI thread
    //        var action = await MainThread.InvokeOnMainThreadAsync(() =>
    //            DisplayActionSheet("Action", "Cancel", null, "Edit", "Delete"));

    //        switch (action)
    //        {
    //            case "Edit":
    //                await Navigation.PushModalAsync(new OwnerAddEditBoardingHousePage(_ownerBoardingHouseService, boardingHouse));
    //                break;

    //            case "Delete":
    //                try
    //                {
    //                    var sr = await SecureStorage.Default.GetAsync("Authentication");
    //                    var loginResponse = JsonSerializer.Deserialize<LoginResponse>(sr);
    //                    string token = loginResponse?.Token;

    //                    if (string.IsNullOrWhiteSpace(token))
    //                    {
    //                        await DisplayAlert("Error", "Authentication token is missing.", "OK");
    //                        return;
    //                    }

    //                    await _ownerBoardingHouseService.DeleteOwnerBoardingHouseAsync(boardingHouse.BoardinghouseId, token);
    //                    await LoadBoardingHousesWithAmenities();
    //                }
    //                catch (Exception deleteEx)
    //                {
    //                    await DisplayAlert("Error", $"Failed to delete: {deleteEx.Message}", "OK");
    //                }
    //                break;

    //            default:
    //                break;
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        var errorDetails = $"Exception: {ex.Message}\nInner Exception: {ex.InnerException?.Message}\nStack Trace: {ex.StackTrace}";
    //        await DisplayAlert("Unhandled Error", errorDetails, "OK");
    //        Console.WriteLine(errorDetails);
    //    }
    //}

    private async void btnAdd_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushModalAsync(new OwnerAddEditBoardingHousePage(_service, boardingHouse:null));
    }
}