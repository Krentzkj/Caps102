using App.HaBHAApiClient.Ioc;
using App.HaBHAApiConsumer.Pages;
using Microsoft.Extensions.Logging;

namespace App.HaBHAApiConsumer
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

            builder.Services.AddApiClientService(x => x.ApiBaseAddress = "http://localhost:5018/");
            builder.Services.AddTransient<CRUDPage>();

#if DEBUG
            builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
