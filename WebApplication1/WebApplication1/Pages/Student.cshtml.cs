using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Security.Claims;
using System.Threading.Tasks;
using WebApplication1.Models;

namespace WebApplication1.Pages
{
    public class StudentModel : PageModel
    {
        private readonly string _connectionString;

        public StudentModel(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public List<StudentInfo> Students { get; set; } = new List<StudentInfo>();

        public async Task OnGetAsync()
        {
            string userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;

            if (!string.IsNullOrEmpty(userId))
            {
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    string query = @"
                        delete me and paste your query here = @UserId";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@UserId", userId));

                        using (SqlDataReader reader = await command.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                Students.Add(new StudentInfo
                                {
                                    LastName = reader["LastName"].ToString(),
                                    FirstName = reader["FirstName"].ToString(),
                                    DeptDescription = reader["DeptDescription"].ToString()
                                });
                            }
                        }
                    }
                }
            }
        }
    }
}
