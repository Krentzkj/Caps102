using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace WebApplication1.Migrations
{
    /// <inheritdoc />
    public partial class SecondMigration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "44215cf9-558c-4695-a323-a5d4ccbc47cd", null, "client", "client" },
                    { "52c60ca9-2c2a-4c1b-8e71-a8721917a146", null, "seller", "seller" },
                    { "f9bd8527-1a4a-42f7-9018-e4ccde3c1b21", null, "admin", "admin" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "44215cf9-558c-4695-a323-a5d4ccbc47cd");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "52c60ca9-2c2a-4c1b-8e71-a8721917a146");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "f9bd8527-1a4a-42f7-9018-e4ccde3c1b21");
        }
    }
}
