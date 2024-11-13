using ApiLibrary.Models;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;

namespace ApiLibrary
{
	public class ApiClientService
	{
		private readonly HttpClient _httpclient;

		public ApiClientService(ApiClientOptions apiClientOptions)
		{
			_httpclient = new HttpClient();
			_httpclient.BaseAddress = new System.Uri(apiClientOptions.ApiBaseAddress);
		}


	}
}
