using MauiBookingApp.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages;
using System.Net;
using System.Text.Encodings.Web;

namespace AspJWTAuth.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class RolesController : ControllerBase
	{
		private readonly RoleManager<IdentityRole> _roleManager;
		private readonly UserManager<IdentityUser> _userManager;
		private readonly SignInManager<IdentityUser> _signInManager;
		private readonly IEmailSender _emailSender;
		public RolesController(RoleManager<IdentityRole> roleManager, UserManager<IdentityUser> userManager, SignInManager<IdentityUser> signInManager, IEmailSender emailSender)
		{
			_roleManager = roleManager;
			_userManager = userManager;
			_signInManager = signInManager;
			_emailSender = emailSender;
		}

		//private async Task SendConfirmationEmail(string? email, IdentityUser? user)
		//{
		//	//Generate the Token
		//	var token = await _userManager.GenerateEmailConfirmationTokenAsync(user);
		//	//Build the Email Confirmation Link which must include the Callback URL
		//	var ConfirmationLink = Url.Action("ConfirmEmail", "Account",
		//	new { UserId = user.Id, Token = token }, protocol: HttpContext.Request.Scheme);
		//	//Send the Confirmation Email to the User Email Id
		//	await _emailSender.SendEmailAsync(email, "Confirm Your Email", $"Please confirm your account by <a href='{HtmlEncoder.Default.Encode(ConfirmationLink)}'>clicking here</a>.", true);
		//}

		//[HttpPost]
		//[AllowAnonymous]
		//public async Task<IActionResult> Register(RegisterModel model)
		//{
		//	if (ModelState.IsValid)
		//	{
		//		// Copy data from RegisterViewModel to ApplicationUser
		//		var user = new IdentityUser
		//		{
		//			UserName = model.Email,
		//			Email = model.Email,
		//			//FirstName = model.FirstName,
		//			//LastName = model.LastName
		//		};
		//		// Store user data in AspNetUsers database table
		//		var result = await _userManager.CreateAsync(user, model.Password);
		//		// If user is successfully created, sign-in the user using
		//		// SignInManager and redirect to index action of HomeController
		//		if (result.Succeeded)
		//		{
		//			//Then send the Confirmation Email to the User
		//			await SendConfirmationEmail(model.Email, user);
		//			// If the user is signed in and in the Admin role, then it is
		//			// the Admin user that is creating a new user. 
		//			// So, redirect the Admin user to ListUsers action of Administration Controller
		//			if (_signInManager.IsSignedIn(User) && User.IsInRole("Admin"))
		//			{
		//				return RedirectToAction("ListUsers", "Administration");
		//			}
		//			//If it is not Admin user, then redirect the user to RegistrationSuccessful View
		//			return Ok("RegistrationSuccessful");
		//		}
		//		// If there are any errors, add them to the ModelState object
		//		// which will be displayed by the validation summary tag helper
		//		foreach (var error in result.Errors)
		//		{
		//			ModelState.AddModelError(string.Empty, error.Description);
		//		}
		//	}
		//	return Ok(model);
		//}

		//[HttpGet]
		//[AllowAnonymous]
		//public async Task<IActionResult> ConfirmEmail(string UserId, string Token)
		//{
		//	if (UserId == null || Token == null)
		//	{
		//		// ViewBag.Message = "The link is Invalid or Expired";
		//	}
		//	//Find the User By Id
		//	var user = await _userManager.FindByIdAsync(UserId);
		//	if (user == null)
		//	{
		//		//ViewBag.ErrorMessage = $"The User ID {UserId} is Invalid";
		//		//return View("NotFound");
		//	}
		//	//Call the ConfirmEmailAsync Method which will mark the Email as Confirmed
		//	var result = await _userManager.ConfirmEmailAsync(user, Token);
		//	if (result.Succeeded)
		//	{
		//		//ViewBag.Message = "Thank you for confirming your email";
		//		//return View();
		//	}
		//	//ViewBag.Message = "Email cannot be confirmed";
		//	//return View();
		//	return BadRequest();
		//}

		//[HttpGet]
		//[AllowAnonymous]
		//public IActionResult ResendConfirmationEmail(bool IsResend = true)
		//{
		//	if (IsResend)
		//	{
		//		//ViewBag.Message = "Resend Confirmation Email";
		//	}
		//	else
		//	{
		//		//ViewBag.Message = "Send Confirmation Email";
		//	}
		//	//return View();
		//	return Ok();
		//}

		//[HttpPost("register")]
		//public async Task<IActionResult> Register([FromBody] RegisterRequest request)
		//{
		//	if (!ModelState.IsValid)
		//		return BadRequest(ModelState);

		//	var user = new IdentityUser
		//	{
		//		UserName = request.Email,
		//		Email = request.Email
		//	};

		//	var result = await _userManager.CreateAsync(user, request.Password);

		//	if (!result.Succeeded)
		//		return BadRequest(result.Errors);

		//	// Generate email confirmation token
		//	var token = await _userManager.GenerateEmailConfirmationTokenAsync(user);

		//	// Generate confirmation link
		//	var confirmationLink = Url.Action("ConfirmEmail", "Auth",
		//	new { userId = user.Id, token }, Request.Scheme);

		//	// Send email
		//	await _emailSender.SendEmailAsync(user.Email, "Confirm your email",
		//		$"Please confirm your email by clicking <a href='{confirmationLink}'>here</a>.");

		//	return Ok("Registration successful! Please confirm your email.");
		//}

		//[HttpGet("confirm-email")]
		//public async Task<IActionResult> ConfirmEmail12(string userId, string token)
		//{
		//	if (string.IsNullOrEmpty(userId) || string.IsNullOrEmpty(token))
		//		return BadRequest("Invalid confirmation request.");

		//	var user = await _userManager.FindByIdAsync(userId);
		//	if (user == null)
		//		return NotFound("User not found.");

		//	var result = await _userManager.ConfirmEmailAsync(user, token);

		//	if (result.Succeeded)
		//		return Ok("Email confirmed successfully!");

		//	return BadRequest("Email confirmation failed.");
		//}

		//[HttpPost("login")]
		//public async Task<IActionResult> Login([FromBody] LoginRequest request)
		//{
		//	var user = await _userManager.FindByEmailAsync(request.Email);
		//	if (user == null)
		//		return Unauthorized("Invalid login attempt.");

		//	if (!await _userManager.IsEmailConfirmedAsync(user))
		//		return Unauthorized("Email not confirmed.");

		//	var result = await _signInManager.PasswordSignInAsync(user.UserName, request.Password, false, false);
		//	if (result.Succeeded)
		//		return Ok("Login successful!");

		//	return Unauthorized("Invalid login attempt.");
		//}

		[HttpPost("AssignRole")]
		public async Task<IActionResult> AssignRoleToUser(string userId, string roleName)
		{
			var user = await _userManager.FindByIdAsync(userId);
			if (user == null) return NotFound("User not found.");

			var result = await _userManager.AddToRoleAsync(user, roleName);
			if (result.Succeeded) return Ok("Role assigned.");

			return BadRequest(result.Errors);
		}

		[HttpPost("RemoveRole")]
		public async Task<IActionResult> RemoveRoleFromUser(string userId, string roleName)
		{
			var user = await _userManager.FindByIdAsync(userId);
			if (user == null) return NotFound("User not found.");

			var result = await _userManager.RemoveFromRoleAsync(user, roleName);
			if (result.Succeeded) return Ok("Role removed.");

			return BadRequest(result.Errors);
		}
    }
}
