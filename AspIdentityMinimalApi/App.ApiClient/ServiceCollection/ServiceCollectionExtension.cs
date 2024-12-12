using App.ApiClient.Models;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.ApiClient.ServiceCollection
{
    public static class ServiceCollectionExtension
    {
        public static void AddDemoApiCLientService(this IServiceCollection services,
            Action<ApiClientOptions> options)
        {
            services.Configure(options);
            services.AddSingleton(provider =>
            {
                var options = provider.GetRequiredService<IOptions<ApiClientOptions>>().Value;
                return new AppApiClientService(options);
            });
        }
    }
}
