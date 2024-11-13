using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HaBHAMauiApp
{
	public class PlatformHttpMessageHandler : IPlatformHttpMessageHandler
	{
		public HttpMessageHandler GetHttpMessageHandler()
		{
			return new HttpClientHandler();
		}
	}

	public interface IPlatformHttpMessageHandler
	{
		HttpMessageHandler GetHttpMessageHandler();

	}
}
