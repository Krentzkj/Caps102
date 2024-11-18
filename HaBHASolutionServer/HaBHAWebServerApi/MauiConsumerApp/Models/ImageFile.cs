using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiConsumerApp.Models
{
	internal class ImageFile
	{
		public int Id { get; set; }
		public string? byteBase64 { get; set; }
		public string? FileName { get; set; }
		public string? ContentType { get; set; }
	}
}
