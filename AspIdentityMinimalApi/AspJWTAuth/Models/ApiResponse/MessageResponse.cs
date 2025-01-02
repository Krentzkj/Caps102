namespace AspJWTAuth.Models.ApiResponse
{
    public class MessageResponse
    {
        public string Message { get; set; }
        public bool Success { get; set; }
        public object Data { get; set; }
    }
}
