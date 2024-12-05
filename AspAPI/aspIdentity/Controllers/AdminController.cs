using aspIdentity.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace aspIdentity.Controllers
{
	public class AdminController : Controller
	{
		private UserManager<AppUser> userManager;

		public AdminController(UserManager<AppUser> usrMgr)
		{
			userManager = usrMgr;
		}
		public IActionResult Create()
		{
			return View();
		}

		//public ViewResult Create() => View();

		[HttpPost]
		public async Task<IActionResult> Create(User user)
		{
			if (ModelState.IsValid)
			{
				AppUser appUser = new AppUser
				{
					UserName = user.Name,
					Email = user.Email
				};

				IdentityResult result = await userManager.CreateAsync(appUser, user.Password);

				if (result.Succeeded)
					return RedirectToAction("Index");
				else
				{
					foreach (IdentityError error in result.Errors)
						ModelState.AddModelError("", error.Description);
				}
			}
			return View(user);
		}
	}
}
