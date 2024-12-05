using AspJWTAuth.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AspJWTAuth.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ApiController : ControllerBase
	{
		private readonly AppDbContext _appDbContext;

		public ApiController(AppDbContext appDbContext)
		{
			_appDbContext = appDbContext;
		}
			
		[HttpGet("Roles-Tenant")]
		public async Task<ActionResult<AppDbContext>> getTenantroles()
		{
			var userRoles = await (from user in _appDbContext.Users
								   join userRole in _appDbContext.UserRoles on user.Id equals userRole.UserId
								   join role in _appDbContext.Roles on userRole.RoleId equals role.Id
								   where role.Name == "Tenant"
								   select new
								   {
									   user.Id, role.Name, user.UserName
									   //UserId = user.Id,
									   //UserName = user.UserName,
									   //RoleName = role.Name
								   }).ToListAsync();

			return Ok(userRoles);
		}

		[HttpGet("Roles-Client")]
		public async Task<ActionResult<AppDbContext>> getClientroles()
		{
			var userRoles = await (from user in _appDbContext.Users
								   join userRole in _appDbContext.UserRoles on user.Id equals userRole.UserId
								   join role in _appDbContext.Roles on userRole.RoleId equals role.Id
								   where role.Name == "Client"
								   select new
								   {
									   user.Id,
									   role.Name,
									   user.UserName
									   //UserId = user.Id,
									   //UserName = user.UserName,
									   //RoleName = role.Name
								   }).ToListAsync();

			return Ok(userRoles);
		}

		[HttpGet("Roles-SuperAdmin")]
		public async Task<ActionResult<AppDbContext>> getSuperAdminroles()
		{
			var userRoles = await (from user in _appDbContext.Users
								   join userRole in _appDbContext.UserRoles on user.Id equals userRole.UserId
								   join role in _appDbContext.Roles on userRole.RoleId equals role.Id
								   where role.Name == "SuperAdmin"
								   select new
								   {
									   user.Id,
									   role.Name,
									   user.UserName
									   //UserId = user.Id,
									   //UserName = user.UserName,
									   //RoleName = role.Name
								   }).ToListAsync();

			return Ok(userRoles);
		}
	}
}
