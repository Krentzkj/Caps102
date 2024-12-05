using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AspJWTAuth.Migrations
{
    /// <inheritdoc />
    public partial class addmodels : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "BoardingHouses",
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
                    ByteBase64 = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TenantId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BoardingHouses", x => x.BoardinghouseId);
                    table.ForeignKey(
                        name: "FK_BoardingHouses_AspNetUsers_TenantId",
                        column: x => x.TenantId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "BookingTransactions",
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
                    ClientId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    BoardinghouseId = table.Column<int>(type: "int", nullable: true)
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
                name: "IX_BoardingHouses_TenantId",
                table: "BoardingHouses",
                column: "TenantId");

            migrationBuilder.CreateIndex(
                name: "IX_BookingTransactions_BoardinghouseId",
                table: "BookingTransactions",
                column: "BoardinghouseId");

            migrationBuilder.CreateIndex(
                name: "IX_BookingTransactions_ClientId",
                table: "BookingTransactions",
                column: "ClientId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "BookingTransactions");

            migrationBuilder.DropTable(
                name: "BoardingHouses");
        }
    }
}
