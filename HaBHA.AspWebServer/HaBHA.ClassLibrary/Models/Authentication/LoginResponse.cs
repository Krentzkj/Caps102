using System;
using System.Collections.Generic;
using System.Text;

namespace HaBHA.ClassLibrary.Models.Authentication
{
    public class LoginResponse
    {
        public string? AccessToken { get; set; }
        public string? RefreshToken { get; set; }
        public string? UserName { get; set; }
    }
}
