using MauiBookingApp.Models.Authentication;
using MauiBookingApp.Models.Images;
using MauiBookingApp.Models.Tenant;
using MauiBookingApp.Services;
using MauiBookingApp.Services.UplodImageService;
using System.Text.Json;

namespace MauiBookingApp.Pages.Owner;

public partial class OwnerAddEditBoardingHousePage : ContentPage
{
    private readonly OwnerBoardingHouseService _ownerBoardingHouseService;
    private BoardingHouse _boardingHouse;

    UploadImage uploadImage { get; set; }
    private ImageFile currentImageFile;

    public OwnerAddEditBoardingHousePage(OwnerBoardingHouseService ownerBoardingHouseService, BoardingHouse boardingHouse)
	{
		InitializeComponent();
        _ownerBoardingHouseService = ownerBoardingHouseService;
        _boardingHouse = boardingHouse;
        LoadOwnerBoardingHouse();
        uploadImage = new UploadImage();
	}
    //private async void UploadImage_Clicked(object sender, EventArgs e)
    //{
    //    var img = await uploadImage.OpenMediaPickerAsync();

    //    var imagefile = await uploadImage.Upload(img);

    //    Image_Upload.Source = ImageSource.FromStream(() =>
    //        uploadImage.ByteArrayToStream(uploadImage.StringToByteBase64(imagefile.byteBase64))
    //    );
    //}

    private async void OnImageTapped(object sender, EventArgs e)
    {
        if (currentImageFile != null)
        {
            await _ownerBoardingHouseService.UploadImageAsync(currentImageFile);

            await DisplayAlert("Success", "Image uploaded successfully!", "OK");
        }
        else
        {
            await DisplayAlert("Error", "No image to upload.", "OK");
        }
    }

    private async void UploadImage_Clicked(object sender, EventArgs e)
    {
        var img = await uploadImage.OpenMediaPickerAsync();

        if (img != null)
        {
            var imageFile = await uploadImage.Upload(img);

            if (imageFile != null)
            {
                Image_Upload.Source = ImageSource.FromStream(() =>
                    uploadImage.ByteArrayToStream(uploadImage.StringToByteBase64(imageFile.byteBase64))
                );

                currentImageFile = imageFile;
            }
            else
            {
                await DisplayAlert("Error", "Failed to prepare the image for upload.", "OK");
            }
        }
        else
        {
            await DisplayAlert("Error", "No image selected.", "OK");
        }
    }

    private void LoadOwnerBoardingHouse()
    {
        if (_boardingHouse is not null)
        {
            txtRoomNumber.Text = _boardingHouse.RoomNumber.ToString();
            txtRoomSize.Text = _boardingHouse.RoomSize.ToString();
            txtPricePerMonth.Text = _boardingHouse.PricePerMonth.ToString();
            txtDescriptions.Text = _boardingHouse.Descriptions;
            txtIsAvailble.Text = _boardingHouse.IsAvailble.ToString();
        }
    }
    private async void btnAdd_Clicked(object sender, EventArgs e)
    {
        var sr = await SecureStorage.Default.GetAsync("Authentication");
        string token = string.Empty;

        var loginResponse = JsonSerializer.Deserialize<LoginResponse>(sr);
        if (loginResponse != null)
        {
            token = loginResponse.Token;

        }

        if (_boardingHouse is null) 
        {
            await _ownerBoardingHouseService.AddOwnerBoardingHouseAsync(new BoardingHouse
            {
                RoomNumber = int.Parse(txtRoomNumber.Text),
                RoomSize = int.Parse(txtRoomSize.Text),
                PricePerMonth = decimal.Parse(txtPricePerMonth.Text),
                Descriptions = txtDescriptions.Text
                ////IsAvailble = bool.Parse(txtIsAvailble.Text)
                //RoomNumber = int.TryParse(txtRoomNumber?.Text, out var roomNumber) ? roomNumber : throw new ArgumentException("Invalid Room Number"),
                //RoomSize = int.TryParse(txtRoomSize?.Text, out var roomSize) ? roomSize : throw new ArgumentException("Invalid Room Size"),
                //PricePerMonth = decimal.TryParse(txtPricePerMonth?.Text, out var pricePerMonth) ? pricePerMonth : throw new ArgumentException("Invalid Price Per Month"),
                //Descriptions = txtDescriptions?.Text ?? throw new ArgumentException("Descriptions cannot be null"),
                //IsAvailble = bool.TryParse(txtIsAvailble?.Text, out var isAvailable) ? isAvailable : throw new ArgumentException("Invalid Availability Value")
            }, token);
        }
        else
        {
            await _ownerBoardingHouseService.UpdateOwnerBoardingHouseAsync(new BoardingHouse
            {
                TenantId = _boardingHouse.TenantId,
                BoardinghouseId = _boardingHouse.BoardinghouseId,
                RoomNumber = int.Parse(txtRoomNumber.Text),
                RoomSize = int.Parse(txtRoomSize.Text),
                PricePerMonth = decimal.Parse(txtPricePerMonth.Text),
                Descriptions = txtDescriptions.Text,
                IsAvailble = bool.Parse(txtIsAvailble.Text)
            }, token);

            await DisplayAlert("Success", "Update Successfully", "OK");
        }
    }

    private async void btnCancel_Clicked(object sender, EventArgs e)
    {
        await Navigation.PopModalAsync();
    }
}