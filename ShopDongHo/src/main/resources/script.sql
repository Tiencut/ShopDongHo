USE [master]
GO
/****** Object:  Database [ShopDongHo]    Script Date: 12/26/2023 10:07:29 AM ******/
CREATE DATABASE [ShopDongHo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopBanGiay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ShopBanGiay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopBanGiay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ShopBanGiay_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShopDongHo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopDongHo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopDongHo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopDongHo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopDongHo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopDongHo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopDongHo] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopDongHo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopDongHo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopDongHo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopDongHo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopDongHo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopDongHo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopDongHo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopDongHo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopDongHo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopDongHo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopDongHo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopDongHo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopDongHo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopDongHo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopDongHo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopDongHo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopDongHo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopDongHo] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopDongHo] SET  MULTI_USER 
GO
ALTER DATABASE [ShopDongHo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopDongHo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopDongHo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopDongHo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopDongHo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopDongHo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopDongHo', N'ON'
GO
ALTER DATABASE [ShopDongHo] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShopDongHo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShopDongHo]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/26/2023 10:07:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [int] NULL,
	[SoLuong] [bigint] NULL,
	[MaHoaDon] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoiTuongSD]    Script Date: 12/26/2023 10:07:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoiTuongSD](
	[MaDoiTuongSD] [int] NOT NULL,
	[TenDoiTuongSD] [nvarchar](50) NULL,
 CONSTRAINT [PK_DoiTuongSD] PRIMARY KEY CLUSTERED 
(
	[MaDoiTuongSD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 12/26/2023 10:07:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaHoaDon] [int] NOT NULL,
	[HoVaTen] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SDT] [nvarchar](max) NULL,
	[TongTien] [bigint] NULL,
	[MaDonDatHang] [int] IDENTITY(1,1) NOT NULL,
	[TinhTrang] [bit] NULL,
 CONSTRAINT [PK_DonDatHang_1] PRIMARY KEY CLUSTERED 
(
	[MaDonDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/26/2023 10:07:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung] [int] NULL,
	[NgayMua] [datetime] NULL,
	[DaMua] [bit] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 12/26/2023 10:07:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiDung] [nvarchar](max) NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Quyen] [bit] NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 12/26/2023 10:07:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/26/2023 10:07:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](max) NULL,
	[DonGia] [bigint] NULL,
	[HinhAnh] [nvarchar](50) NULL,
	[LoaiDongHo] [nvarchar](50) NULL,
	[MaNSX] [int] NOT NULL,
	[MaDoiTuongSD] [int] NOT NULL,
	[DaXoa] [bit] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaSanPham], [SoLuong], [MaHoaDon]) VALUES (2043, 8379, 3, 2014)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaSanPham], [SoLuong], [MaHoaDon]) VALUES (2044, 8380, 1, 2015)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaSanPham], [SoLuong], [MaHoaDon]) VALUES (2045, 8379, 1, 2016)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaSanPham], [SoLuong], [MaHoaDon]) VALUES (2047, 8379, 2, 2018)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaSanPham], [SoLuong], [MaHoaDon]) VALUES (2048, 8398, 2, 2020)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaSanPham], [SoLuong], [MaHoaDon]) VALUES (2049, 8380, 1, 2020)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
INSERT [dbo].[DoiTuongSD] ([MaDoiTuongSD], [TenDoiTuongSD]) VALUES (0, N'Nam')
INSERT [dbo].[DoiTuongSD] ([MaDoiTuongSD], [TenDoiTuongSD]) VALUES (1, N'Nữ')
INSERT [dbo].[DoiTuongSD] ([MaDoiTuongSD], [TenDoiTuongSD]) VALUES (2, N'Unisex')
INSERT [dbo].[DoiTuongSD] ([MaDoiTuongSD], [TenDoiTuongSD]) VALUES (3, N'Trẻ em')
GO
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaHoaDon], [HoVaTen], [DiaChi], [SDT], [TongTien], [MaDonDatHang], [TinhTrang]) VALUES (2014, N'Người dùng 1', N'Địa chỉ người dùng 1', N'0987654321', 102000, 2012, 1)
INSERT [dbo].[DonDatHang] ([MaHoaDon], [HoVaTen], [DiaChi], [SDT], [TongTien], [MaDonDatHang], [TinhTrang]) VALUES (2016, N'Người dùng 2', N'ĐỊa chỉ ok', N'0987654321', 34000, 2013, 1)
INSERT [dbo].[DonDatHang] ([MaHoaDon], [HoVaTen], [DiaChi], [SDT], [TongTien], [MaDonDatHang], [TinhTrang]) VALUES (2015, N'Người dùng 1', N'Địa chỉ người dùng 1', N'0987654321', 25000, 2014, 1)
INSERT [dbo].[DonDatHang] ([MaHoaDon], [HoVaTen], [DiaChi], [SDT], [TongTien], [MaDonDatHang], [TinhTrang]) VALUES (2018, N'dfdf fd', N'Địa chỉ người dùng 1', N'0987654321', 68000, 2015, 1)
INSERT [dbo].[DonDatHang] ([MaHoaDon], [HoVaTen], [DiaChi], [SDT], [TongTien], [MaDonDatHang], [TinhTrang]) VALUES (2020, N'Người dùng 1', N'Địa chỉ người dùng 1', N'0987654321', 183000, 2016, 0)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [DaMua]) VALUES (2014, 2009, CAST(N'2023-12-26T08:22:59.243' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [DaMua]) VALUES (2015, 2009, CAST(N'2023-12-26T08:23:58.290' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [DaMua]) VALUES (2016, 2010, CAST(N'2023-12-26T08:24:56.443' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [DaMua]) VALUES (2017, 7, CAST(N'2023-12-26T08:25:36.587' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [DaMua]) VALUES (2018, 2009, CAST(N'2023-12-26T09:59:23.277' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [DaMua]) VALUES (2019, 2009, CAST(N'2023-12-26T10:00:35.657' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [DaMua]) VALUES (2020, 2010, CAST(N'2023-12-26T10:02:21.063' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenNguoiDung], [TenDangNhap], [MatKhau], [Quyen]) VALUES (7, N'admin', N'admin', N'21232f297a57a5a743894a0e4a801fc3', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenNguoiDung], [TenDangNhap], [MatKhau], [Quyen]) VALUES (2009, N'Tên Người Dùng 1', N'nguoidung1', N'b562f20efc65e67ee63dfe447727c77a', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenNguoiDung], [TenDangNhap], [MatKhau], [Quyen]) VALUES (2010, N'Người dùng 2', N'nguoidung2', N'2ba4429b433335ed1e92648284126e21', 0)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (0, N'CASIO')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (1, N'Audemars Piguet
')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (2, N'Mido')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (3, N'Casio')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (4, N'Mido')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (5, N'Ogival')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (6, N'OP')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (7, N'IWC')
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8379, N'Đồng Hồ A', 34000, N'00.png', N'Ana-Digi', 1, 2, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8380, N'Đồng hồ B', 25000, N'01.png', N'Ana-Digi', 2, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8381, N'dong ho 33333333', 63000, N'02.png', N'Analog', 4, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8382, N'03', 46000, N'03.png', N'Ana-Digi', 0, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8383, N'04', 62000, N'04.png', N'Analog', 4, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8384, N'05', 43000, N'05.png', N'Digital', 4, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8385, N'06', 92000, N'06.png', N'Analog', 3, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8386, N'07', 54000, N'07.png', N'Ana-Digi', 3, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8387, N'08', 22000, N'08.png', N'Digital', 2, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8388, N'09', 96000, N'09.png', N'Ana-Digi', 4, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8389, N'10', 72000, N'10.png', N'Analog', 0, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8390, N'11', 13000, N'11.jpg', N'Analog', 0, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8391, N'12', 36000, N'12.jpg', N'Digital', 1, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8392, N'13', 12000, N'13.jpg', N'Ana-Digi', 2, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8393, N'14', 74000, N'14.jpg', N'Analog', 1, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8394, N'15', 12000, N'15.jpg', N'Analog', 1, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8395, N'16', 48000, N'16.jpg', N'Digital', 0, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8396, N'17', 58000, N'17.jpg', N'Digital', 2, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8397, N'18', 24000, N'18.jpg', N'Digital', 2, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8398, N'19', 79000, N'19.jpg', N'Digital', 1, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8399, N'20', 91000, N'20.jpg', N'Ana-Digi', 1, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8400, N'21', 7000, N'21.jpg', N'Analog', 4, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8401, N'22', 65000, N'22.jpg', N'Ana-Digi', 2, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8402, N'23', 6000, N'23.jpg', N'Ana-Digi', 3, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8403, N'24', 71000, N'24.jpg', N'Analog', 2, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8404, N'25', 2000, N'25.jpg', N'Analog', 2, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8405, N'26', 30000, N'26.jpg', N'Ana-Digi', 1, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8406, N'27', 55000, N'27.jpg', N'Analog', 1, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8407, N'28', 67000, N'28.jpg', N'Ana-Digi', 3, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8408, N'29', 9000, N'29.png', N'Ana-Digi', 0, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8409, N'30', 27000, N'30.png', N'Analog', 2, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8410, N'31', 39000, N'31.jpg', N'Ana-Digi', 1, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8411, N'32', 30000, N'32.png', N'Analog', 1, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8412, N'33', 16000, N'33.jpg', N'Analog', 3, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8413, N'34', 5000, N'34.jpg', N'Analog', 4, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8414, N'35', 7000, N'35.jpg', N'Analog', 2, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8415, N'36', 22000, N'36.jpg', N'Analog', 2, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8416, N'37', 73000, N'37.jpg', N'Ana-Digi', 4, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8417, N'38', 78000, N'38.jpg', N'Analog', 0, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8418, N'39', 13000, N'39.jpg', N'Analog', 4, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8419, N'40', 62000, N'40.jpg', N'Analog', 3, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8420, N'41', 68000, N'41.jpg', N'Ana-Digi', 1, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8421, N'42', 32000, N'42.jpg', N'Digital', 2, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8422, N'43', 51000, N'43.jpg', N'Ana-Digi', 3, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8423, N'44', 67000, N'44.jpg', N'Digital', 3, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8424, N'45', 92000, N'45.jpg', N'Analog', 4, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8425, N'46', 58000, N'46.jpg', N'Analog', 1, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8426, N'47', 84000, N'47.jpg', N'Analog', 1, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8427, N'48', 10000, N'48.jpg', N'Ana-Digi', 3, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8428, N'49', 89000, N'49.jpg', N'Ana-Digi', 3, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8429, N'50', 7000, N'50.jpg', N'Digital', 2, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8430, N'51', 69000, N'51.jpg', N'Analog', 4, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8431, N'52', 63000, N'52.jpg', N'Ana-Digi', 2, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8432, N'53', 60000, N'53.jpg', N'Digital', 2, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8433, N'54', 49000, N'54.jpg', N'Ana-Digi', 2, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8434, N'55', 42000, N'55.jpg', N'Digital', 4, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8435, N'56', 92000, N'56.jpg', N'Ana-Digi', 3, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8436, N'57', 21000, N'57.jpg', N'Ana-Digi', 1, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8437, N'58', 49000, N'58.jpg', N'Analog', 4, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8438, N'59', 85000, N'59.jpg', N'Analog', 3, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8439, N'60', 54000, N'60.jpg', N'Analog', 1, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8440, N'61', 39000, N'61.jpg', N'Analog', 0, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8441, N'62', 28000, N'62.jpg', N'Ana-Digi', 0, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8442, N'63', 94000, N'63.jpg', N'Ana-Digi', 2, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8443, N'64', 8000, N'64.jpg', N'Digital', 3, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8444, N'65', 18000, N'65.jpg', N'Analog', 1, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8445, N'66', 10000, N'66.jpg', N'Digital', 0, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8446, N'67', 52000, N'67.jpg', N'Ana-Digi', 2, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8447, N'68', 20000, N'68.jpg', N'Ana-Digi', 4, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8448, N'69', 4000, N'69.jpg', N'Digital', 3, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8449, N'70', 45000, N'70.jpg', N'Digital', 1, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8450, N'71', 3000, N'71.jpg', N'Digital', 0, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8451, N'72', 94000, N'72.jpg', N'Digital', 0, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8452, N'73', 88000, N'73.jpg', N'Digital', 4, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8453, N'74', 49000, N'74.jpg', N'Ana-Digi', 0, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8454, N'75', 19000, N'75.jpg', N'Analog', 0, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8455, N'76', 99000, N'76.jpg', N'Ana-Digi', 1, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8456, N'77', 99000, N'77.jpg', N'Ana-Digi', 1, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8457, N'78', 73000, N'78.jpg', N'Digital', 3, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8458, N'79', 93000, N'79.jpg', N'Digital', 3, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8459, N'80', 91000, N'80.jpg', N'Ana-Digi', 4, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8460, N'81', 92000, N'81.jpg', N'Ana-Digi', 3, 2, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8461, N'82', 57000, N'82.jpg', N'Digital', 4, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8462, N'83', 35000, N'83.jpg', N'Ana-Digi', 4, 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (8479, N'Đồng hồ A', 23000, N'8463.png', N'Analog', 0, 0, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [HinhAnh], [LoaiDongHo], [MaNSX], [MaDoiTuongSD], [DaXoa]) VALUES (9479, N'aaaaaaaaaa', 34444, N'8480.png', N'Analog', 0, 0, 0)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_HoaDon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NguoiDung]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DoiTuongSD] FOREIGN KEY([MaDoiTuongSD])
REFERENCES [dbo].[DoiTuongSD] ([MaDoiTuongSD])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DoiTuongSD]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaSanXuat]
GO
/****** Object:  StoredProcedure [dbo].[GetMaHoaDon]    Script Date: 12/26/2023 10:07:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetMaHoaDon] 
	@maNguoiDung int
AS
BEGIN
	SET NOCOUNT ON;
	declare @TaoMoi int = 
	(
		select top 1 MaHoaDon 
		from HoaDon
		where DaMua = 0 and MaNguoiDung = @maNguoiDung
	)

	if (@TaoMoi > 0) 
		return @TaoMoi;
	
	begin
		insert into HoaDon(MaNguoiDung, NgayMua, DaMua)
		values (@maNguoiDung, GETDATE(), 0);
	end
	begin
		set @TaoMoi = (
			select top 1 MaHoaDon 
			from HoaDon
			where DaMua = 0 and MaNguoiDung = @maNguoiDung
		)
	end
	return @TaoMoi
END
GO
/****** Object:  StoredProcedure [dbo].[ThemVaoCTHoaDon]    Script Date: 12/26/2023 10:07:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ThemVaoCTHoaDon] 
	@masanpham int, 
	@soluong bigint,
	@mahoadon int
AS
BEGIN
	SET NOCOUNT ON;
	declare @tontai int = 
	(
		select top 1 SoLuong 
		from ChiTietHoaDon
		where MaHoaDon = @mahoadon and  MaSanPham = @masanpham
	)
	if (@tontai > 0) 
		begin
			update ChiTietHoaDon
			set SoLuong = @soluong
			where MaHoaDon = @mahoadon and MaSanPham = @masanpham
		end
	else 
		begin
			insert into ChiTietHoaDon(MaSanPham, SoLuong, MaHoaDon)
			values (@masanpham, @soluong, @mahoadon);
		end
END
GO
USE [master]
GO
ALTER DATABASE [ShopDongHo] SET  READ_WRITE 
GO
