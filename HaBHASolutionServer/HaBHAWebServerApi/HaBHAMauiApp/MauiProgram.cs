using HaBHAMauiApp.Services;
using HaBHAMauiApp.ViewModels;
using Microsoft.Extensions.Logging;
using ApiLibrary.ServiceCollection;
using static System.Net.WebRequestMethods;
using HaBHAMauiApp.Views;

namespace HaBHAMauiApp
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

			builder.Services.AddDemoApiCLientService(x => x.ApiBaseAddress = "https://localhost:7295/");

			builder.Services.AddHttpClient("custom-httpclient", httpClient =>
			{
				var baseAddress = DeviceInfo.Platform == DevicePlatform.Android ? "https://localhost:7295" : "https://localhost:7295";
				httpClient.BaseAddress = new Uri(baseAddress);
			}).ConfigurePrimaryHttpMessageHandler(() =>
			{
				var platformMessageHandler = builder.Services.BuildServiceProvider().GetRequiredService<IPlatformHttpMessageHandler>();
				return platformMessageHandler.GetHttpMessageHandler();
			});

			builder.Services.AddTransient<IPlatformHttpMessageHandler, PlatformHttpMessageHandler>();
			builder.Services.AddSingleton<MainPage>();
			builder.Services.AddSingleton<MainPageViewModel>();
			builder.Services.AddSingleton<ClientService>();


			builder.Services.AddTransient<TenantDashBoardPage>();

#if DEBUG
			builder.Logging.AddDebug();
#endif

			return builder.Build();
		}
	}
}
