using Microsoft.Extensions.Logging;
using HaBHA.MauiAppBooking;
using HaBHA.ClassLibrary.ServiceCollection;


namespace HaBHA.MauiAppBooking
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

            builder.Services.AddDemoApiCLientService(x => x.ApiBaseAddress = "http://localhost:5042/");
            builder.Services.AddSingleton<MainPage>();

#if DEBUG
            builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
