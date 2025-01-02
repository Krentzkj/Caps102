namespace AspJWTAuth.Models.TenantModels
{
    public class ImageFile
    {
        public int Id { get; set; }
        public string FileName { get; set; }
        public string ContentType { get; set; }
        public byte[] byteBase64 { get; set; }
    }
}
