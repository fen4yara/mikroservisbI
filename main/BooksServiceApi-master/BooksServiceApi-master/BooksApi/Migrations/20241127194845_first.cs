using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace BooksServiceApi.Migrations
{
    /// <inheritdoc />
    public partial class first : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Genre",
                columns: table => new
                {
                    Id_Genre = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Genre", x => x.Id_Genre);
                });

            migrationBuilder.CreateTable(
                name: "Books",
                columns: table => new
                {
                    Id_Book = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Author = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Id_Genre = table.Column<int>(type: "int", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Year = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Photo = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Books", x => x.Id_Book);
                    table.ForeignKey(
                        name: "FK_Books_Genre_Id_Genre",
                        column: x => x.Id_Genre,
                        principalTable: "Genre",
                        principalColumn: "Id_Genre",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "BookExemplar",
                columns: table => new
                {
                    Exemplar_Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Books_Count = table.Column<int>(type: "int", nullable: false),
                    Book_Id = table.Column<int>(type: "int", nullable: false),
                    Exemplar_Price = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BookExemplar", x => x.Exemplar_Id);
                    table.ForeignKey(
                        name: "FK_BookExemplar_Books_Book_Id",
                        column: x => x.Book_Id,
                        principalTable: "Books",
                        principalColumn: "Id_Book",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "RentHistory",
                columns: table => new
                {
                    id_Rent = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Rental_Start = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Rental_Time = table.Column<int>(type: "int", nullable: false),
                    Id_Reader = table.Column<int>(type: "int", nullable: false),
                    Id_Book = table.Column<int>(type: "int", nullable: false),
                    Rental_End = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Rental_Status = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RentHistory", x => x.id_Rent);
                    table.ForeignKey(
                        name: "FK_RentHistory_Books_Id_Book",
                        column: x => x.Id_Book,
                        principalTable: "Books",
                        principalColumn: "Id_Book",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_BookExemplar_Book_Id",
                table: "BookExemplar",
                column: "Book_Id");

            migrationBuilder.CreateIndex(
                name: "IX_Books_Id_Genre",
                table: "Books",
                column: "Id_Genre");

            migrationBuilder.CreateIndex(
                name: "IX_RentHistory_Id_Book",
                table: "RentHistory",
                column: "Id_Book");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "BookExemplar");

            migrationBuilder.DropTable(
                name: "RentHistory");

            migrationBuilder.DropTable(
                name: "Books");

            migrationBuilder.DropTable(
                name: "Genre");
        }
    }
}
