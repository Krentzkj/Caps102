using ApiLibrary.Models;
using HaBHAWebServerApi.Models;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;

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

		public async Task<List<BoardingHouse>?> GetAllUnits()
		{
			return await _httpclient.GetFromJsonAsync<List<BoardingHouse>?>("/api/BoardingHouse/GetAllUnits");
		}
		
		public async Task<BoardingHouse?> GetUnitById(int id)
		{
			return await _httpclient.GetFromJsonAsync<BoardingHouse?>($"/api/BoardingHouse/{id}");
		}

		public async Task SaveUnit(BoardingHouse boardingHouse)
		{
			await _httpclient.PostAsJsonAsync("/api/BoardingHouse/SaveUnit", boardingHouse);
		}

		public async Task UpdateUnit(BoardingHouse boardingHouse)
		{
			await _httpclient.PutAsJsonAsync("/api/BoardingHouse/UpdateUnit", boardingHouse);
		}

		public async Task DeleteUnit(int id)
		{
			await _httpclient.DeleteAsync($"/api/BoardingHouse/DeleteUnit/{id}");
		}
	}
}
