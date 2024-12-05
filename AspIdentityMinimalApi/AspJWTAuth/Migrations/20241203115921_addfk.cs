using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AspJWTAuth.Migrations
{
    /// <inheritdoc />
    public partial class addfk : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_BoardingHouses_AspNetUsers_TenantId",
                table: "BoardingHouses");

            migrationBuilder.AddForeignKey(
                name: "FK_BoardingHouses_AspNetUsers_TenantId",
                table: "BoardingHouses",
                column: "TenantId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_BoardingHouses_AspNetUsers_TenantId",
                table: "BoardingHouses");

            migrationBuilder.AddForeignKey(
                name: "FK_BoardingHouses_AspNetUsers_TenantId",
                table: "BoardingHouses",
                column: "TenantId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
