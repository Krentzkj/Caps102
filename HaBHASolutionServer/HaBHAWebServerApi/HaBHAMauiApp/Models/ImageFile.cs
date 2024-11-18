using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HaBHAMauiApp.Models
{
	public class ImageFile
	{
		public int id { get; set; }
		public string? byteBase64 { get; set; }
		public string? FileName { get; set; }
		public string? ContentType { get; set; }
	}
}
