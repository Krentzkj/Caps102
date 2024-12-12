using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AspJWTAuth.Migrations
{
    /// <inheritdoc />
    public partial class returnnew : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Amenities");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Amenities",
                columns: table => new
                {
                    AmenityId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BoardingHouseId = table.Column<int>(type: "int", nullable: true),
                    AmenityName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AmenityPrice = table.Column<decimal>(type: "decimal(18,2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Amenities", x => x.AmenityId);
                    table.ForeignKey(
                        name: "FK_Amenities_BoardingHouses_BoardingHouseId",
                        column: x => x.BoardingHouseId,
                        principalTable: "BoardingHouses",
                        principalColumn: "BoardinghouseId");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Amenities_BoardingHouseId",
                table: "Amenities",
                column: "BoardingHouseId");
        }
    }
}
