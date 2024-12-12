using MauiBookingApp.Pages;
using MauiBookingApp.Services;
using MauiBookingApp.ViewModels;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Logging;
using App.ApiClient.ServiceCollection;
using MauiBookingApp.Pages.TenantPage;
using MauiBookingApp.Pages.Tenant;

namespace MauiBookingApp
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

			builder.Services.AddHttpClient("custom-httpclient", httpclient =>
			{
				var baseAddress = DeviceInfo.Platform == DevicePlatform.Android ? "https://10.0.2.2:7293" : "https://localhost:7293";
				httpclient.BaseAddress = new Uri(baseAddress);
			}).ConfigurePrimaryHttpMessageHandler(() =>
			{
				var platformMessageHandler = builder.Services.BuildServiceProvider().GetRequiredService<IPlatformHttpMessageHandler>();
				return platformMessageHandler.GetHttpMessageHandler();
			});
            builder.Services.AddDemoApiCLientService(x => x.ApiBaseAddress = "http://localhost:5169/");	
            builder.Services.AddTransient<IPlatformHttpMessageHandler, PlatformHttpMessageHandler>();
			builder.Services.AddSingleton<ClientService>();
			builder.Services.AddSingleton<LoginAndSignupViewModel>();
			builder.Services.AddSingleton<AssignRoleViewModel>();
			builder.Services.AddSingleton<AssignRolePage>();
			builder.Services.AddSingleton<MainPage>();
			builder.Services.AddSingleton<TenantDashboardPage>();
			builder.Services.AddTransient<NewPage1>();
			//builder.Services.AddSingleton<RolePage>();
			builder.Services.AddSingleton<SignUpPage>();

			builder.Services.AddTransient<BoardingHouseViewModel>();
			builder.Services.AddSingleton<TenantMainPage>();

			builder.Services.AddSingleton<TestPage>();
			builder.Services.AddTransient<TestPageViewModel>();
			builder.Services.AddSingleton<OwnerDashboardPage>();

			builder.Services.AddSingleton<Dashboard>();

#if DEBUG
			builder.Logging.AddDebug();
#endif

			return builder.Build();
		}
	}
}
