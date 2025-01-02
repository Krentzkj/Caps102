using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace AspJWTAuth.Migrations
{
    /// <inheritdoc />
    public partial class iniyt : Migration
    {
        /// <inheritdoc />
        //protected override void Up(MigrationBuilder migrationBuilder)
        //{

        //    migrationBuilder.InsertData(
        //        table: "AspNetRoles",
        //        columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
        //        values: new object[,]
        //        {
        //            { "1", null, "SuperAdmin", "SUPERADMIN" },
        //            { "2", null, "Tenant", "TENANT" },
        //            { "3", null, "Client", "CLIENT" }
        //        });
        //}

        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Product",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProductName = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    ProductImage = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Product", x => x.Id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Product");
        }
    }
}
