using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using WebApplication1.Models;

namespace WebApplication1.Pages
{
    [Authorize(Roles = "admin")]
    public class UserProfileModel : PageModel
    {
        private readonly string _connectionString;
        public UserProfileModel(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public List<UserRole> UserRoles { get; set; } = new List<UserRole>();
        public async Task OnGetAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                var command = new SqlCommand(@"select dbo.AspNetUsers.Id, dbo.AspNetUsers.LastName, dbo.AspNetUsers.FirstName, dbo.AspNetRoles.Name as Role
from dbo.AspNetUsers, dbo.AspNetUserRoles, dbo.AspNetRoles
where dbo.AspNetUsers.Id = dbo.AspNetUserRoles.UserId and dbo.AspNetRoles.Id = dbo.AspNetUserRoles.RoleId order by dbo.AspNetUsers.LastName", connection);

                using (var reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        UserRoles.Add(new UserRole
                        {
                            Id = reader.GetString(0),
                            LastName = reader.GetString(1),
                            FirstName = reader.GetString(2),
                            Role = reader.GetString(3)
                        });
                    }
                }
            }
        }

        public async Task<IActionResult> OnPostUpdateRoleAsync(string userId, string role)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                // Update the role in the database
                var command = new SqlCommand(@"
            UPDATE dbo.AspNetUserRoles
            SET RoleId = (SELECT Id FROM dbo.AspNetRoles WHERE Name = @Role)
            WHERE UserId = @UserId", connection);

                command.Parameters.AddWithValue("@Role", role);
                command.Parameters.AddWithValue("@UserId", userId);

                await command.ExecuteNonQueryAsync();
            }

            // Optionally, you could reload the user roles after the update
            return RedirectToPage();
        }


        //public void OnGet()
        //{
        //}
    }
}
