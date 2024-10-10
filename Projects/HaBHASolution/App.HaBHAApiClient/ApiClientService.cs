using App.HaBHAApiClient.Models;
using App.HaBHAApiClient.Models.ApiModels;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;

namespace App.HaBHAApiClient
{
    public class ApiClientService
    {
        private readonly HttpClient _httpclient;

        public ApiClientService(ApiClientOptions apiClientOptions)
        {
            _httpclient = new HttpClient();
            _httpclient.BaseAddress = new System.Uri(apiClientOptions.ApiBaseAddress);
        }

        public async Task<List<BoardingHouse>> GetBoardingHouse()
        {
            return await _httpclient.GetFromJsonAsync<List<BoardingHouse>>("/api/BHBookingControllers/BoardingHouse");
        }

        public async Task<BoardingHouse?> GetBoardingHouseById(int id)
        {
            return await _httpclient.GetFromJsonAsync<BoardingHouse?>($"/api/BHBookingControllers/BoardingHouse/{id}");
        }

        public async Task SaveBoardingHouse(BoardingHouse boardingHouse)
        {
            await _httpclient.PostAsJsonAsync("/api/BHBookingControllers/BoardingHouse", boardingHouse);
        }

        public async Task UpdateBoardingHouse(BoardingHouse boardingHouse)
        {
            await _httpclient.PutAsJsonAsync("/api/BHBookingControllers", boardingHouse);
        }

        public async Task DeleteBoardingHouse(int id)
        {
            await _httpclient.DeleteAsync($"/api/BHBookingControllers/{id}");
        }
    }
}
