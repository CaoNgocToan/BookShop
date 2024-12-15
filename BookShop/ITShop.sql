USE [master]
GO
/****** Object:  Database [LinhKienMTShop]    Script Date: 12/12/2024 10:13:10 PM ******/
CREATE DATABASE [LinhKienMTShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LinhKienMTShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LinhKienMTShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LinhKienMTShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LinhKienMTShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LinhKienMTShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LinhKienMTShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LinhKienMTShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LinhKienMTShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LinhKienMTShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LinhKienMTShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LinhKienMTShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET RECOVERY FULL 
GO
ALTER DATABASE [LinhKienMTShop] SET  MULTI_USER 
GO
ALTER DATABASE [LinhKienMTShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LinhKienMTShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LinhKienMTShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LinhKienMTShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LinhKienMTShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LinhKienMTShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LinhKienMTShop', N'ON'
GO
ALTER DATABASE [LinhKienMTShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [LinhKienMTShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LinhKienMTShop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/12/2024 10:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 12/12/2024 10:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChuDeID] [int] NOT NULL,
	[NguoiDungID] [int] NOT NULL,
	[TieuDe] [nvarchar](255) NOT NULL,
	[TieuDeKhongDau] [nvarchar](255) NULL,
	[TomTat] [ntext] NOT NULL,
	[NoiDung] [ntext] NOT NULL,
	[NgayDang] [datetime2](7) NOT NULL,
	[LuotXem] [int] NOT NULL,
	[KiemDuyet] [bit] NOT NULL,
	[HienThi] [bit] NOT NULL,
 CONSTRAINT [PK_BaiViet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinhLuanBaiViet]    Script Date: 12/12/2024 10:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuanBaiViet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BaiVietID] [int] NOT NULL,
	[NguoiDungID] [int] NOT NULL,
	[NoiDungBinhLuan] [ntext] NOT NULL,
	[NgayDang] [datetime2](7) NOT NULL,
	[LuotXem] [int] NOT NULL,
	[KiemDuyet] [bit] NOT NULL,
 CONSTRAINT [PK_BinhLuanBaiViet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 12/12/2024 10:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](255) NOT NULL,
	[TenChuDeKhongDau] [nvarchar](255) NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatHang]    Script Date: 12/12/2024 10:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NguoiDungID] [int] NOT NULL,
	[TinhTrangID] [int] NOT NULL,
	[DienThoaiGiaoHang] [nvarchar](20) NOT NULL,
	[DiaChiGiaoHang] [nvarchar](255) NOT NULL,
	[NgayDatHang] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_DatHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatHang_ChiTiet]    Script Date: 12/12/2024 10:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang_ChiTiet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DatHangID] [int] NOT NULL,
	[SanPhamID] [int] NOT NULL,
	[SoLuong] [smallint] NOT NULL,
	[DonGia] [int] NOT NULL,
 CONSTRAINT [PK_DatHang_ChiTiet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 12/12/2024 10:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[ID] [nvarchar](255) NOT NULL,
	[TenDangNhap] [nvarchar](255) NOT NULL,
	[SanPhamID] [int] NOT NULL,
	[SoLuongTrongGio] [int] NOT NULL,
	[ThoiGian] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangSanXuat]    Script Date: 12/12/2024 10:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangSanXuat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenHangSanXuat] [nvarchar](255) NOT NULL,
	[TenHangSanXuatKhongDau] [nvarchar](255) NULL,
 CONSTRAINT [PK_HangSanXuat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 12/12/2024 10:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](255) NOT NULL,
	[TenLoaiKhongDau] [nvarchar](255) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 12/12/2024 10:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoVaTen] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[DienThoai] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](255) NOT NULL,
	[Quyen] [bit] NOT NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/12/2024 10:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HangSanXuatID] [int] NOT NULL,
	[LoaiSanPhamID] [int] NOT NULL,
	[TenSanPham] [nvarchar](255) NOT NULL,
	[TenSanPhamKhongDau] [nvarchar](255) NULL,
	[DonGia] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[HinhAnh] [nvarchar](255) NULL,
	[MoTa] [ntext] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhTrang]    Script Date: 12/12/2024 10:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MoTa] [nvarchar](255) NOT NULL,
	[MoTaKhongDau] [nvarchar](255) NULL,
 CONSTRAINT [PK_TinhTrang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_BaiViet_ChuDeID]    Script Date: 12/12/2024 10:13:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_BaiViet_ChuDeID] ON [dbo].[BaiViet]
(
	[ChuDeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BaiViet_NguoiDungID]    Script Date: 12/12/2024 10:13:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_BaiViet_NguoiDungID] ON [dbo].[BaiViet]
(
	[NguoiDungID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BinhLuanBaiViet_BaiVietID]    Script Date: 12/12/2024 10:13:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_BinhLuanBaiViet_BaiVietID] ON [dbo].[BinhLuanBaiViet]
(
	[BaiVietID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BinhLuanBaiViet_NguoiDungID]    Script Date: 12/12/2024 10:13:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_BinhLuanBaiViet_NguoiDungID] ON [dbo].[BinhLuanBaiViet]
(
	[NguoiDungID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DatHang_NguoiDungID]    Script Date: 12/12/2024 10:13:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_DatHang_NguoiDungID] ON [dbo].[DatHang]
(
	[NguoiDungID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DatHang_TinhTrangID]    Script Date: 12/12/2024 10:13:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_DatHang_TinhTrangID] ON [dbo].[DatHang]
(
	[TinhTrangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DatHang_ChiTiet_DatHangID]    Script Date: 12/12/2024 10:13:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_DatHang_ChiTiet_DatHangID] ON [dbo].[DatHang_ChiTiet]
(
	[DatHangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DatHang_ChiTiet_SanPhamID]    Script Date: 12/12/2024 10:13:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_DatHang_ChiTiet_SanPhamID] ON [dbo].[DatHang_ChiTiet]
(
	[SanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GioHang_SanPhamID]    Script Date: 12/12/2024 10:13:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_GioHang_SanPhamID] ON [dbo].[GioHang]
(
	[SanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SanPham_HangSanXuatID]    Script Date: 12/12/2024 10:13:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_SanPham_HangSanXuatID] ON [dbo].[SanPham]
(
	[HangSanXuatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SanPham_LoaiSanPhamID]    Script Date: 12/12/2024 10:13:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_SanPham_LoaiSanPhamID] ON [dbo].[SanPham]
(
	[LoaiSanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD  CONSTRAINT [FK_BaiViet_ChuDe_ChuDeID] FOREIGN KEY([ChuDeID])
REFERENCES [dbo].[ChuDe] ([ID])
GO
ALTER TABLE [dbo].[BaiViet] CHECK CONSTRAINT [FK_BaiViet_ChuDe_ChuDeID]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD  CONSTRAINT [FK_BaiViet_NguoiDung_NguoiDungID] FOREIGN KEY([NguoiDungID])
REFERENCES [dbo].[NguoiDung] ([ID])
GO
ALTER TABLE [dbo].[BaiViet] CHECK CONSTRAINT [FK_BaiViet_NguoiDung_NguoiDungID]
GO
ALTER TABLE [dbo].[BinhLuanBaiViet]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuanBaiViet_BaiViet_BaiVietID] FOREIGN KEY([BaiVietID])
REFERENCES [dbo].[BaiViet] ([ID])
GO
ALTER TABLE [dbo].[BinhLuanBaiViet] CHECK CONSTRAINT [FK_BinhLuanBaiViet_BaiViet_BaiVietID]
GO
ALTER TABLE [dbo].[BinhLuanBaiViet]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuanBaiViet_NguoiDung_NguoiDungID] FOREIGN KEY([NguoiDungID])
REFERENCES [dbo].[NguoiDung] ([ID])
GO
ALTER TABLE [dbo].[BinhLuanBaiViet] CHECK CONSTRAINT [FK_BinhLuanBaiViet_NguoiDung_NguoiDungID]
GO
ALTER TABLE [dbo].[DatHang]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_NguoiDung_NguoiDungID] FOREIGN KEY([NguoiDungID])
REFERENCES [dbo].[NguoiDung] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_NguoiDung_NguoiDungID]
GO
ALTER TABLE [dbo].[DatHang]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_TinhTrang_TinhTrangID] FOREIGN KEY([TinhTrangID])
REFERENCES [dbo].[TinhTrang] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_TinhTrang_TinhTrangID]
GO
ALTER TABLE [dbo].[DatHang_ChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_ChiTiet_DatHang_DatHangID] FOREIGN KEY([DatHangID])
REFERENCES [dbo].[DatHang] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DatHang_ChiTiet] CHECK CONSTRAINT [FK_DatHang_ChiTiet_DatHang_DatHangID]
GO
ALTER TABLE [dbo].[DatHang_ChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_ChiTiet_SanPham_SanPhamID] FOREIGN KEY([SanPhamID])
REFERENCES [dbo].[SanPham] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DatHang_ChiTiet] CHECK CONSTRAINT [FK_DatHang_ChiTiet_SanPham_SanPhamID]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_SanPham_SanPhamID] FOREIGN KEY([SanPhamID])
REFERENCES [dbo].[SanPham] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_SanPham_SanPhamID]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_HangSanXuat_HangSanXuatID] FOREIGN KEY([HangSanXuatID])
REFERENCES [dbo].[HangSanXuat] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_HangSanXuat_HangSanXuatID]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham_LoaiSanPhamID] FOREIGN KEY([LoaiSanPhamID])
REFERENCES [dbo].[LoaiSanPham] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham_LoaiSanPhamID]
GO
USE [master]
GO
ALTER DATABASE [LinhKienMTShop] SET  READ_WRITE 
GO
