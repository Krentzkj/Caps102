namespace AspJWTAuth.Models.ImageFile
{
    public class Image
    {
        public int Id { get; set; }
        public string FileName { get; set; }
        public string ContentType { get; set; }
        public byte[] ImageData { get; set; }
    }
}
