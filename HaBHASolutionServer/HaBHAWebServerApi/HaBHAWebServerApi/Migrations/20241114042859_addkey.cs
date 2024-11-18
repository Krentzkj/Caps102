using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HaBHAWebServerApi.Migrations
{
    /// <inheritdoc />
    public partial class addkey : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "BoardingHouse",
                columns: table => new
                {
                    BoardinghouseId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoomNumber = table.Column<int>(type: "int", nullable: true),
                    RoomSize = table.Column<int>(type: "int", nullable: true),
                    PricePerMonth = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    IsAvailble = table.Column<bool>(type: "bit", nullable: false),
                    Descriptions = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Amenities = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ByteBase64 = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BoardingHouse", x => x.BoardinghouseId);
                });

            migrationBuilder.CreateTable(
                name: "Transaction",
                columns: table => new
                {
                    TransactionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CheckInDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CheckOutDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    AmountPaid = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    PaymentStatus = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Paymentmethod = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    BoardinghouseId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Transaction", x => x.TransactionId);
                    table.ForeignKey(
                        name: "FK_Transaction_BoardingHouse_BoardinghouseId",
                        column: x => x.BoardinghouseId,
                        principalTable: "BoardingHouse",
                        principalColumn: "BoardinghouseId");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Transaction_BoardinghouseId",
                table: "Transaction",
                column: "BoardinghouseId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Transaction");

            migrationBuilder.DropTable(
                name: "BoardingHouse");
        }
    }
}
