using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HaBHA.AspWebServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        [HttpGet]
        [Authorize]
        public IActionResult GetValues()
        {
            return Ok(new string[] { "Value1", "Value2" });
        }
    }
}
