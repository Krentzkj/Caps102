using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HaBHA_ApiServer.Migrations
{
    /// <inheritdoc />
    public partial class addforeignkey2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "BoardingHouse",
                columns: table => new
                {
                    BH_ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Descriptions = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    Roomsize = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    Locations = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    Amenities = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BoardingHouse", x => x.BH_ID);
                });

            migrationBuilder.CreateTable(
                name: "Borders",
                columns: table => new
                {
                    Borders_Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ContactNumber = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    Age = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Borders", x => x.Borders_Id);
                });

            migrationBuilder.CreateTable(
                name: "Payment",
                columns: table => new
                {
                    Payment_Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Dates = table.Column<DateOnly>(type: "date", nullable: true),
                    Amount = table.Column<int>(type: "int", nullable: true),
                    Payment_Method = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    Reference_Number = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Payment", x => x.Payment_Id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "BoardingHouse");

            migrationBuilder.DropTable(
                name: "Borders");

            migrationBuilder.DropTable(
                name: "Payment");
        }
    }
}
