using System.Text;

string jwt = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkb20xN0BnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWNiODA4YmItNzY0Ny00ODY0LTg0MzQtOTRlOGEwZWVmNzJiIiwianRpIjoiYmQ5NDIzMDItMTQzMi00NGEzLTg5M2ItMzRjZTI1NjcxZDBjIiwiZXhwIjoxNzM0MDY1MTYwLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjUwNDIiLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUwNDIifQ.bftsdEVUDpvrZqrXwA45osSZ1mfyIBxVUAskzYbvD34";
string url = "https://localhost:7043/api/Tenant/GetUser";

using (HttpClient client = new HttpClient())
{
    var c = new StringContent("", Encoding.UTF8, "application/json");

    HttpResponseMessage r = await client.GetAsync(url);

    if (r.IsSuccessStatusCode)
    {
        Console.WriteLine("0");
    }

    Console.WriteLine("1");
}
