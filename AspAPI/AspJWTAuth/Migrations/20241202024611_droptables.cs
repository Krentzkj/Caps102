using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AspJWTAuth.Migrations
{
    /// <inheritdoc />
    public partial class droptables : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Amenity");

            migrationBuilder.DropTable(
                name: "BookingTransactions");

            migrationBuilder.DropColumn(
                name: "ByteBase64",
                table: "BoardingHouses");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ByteBase64",
                table: "BoardingHouses",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Amenity",
                columns: table => new
                {
                    AmenityId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BoardingHouseId = table.Column<int>(type: "int", nullable: false),
                    AmenityName = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Amenity", x => x.AmenityId);
                    table.ForeignKey(
                        name: "FK_Amenity_BoardingHouses_BoardingHouseId",
                        column: x => x.BoardingHouseId,
                        principalTable: "BoardingHouses",
                        principalColumn: "BoardinghouseId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "BookingTransactions",
                columns: table => new
                {
                    TransactionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BoardinghouseId = table.Column<int>(type: "int", nullable: true),
                    ClientId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    AmountPaid = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    CheckInDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CheckOutDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    PaymentStatus = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Paymentmethod = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BookingTransactions", x => x.TransactionId);
                    table.ForeignKey(
                        name: "FK_BookingTransactions_AspNetUsers_ClientId",
                        column: x => x.ClientId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_BookingTransactions_BoardingHouses_BoardinghouseId",
                        column: x => x.BoardinghouseId,
                        principalTable: "BoardingHouses",
                        principalColumn: "BoardinghouseId");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Amenity_BoardingHouseId",
                table: "Amenity",
                column: "BoardingHouseId");

            migrationBuilder.CreateIndex(
                name: "IX_BookingTransactions_BoardinghouseId",
                table: "BookingTransactions",
                column: "BoardinghouseId");

            migrationBuilder.CreateIndex(
                name: "IX_BookingTransactions_ClientId",
                table: "BookingTransactions",
                column: "ClientId");
        }
    }
}
