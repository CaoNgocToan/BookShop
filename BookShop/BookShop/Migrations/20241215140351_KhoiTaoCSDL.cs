using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace BookShop.Migrations
{
    /// <inheritdoc />
    public partial class KhoiTaoCSDL : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ChuDe",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TenChuDe = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    TenChuDeKhongDau = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ChuDe", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "HangSanXuat",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TenHangSanXuat = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    TenHangSanXuatKhongDau = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_HangSanXuat", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "LoaiSanPham",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TenLoai = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    TenLoaiKhongDau = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_LoaiSanPham", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "NguoiDung",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    HoVaTen = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Email = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    DienThoai = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
                    DiaChi = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    TenDangNhap = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    MatKhau = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    Quyen = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_NguoiDung", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "TinhTrang",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MoTa = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    MoTaKhongDau = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TinhTrang", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "SanPham",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    HangSanXuatID = table.Column<int>(type: "int", nullable: false),
                    LoaiSanPhamID = table.Column<int>(type: "int", nullable: false),
                    TenSanPham = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    TenSanPhamKhongDau = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    DonGia = table.Column<int>(type: "int", nullable: false),
                    SoLuong = table.Column<int>(type: "int", nullable: false),
                    HinhAnh = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    MoTa = table.Column<string>(type: "ntext", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SanPham", x => x.ID);
                    table.ForeignKey(
                        name: "FK_SanPham_HangSanXuat_HangSanXuatID",
                        column: x => x.HangSanXuatID,
                        principalTable: "HangSanXuat",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SanPham_LoaiSanPham_LoaiSanPhamID",
                        column: x => x.LoaiSanPhamID,
                        principalTable: "LoaiSanPham",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "BaiViet",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ChuDeID = table.Column<int>(type: "int", nullable: false),
                    NguoiDungID = table.Column<int>(type: "int", nullable: false),
                    TieuDe = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    TieuDeKhongDau = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    TomTat = table.Column<string>(type: "ntext", nullable: false),
                    NoiDung = table.Column<string>(type: "ntext", nullable: false),
                    NgayDang = table.Column<DateTime>(type: "datetime2", nullable: false),
                    LuotXem = table.Column<int>(type: "int", nullable: false),
                    KiemDuyet = table.Column<bool>(type: "bit", nullable: false),
                    HienThi = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BaiViet", x => x.ID);
                    table.ForeignKey(
                        name: "FK_BaiViet_ChuDe_ChuDeID",
                        column: x => x.ChuDeID,
                        principalTable: "ChuDe",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_BaiViet_NguoiDung_NguoiDungID",
                        column: x => x.NguoiDungID,
                        principalTable: "NguoiDung",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DatHang",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NguoiDungID = table.Column<int>(type: "int", nullable: false),
                    TinhTrangID = table.Column<int>(type: "int", nullable: false),
                    DienThoaiGiaoHang = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false),
                    DiaChiGiaoHang = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    NgayDatHang = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DatHang", x => x.ID);
                    table.ForeignKey(
                        name: "FK_DatHang_NguoiDung_NguoiDungID",
                        column: x => x.NguoiDungID,
                        principalTable: "NguoiDung",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_DatHang_TinhTrang_TinhTrangID",
                        column: x => x.TinhTrangID,
                        principalTable: "TinhTrang",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "GioHang",
                columns: table => new
                {
                    ID = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    TenDangNhap = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    SanPhamID = table.Column<int>(type: "int", nullable: false),
                    SoLuongTrongGio = table.Column<int>(type: "int", nullable: false),
                    ThoiGian = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GioHang", x => x.ID);
                    table.ForeignKey(
                        name: "FK_GioHang_SanPham_SanPhamID",
                        column: x => x.SanPhamID,
                        principalTable: "SanPham",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "BinhLuanBaiViet",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BaiVietID = table.Column<int>(type: "int", nullable: false),
                    NguoiDungID = table.Column<int>(type: "int", nullable: false),
                    NoiDungBinhLuan = table.Column<string>(type: "ntext", nullable: false),
                    NgayDang = table.Column<DateTime>(type: "datetime2", nullable: false),
                    LuotXem = table.Column<int>(type: "int", nullable: false),
                    KiemDuyet = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BinhLuanBaiViet", x => x.ID);
                    table.ForeignKey(
                        name: "FK_BinhLuanBaiViet_BaiViet_BaiVietID",
                        column: x => x.BaiVietID,
                        principalTable: "BaiViet",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_BinhLuanBaiViet_NguoiDung_NguoiDungID",
                        column: x => x.NguoiDungID,
                        principalTable: "NguoiDung",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DatHang_ChiTiet",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DatHangID = table.Column<int>(type: "int", nullable: false),
                    SanPhamID = table.Column<int>(type: "int", nullable: false),
                    SoLuong = table.Column<short>(type: "smallint", nullable: false),
                    DonGia = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DatHang_ChiTiet", x => x.ID);
                    table.ForeignKey(
                        name: "FK_DatHang_ChiTiet_DatHang_DatHangID",
                        column: x => x.DatHangID,
                        principalTable: "DatHang",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_DatHang_ChiTiet_SanPham_SanPhamID",
                        column: x => x.SanPhamID,
                        principalTable: "SanPham",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_BaiViet_ChuDeID",
                table: "BaiViet",
                column: "ChuDeID");

            migrationBuilder.CreateIndex(
                name: "IX_BaiViet_NguoiDungID",
                table: "BaiViet",
                column: "NguoiDungID");

            migrationBuilder.CreateIndex(
                name: "IX_BinhLuanBaiViet_BaiVietID",
                table: "BinhLuanBaiViet",
                column: "BaiVietID");

            migrationBuilder.CreateIndex(
                name: "IX_BinhLuanBaiViet_NguoiDungID",
                table: "BinhLuanBaiViet",
                column: "NguoiDungID");

            migrationBuilder.CreateIndex(
                name: "IX_DatHang_NguoiDungID",
                table: "DatHang",
                column: "NguoiDungID");

            migrationBuilder.CreateIndex(
                name: "IX_DatHang_TinhTrangID",
                table: "DatHang",
                column: "TinhTrangID");

            migrationBuilder.CreateIndex(
                name: "IX_DatHang_ChiTiet_DatHangID",
                table: "DatHang_ChiTiet",
                column: "DatHangID");

            migrationBuilder.CreateIndex(
                name: "IX_DatHang_ChiTiet_SanPhamID",
                table: "DatHang_ChiTiet",
                column: "SanPhamID");

            migrationBuilder.CreateIndex(
                name: "IX_GioHang_SanPhamID",
                table: "GioHang",
                column: "SanPhamID");

            migrationBuilder.CreateIndex(
                name: "IX_SanPham_HangSanXuatID",
                table: "SanPham",
                column: "HangSanXuatID");

            migrationBuilder.CreateIndex(
                name: "IX_SanPham_LoaiSanPhamID",
                table: "SanPham",
                column: "LoaiSanPhamID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "BinhLuanBaiViet");

            migrationBuilder.DropTable(
                name: "DatHang_ChiTiet");

            migrationBuilder.DropTable(
                name: "GioHang");

            migrationBuilder.DropTable(
                name: "BaiViet");

            migrationBuilder.DropTable(
                name: "DatHang");

            migrationBuilder.DropTable(
                name: "SanPham");

            migrationBuilder.DropTable(
                name: "ChuDe");

            migrationBuilder.DropTable(
                name: "NguoiDung");

            migrationBuilder.DropTable(
                name: "TinhTrang");

            migrationBuilder.DropTable(
                name: "HangSanXuat");

            migrationBuilder.DropTable(
                name: "LoaiSanPham");
        }
    }
}
