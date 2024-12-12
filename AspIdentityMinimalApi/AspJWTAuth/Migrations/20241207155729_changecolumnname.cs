using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AspJWTAuth.Migrations
{
    /// <inheritdoc />
    public partial class changecolumnname : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "TenantId",
                table: "BoardingHouses",
                type: "nvarchar(450)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)");

            migrationBuilder.CreateTable(
                name: "Amenities",
                columns: table => new
                {
                    AmenityId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AmenityName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    AmenityPrice = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    BoardingHouseId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Amenities", x => x.AmenityId);
                    table.ForeignKey(
                        name: "FK_Amenities_BoardingHouses_BoardingHouseId",
                        column: x => x.BoardingHouseId,
                        principalTable: "BoardingHouses",
                        principalColumn: "BoardinghouseId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Amenities_BoardingHouseId",
                table: "Amenities",
                column: "BoardingHouseId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Amenities");

            migrationBuilder.AlterColumn<string>(
                name: "TenantId",
                table: "BoardingHouses",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(450)",
                oldNullable: true);
        }
    }
}
