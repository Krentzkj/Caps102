using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AspJWTAuth.Migrations
{
    /// <inheritdoc />
    public partial class changecolumnnames : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Amenities_BoardingHouses_BoardingHouseId",
                table: "Amenities");

            migrationBuilder.AlterColumn<int>(
                name: "BoardingHouseId",
                table: "Amenities",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<string>(
                name: "AmenityName",
                table: "Amenities",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AddForeignKey(
                name: "FK_Amenities_BoardingHouses_BoardingHouseId",
                table: "Amenities",
                column: "BoardingHouseId",
                principalTable: "BoardingHouses",
                principalColumn: "BoardinghouseId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Amenities_BoardingHouses_BoardingHouseId",
                table: "Amenities");

            migrationBuilder.AlterColumn<int>(
                name: "BoardingHouseId",
                table: "Amenities",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "AmenityName",
                table: "Amenities",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Amenities_BoardingHouses_BoardingHouseId",
                table: "Amenities",
                column: "BoardingHouseId",
                principalTable: "BoardingHouses",
                principalColumn: "BoardinghouseId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
