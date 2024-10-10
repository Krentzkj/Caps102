using App.HaBHAApiClient.Models;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.HaBHAApiClient.Ioc
{
    public static class ServiceCollectionExtensions
    {
         public static void AddApiClientService(this IServiceCollection services,
             Action<ApiClientOptions> options)
        {
            services.Configure(options);
            services.AddSingleton(provider =>
            {
                var options = provider.GetRequiredService<IOptions<ApiClientOptions>>().Value;
                return new ApiClientService(options);
            });
        }
    }
}
