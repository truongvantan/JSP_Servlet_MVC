USE [master]
GO
/****** Object:  Database [MyMVC]    Script Date: 23/01/2024 17:31:03 PM ******/
CREATE DATABASE [MyMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyMVC', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MyMVC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyMVC_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MyMVC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyMVC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyMVC] SET  MULTI_USER 
GO
ALTER DATABASE [MyMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyMVC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyMVC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyMVC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyMVC] SET QUERY_STORE = OFF
GO
USE [MyMVC]
GO
/****** Object:  Table [dbo].[NGUOIDUNG]    Script Date: 23/01/2024 17:31:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOIDUNG](
	[TenDangNhap] [varchar](30) NOT NULL,
	[MatKhau] [varchar](30) NOT NULL,
	[VaiTro] [varchar](10) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HoVaTen] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
	[DiaChi] [nvarchar](max) NULL,
 CONSTRAINT [PK_NGUOIDUNG] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 23/01/2024 17:31:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](50) NOT NULL,
	[ThuongHieu] [int] NOT NULL,
	[DonGiaNhap] [money] NOT NULL,
	[DonGiaBan] [money] NOT NULL,
	[SoLuongTonKho] [money] NULL,
	[LinkHinhAnh] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THUONGHIEU]    Script Date: 23/01/2024 17:31:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUONGHIEU](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenThuongHieu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_THUONGHIEU] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[NGUOIDUNG] ON 

INSERT [dbo].[NGUOIDUNG] ([TenDangNhap], [MatKhau], [VaiTro], [Id], [HoVaTen], [SDT], [DiaChi]) VALUES (N'admin', N'123456', N'admin', 1, N'Nguyễn Văn Admin', N'0905123456', N'Sơn Trà, Đà Nẵng')
INSERT [dbo].[NGUOIDUNG] ([TenDangNhap], [MatKhau], [VaiTro], [Id], [HoVaTen], [SDT], [DiaChi]) VALUES (N'user', N'123456', N'user', 2, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NGUOIDUNG] OFF
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (1, N'Iphone 1', 1, 1000000.0000, 2000000.0000, 100.0000, N'Link 1', N'Mo ta 1')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (2, N'Iphone 2', 1, 2000000.0000, 3000000.0000, 200.0000, N'Link 2', N'Mo ta 2')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (4, N'Iphone 4', 1, 4000000.0000, 5000000.0000, 400.0000, N'Link 4', N'Mo ta 4')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (5, N'Iphone 5', 1, 5000000.0000, 6000000.0000, 500.0000, N'Link 5', N'Mo ta 5')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (6, N'Iphone 6', 1, 6000000.0000, 7000000.0000, 600.0000, N'Link 6', N'Mo ta 6')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (7, N'Iphone 7', 1, 7000000.0000, 8000000.0000, 700.0000, N'Link 7', N'Mo ta 7')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (8, N'Iphone 8', 1, 8000000.0000, 9000000.0000, 800.0000, N'Link 8', N'Mo ta 8')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (9, N'Iphone 9', 1, 9000000.0000, 10000000.0000, 900.0000, N'Link 9', N'Mo ta 9')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (10, N'Iphone 10', 1, 10000000.0000, 11000000.0000, 1000.0000, N'Link 10', N'Mo ta 10')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (11, N'Iphone 11', 1, 11000000.0000, 12000000.0000, 1100.0000, N'Link 11', N'Mo ta 11')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (12, N'Iphone 12', 1, 12000000.0000, 13000000.0000, 1200.0000, N'Link 12', N'Mo ta 12')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (13, N'Iphone 13', 1, 13000000.0000, 14000000.0000, 1300.0000, N'Link 13', N'Mo ta 13')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (14, N'Iphone 14', 1, 14000000.0000, 15000000.0000, 1400.0000, N'Link 14', N'Mo ta 14')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (15, N'Iphone 15', 1, 15000000.0000, 16000000.0000, 1500.0000, N'Link 15', N'Mo ta 15')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (18, N'Iphone 18', 1, 18000000.0000, 19000000.0000, 1800.0000, N'Link 18', N'Mo ta 18')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (19, N'Iphone 19', 1, 19000000.0000, 20000000.0000, 1900.0000, N'Link 19', N'Mo ta 19')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (20, N'Iphone 20', 1, 20000000.0000, 21000000.0000, 2000.0000, N'Link 20', N'Mo ta 20')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (21, N'Iphone 21', 1, 21000000.0000, 22000000.0000, 2100.0000, N'Link 21', N'Mo ta 21')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (22, N'Iphone 22', 1, 22000000.0000, 23000000.0000, 2200.0000, N'Link 22', N'Mo ta 22')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (23, N'Iphone 23', 1, 23000000.0000, 24000000.0000, 2300.0000, N'Link 23', N'Mo ta 23')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (24, N'Iphone 24', 1, 24000000.0000, 25000000.0000, 2400.0000, N'Link 24', N'Mo ta 24')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (25, N'Iphone 25', 1, 25000000.0000, 26000000.0000, 2500.0000, N'Link 25', N'Mo ta 25')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (26, N'Iphone 26', 1, 26000000.0000, 27000000.0000, 2600.0000, N'Link 26', N'Mo ta 26')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (27, N'Iphone 27', 1, 27000000.0000, 28000000.0000, 2700.0000, N'Link 27', N'Mo ta 27')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (28, N'Iphone 28', 1, 28000000.0000, 29000000.0000, 2800.0000, N'Link 28', N'Mo ta 28')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (29, N'Iphone 29', 1, 29000000.0000, 30000000.0000, 2900.0000, N'Link 29', N'Mo ta 29')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (30, N'Iphone 30', 1, 30000000.0000, 31000000.0000, 3000.0000, N'Link 30', N'Mo ta 30')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (31, N'Iphone 31', 1, 31000000.0000, 32000000.0000, 3100.0000, N'Link 31', N'Mo ta 31')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (32, N'Iphone 32', 1, 32000000.0000, 33000000.0000, 3200.0000, N'Link 32', N'Mo ta 32')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (33, N'Iphone 33', 1, 33000000.0000, 34000000.0000, 3300.0000, N'Link 33', N'Mo ta 33')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (34, N'Iphone 34', 1, 34000000.0000, 35000000.0000, 3400.0000, N'Link 34', N'Mo ta 34')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (35, N'Iphone 35', 1, 35000000.0000, 36000000.0000, 3500.0000, N'Link 35', N'Mo ta 35')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (36, N'Iphone 36', 1, 36000000.0000, 37000000.0000, 3600.0000, N'Link 36', N'Mo ta 36')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (37, N'Iphone 37', 1, 37000000.0000, 38000000.0000, 3700.0000, N'Link 37', N'Mo ta 37')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (38, N'Iphone 38', 1, 38000000.0000, 39000000.0000, 3800.0000, N'Link 38', N'Mo ta 38')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (39, N'Iphone 39', 1, 39000000.0000, 40000000.0000, 3900.0000, N'Link 39', N'Mo ta 39')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (40, N'Iphone 40', 1, 40000000.0000, 41000000.0000, 4000.0000, N'Link 40', N'Mo ta 40')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (41, N'Iphone 41', 1, 41000000.0000, 42000000.0000, 4100.0000, N'Link 41', N'Mo ta 41')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (42, N'Iphone 42', 1, 42000000.0000, 43000000.0000, 4200.0000, N'Link 42', N'Mo ta 42')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (43, N'Iphone 43', 1, 43000000.0000, 44000000.0000, 4300.0000, N'Link 43', N'Mo ta 43')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (44, N'Iphone 44', 1, 44000000.0000, 45000000.0000, 4400.0000, N'Link 44', N'Mo ta 44')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (45, N'Iphone 45', 1, 45000000.0000, 46000000.0000, 4500.0000, N'Link 45', N'Mo ta 45')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (46, N'Iphone 46', 1, 46000000.0000, 47000000.0000, 4600.0000, N'Link 46', N'Mo ta 46')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (47, N'Iphone 47', 1, 47000000.0000, 48000000.0000, 4700.0000, N'Link 47', N'Mo ta 47')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (48, N'Iphone 48', 1, 48000000.0000, 49000000.0000, 4800.0000, N'Link 48', N'Mo ta 48')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (49, N'Iphone 49', 1, 49000000.0000, 50000000.0000, 4900.0000, N'Link 49', N'Mo ta 49')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (50, N'Iphone 50', 1, 50000000.0000, 51000000.0000, 5000.0000, N'Link 50', N'Mo ta 50')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (51, N'Iphone 51', 1, 51000000.0000, 52000000.0000, 5100.0000, N'Link 51', N'Mo ta 51')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (52, N'Iphone 52', 1, 52000000.0000, 53000000.0000, 5200.0000, N'Link 52', N'Mo ta 52')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (53, N'Iphone 53', 1, 53000000.0000, 54000000.0000, 5300.0000, N'Link 53', N'Mo ta 53')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (54, N'Iphone 54', 1, 54000000.0000, 55000000.0000, 5400.0000, N'Link 54', N'Mo ta 54')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (55, N'Iphone 55', 1, 55000000.0000, 56000000.0000, 5500.0000, N'Link 55', N'Mo ta 55')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (56, N'Iphone 56', 1, 56000000.0000, 57000000.0000, 5600.0000, N'Link 56', N'Mo ta 56')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (57, N'Iphone 57', 1, 57000000.0000, 58000000.0000, 5700.0000, N'Link 57', N'Mo ta 57')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (58, N'Iphone 58', 1, 58000000.0000, 59000000.0000, 5800.0000, N'Link 58', N'Mo ta 58')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (59, N'Iphone 59', 1, 59000000.0000, 60000000.0000, 5900.0000, N'Link 59', N'Mo ta 59')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (60, N'Iphone 60', 1, 60000000.0000, 61000000.0000, 6000.0000, N'Link 60', N'Mo ta 60')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (61, N'Iphone 61', 1, 61000000.0000, 62000000.0000, 6100.0000, N'Link 61', N'Mo ta 61')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (62, N'Iphone 62', 1, 62000000.0000, 63000000.0000, 6200.0000, N'Link 62', N'Mo ta 62')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (63, N'Iphone 63', 1, 63000000.0000, 64000000.0000, 6300.0000, N'Link 63', N'Mo ta 63')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (64, N'Iphone 64', 1, 64000000.0000, 65000000.0000, 6400.0000, N'Link 64', N'Mo ta 64')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (65, N'Iphone 65', 1, 65000000.0000, 66000000.0000, 6500.0000, N'Link 65', N'Mo ta 65')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (66, N'Iphone 66', 1, 66000000.0000, 67000000.0000, 6600.0000, N'Link 66', N'Mo ta 66')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (67, N'Iphone 67', 1, 67000000.0000, 68000000.0000, 6700.0000, N'Link 67', N'Mo ta 67')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (68, N'Iphone 68', 1, 68000000.0000, 69000000.0000, 6800.0000, N'Link 68', N'Mo ta 68')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (69, N'Iphone 69', 1, 69000000.0000, 70000000.0000, 6900.0000, N'Link 69', N'Mo ta 69')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (70, N'Iphone 70', 1, 70000000.0000, 71000000.0000, 7000.0000, N'Link 70', N'Mo ta 70')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (71, N'Iphone 71', 1, 71000000.0000, 72000000.0000, 7100.0000, N'Link 71', N'Mo ta 71')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (72, N'Iphone 72', 1, 72000000.0000, 73000000.0000, 7200.0000, N'Link 72', N'Mo ta 72')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (73, N'Iphone 73', 1, 73000000.0000, 74000000.0000, 7300.0000, N'Link 73', N'Mo ta 73')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (74, N'Iphone 74', 1, 74000000.0000, 75000000.0000, 7400.0000, N'Link 74', N'Mo ta 74')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (75, N'Iphone 75', 1, 75000000.0000, 76000000.0000, 7500.0000, N'Link 75', N'Mo ta 75')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (76, N'Iphone 76', 1, 76000000.0000, 77000000.0000, 7600.0000, N'Link 76', N'Mo ta 76')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (77, N'Iphone 77', 1, 77000000.0000, 78000000.0000, 7700.0000, N'Link 77', N'Mo ta 77')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (78, N'Iphone 78', 1, 78000000.0000, 79000000.0000, 7800.0000, N'Link 78', N'Mo ta 78')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (79, N'Iphone 79', 1, 79000000.0000, 80000000.0000, 7900.0000, N'Link 79', N'Mo ta 79')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (80, N'Iphone 80', 1, 80000000.0000, 81000000.0000, 8000.0000, N'Link 80', N'Mo ta 80')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (81, N'Iphone 81', 1, 81000000.0000, 82000000.0000, 8100.0000, N'Link 81', N'Mo ta 81')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (82, N'Iphone 82', 1, 82000000.0000, 83000000.0000, 8200.0000, N'Link 82', N'Mo ta 82')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (83, N'Iphone 83', 1, 83000000.0000, 84000000.0000, 8300.0000, N'Link 83', N'Mo ta 83')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (84, N'Iphone 84', 1, 84000000.0000, 85000000.0000, 8400.0000, N'Link 84', N'Mo ta 84')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (85, N'Iphone 85', 1, 85000000.0000, 86000000.0000, 8500.0000, N'Link 85', N'Mo ta 85')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (86, N'Iphone 86', 1, 86000000.0000, 87000000.0000, 8600.0000, N'Link 86', N'Mo ta 86')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (87, N'Iphone 87', 1, 87000000.0000, 88000000.0000, 8700.0000, N'Link 87', N'Mo ta 87')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (88, N'Iphone 88', 1, 88000000.0000, 89000000.0000, 8800.0000, N'Link 88', N'Mo ta 88')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (89, N'Iphone 89', 1, 89000000.0000, 90000000.0000, 8900.0000, N'Link 89', N'Mo ta 89')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (90, N'Iphone 90', 1, 90000000.0000, 91000000.0000, 9000.0000, N'Link 90', N'Mo ta 90')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (91, N'Iphone 91', 1, 91000000.0000, 92000000.0000, 9100.0000, N'Link 91', N'Mo ta 91')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (92, N'Iphone 92', 1, 92000000.0000, 93000000.0000, 9200.0000, N'Link 92', N'Mo ta 92')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (93, N'Iphone 93', 1, 93000000.0000, 94000000.0000, 9300.0000, N'Link 93', N'Mo ta 93')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (94, N'Iphone 94', 1, 94000000.0000, 95000000.0000, 9400.0000, N'Link 94', N'Mo ta 94')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (95, N'Iphone 95', 1, 95000000.0000, 96000000.0000, 9500.0000, N'Link 95', N'Mo ta 95')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (96, N'Iphone 96', 1, 96000000.0000, 97000000.0000, 9600.0000, N'Link 96', N'Mo ta 96')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (97, N'Iphone 97', 1, 97000000.0000, 98000000.0000, 9700.0000, N'Link 97', N'Mo ta 97')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (98, N'Iphone 98', 1, 98000000.0000, 99000000.0000, 9800.0000, N'Link 98', N'Mo ta 98')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (99, N'Iphone 99', 1, 99000000.0000, 100000000.0000, 9900.0000, N'Link 99', N'Mo ta 99')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (100, N'Iphone 100', 1, 100000000.0000, 101000000.0000, 10000.0000, N'Link 100', N'Mo ta 100')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (101, N'Iphone 101', 1, 101000000.0000, 102000000.0000, 10100.0000, N'Link 101', N'Mo ta 101')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (102, N'Iphone 102', 1, 102000000.0000, 103000000.0000, 10200.0000, N'Link 102', N'Mo ta 102')
GO
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (103, N'Iphone 103', 1, 103000000.0000, 104000000.0000, 10300.0000, N'Link 103', N'Mo ta 103')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (104, N'Iphone 104', 1, 104000000.0000, 105000000.0000, 10400.0000, N'Link 104', N'Mo ta 104')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (105, N'Iphone 105', 1, 105000000.0000, 106000000.0000, 10500.0000, N'Link 105', N'Mo ta 105')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (107, N'Samsung 2', 2, 2000000.0000, 3000000.0000, 200.0000, N'Link 107', N'Mo ta 107')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (108, N'Samsung 3', 2, 3000000.0000, 4000000.0000, 300.0000, N'Link 108', N'Mo ta 108')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (109, N'Samsung 4', 2, 4000000.0000, 5000000.0000, 400.0000, N'Link 109', N'Mo ta 109')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (110, N'Samsung 5', 2, 5000000.0000, 6000000.0000, 500.0000, N'Link 110', N'Mo ta 110')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (111, N'Samsung 6', 2, 6000000.0000, 7000000.0000, 600.0000, N'Link 111', N'Mo ta 111')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (112, N'Samsung 7', 2, 7000000.0000, 8000000.0000, 700.0000, N'Link 112', N'Mo ta 112')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (113, N'Samsung 8', 2, 8000000.0000, 9000000.0000, 800.0000, N'Link 113', N'Mo ta 113')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (114, N'Samsung 9', 2, 9000000.0000, 10000000.0000, 900.0000, N'Link 114', N'Mo ta 114')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (115, N'Samsung 10', 2, 10000000.0000, 11000000.0000, 1000.0000, N'Link 115', N'Mo ta 115')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (116, N'Samsung 11', 2, 11000000.0000, 12000000.0000, 1100.0000, N'Link 116', N'Mo ta 116')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (117, N'Samsung 12', 2, 12000000.0000, 13000000.0000, 1200.0000, N'Link 117', N'Mo ta 117')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (118, N'Samsung 13', 2, 13000000.0000, 14000000.0000, 1300.0000, N'Link 118', N'Mo ta 118')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (119, N'Samsung 14', 2, 14000000.0000, 15000000.0000, 1400.0000, N'Link 119', N'Mo ta 119')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (120, N'Samsung 15', 2, 15000000.0000, 16000000.0000, 1500.0000, N'Link 120', N'Mo ta 120')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (121, N'Samsung 16', 2, 16000000.0000, 17000000.0000, 1600.0000, N'Link 121', N'Mo ta 121')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (122, N'Samsung 17', 2, 17000000.0000, 18000000.0000, 1700.0000, N'Link 122', N'Mo ta 122')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (123, N'Samsung 18', 2, 18000000.0000, 19000000.0000, 1800.0000, N'Link 123', N'Mo ta 123')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (124, N'Samsung 19', 2, 19000000.0000, 20000000.0000, 1900.0000, N'Link 124', N'Mo ta 124')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (125, N'Samsung 20', 2, 20000000.0000, 21000000.0000, 2000.0000, N'Link 125', N'Mo ta 125')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (126, N'Samsung 21', 2, 21000000.0000, 22000000.0000, 2100.0000, N'Link 126', N'Mo ta 126')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (127, N'Samsung 22', 2, 22000000.0000, 23000000.0000, 2200.0000, N'Link 127', N'Mo ta 127')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (128, N'Samsung 23', 2, 23000000.0000, 24000000.0000, 2300.0000, N'Link 128', N'Mo ta 128')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (129, N'Samsung 24', 2, 24000000.0000, 25000000.0000, 2400.0000, N'Link 129', N'Mo ta 129')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (130, N'Samsung 25', 2, 25000000.0000, 26000000.0000, 2500.0000, N'Link 130', N'Mo ta 130')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (131, N'Samsung 26', 2, 26000000.0000, 27000000.0000, 2600.0000, N'Link 131', N'Mo ta 131')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (132, N'Samsung 27', 2, 27000000.0000, 28000000.0000, 2700.0000, N'Link 132', N'Mo ta 132')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (133, N'Samsung 28', 2, 28000000.0000, 29000000.0000, 2800.0000, N'Link 133', N'Mo ta 133')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (134, N'Samsung 29', 2, 29000000.0000, 30000000.0000, 2900.0000, N'Link 134', N'Mo ta 134')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (135, N'Samsung 30', 2, 30000000.0000, 31000000.0000, 3000.0000, N'Link 135', N'Mo ta 135')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (136, N'Samsung 31', 2, 31000000.0000, 32000000.0000, 3100.0000, N'Link 136', N'Mo ta 136')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (137, N'Samsung 32', 2, 32000000.0000, 33000000.0000, 3200.0000, N'Link 137', N'Mo ta 137')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (138, N'Samsung 33', 2, 33000000.0000, 34000000.0000, 3300.0000, N'Link 138', N'Mo ta 138')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (139, N'Samsung 34', 2, 34000000.0000, 35000000.0000, 3400.0000, N'Link 139', N'Mo ta 139')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (140, N'Samsung 35', 2, 35000000.0000, 36000000.0000, 3500.0000, N'Link 140', N'Mo ta 140')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (141, N'Samsung 36', 2, 36000000.0000, 37000000.0000, 3600.0000, N'Link 141', N'Mo ta 141')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (142, N'Samsung 37', 2, 37000000.0000, 38000000.0000, 3700.0000, N'Link 142', N'Mo ta 142')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (143, N'Samsung 38', 2, 38000000.0000, 39000000.0000, 3800.0000, N'Link 143', N'Mo ta 143')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (144, N'Samsung 39', 2, 39000000.0000, 40000000.0000, 3900.0000, N'Link 144', N'Mo ta 144')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (145, N'Samsung 40', 2, 40000000.0000, 41000000.0000, 4000.0000, N'Link 145', N'Mo ta 145')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (146, N'Samsung 41', 2, 41000000.0000, 42000000.0000, 4100.0000, N'Link 146', N'Mo ta 146')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (147, N'Samsung 42', 2, 42000000.0000, 43000000.0000, 4200.0000, N'Link 147', N'Mo ta 147')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (148, N'Samsung 43', 2, 43000000.0000, 44000000.0000, 4300.0000, N'Link 148', N'Mo ta 148')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (149, N'Samsung 44', 2, 44000000.0000, 45000000.0000, 4400.0000, N'Link 149', N'Mo ta 149')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (150, N'Samsung 45', 2, 45000000.0000, 46000000.0000, 4500.0000, N'Link 150', N'Mo ta 150')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (151, N'Samsung 46', 2, 46000000.0000, 47000000.0000, 4600.0000, N'Link 151', N'Mo ta 151')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (152, N'Samsung 47', 2, 47000000.0000, 48000000.0000, 4700.0000, N'Link 152', N'Mo ta 152')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (153, N'Samsung 48', 2, 48000000.0000, 49000000.0000, 4800.0000, N'Link 153', N'Mo ta 153')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (154, N'Samsung 49', 2, 49000000.0000, 50000000.0000, 4900.0000, N'Link 154', N'Mo ta 154')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (155, N'Samsung 50', 2, 50000000.0000, 51000000.0000, 5000.0000, N'Link 155', N'Mo ta 155')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (156, N'Samsung 51', 2, 51000000.0000, 52000000.0000, 5100.0000, N'Link 156', N'Mo ta 156')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (157, N'Samsung 52', 2, 52000000.0000, 53000000.0000, 5200.0000, N'Link 157', N'Mo ta 157')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (158, N'Samsung 53', 2, 53000000.0000, 54000000.0000, 5300.0000, N'Link 158', N'Mo ta 158')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (159, N'Samsung 54', 2, 54000000.0000, 55000000.0000, 5400.0000, N'Link 159', N'Mo ta 159')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (160, N'Samsung 55', 2, 55000000.0000, 56000000.0000, 5500.0000, N'Link 160', N'Mo ta 160')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (161, N'Samsung 56', 2, 56000000.0000, 57000000.0000, 5600.0000, N'Link 161', N'Mo ta 161')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (162, N'Samsung 57', 2, 57000000.0000, 58000000.0000, 5700.0000, N'Link 162', N'Mo ta 162')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (163, N'Samsung 58', 2, 58000000.0000, 59000000.0000, 5800.0000, N'Link 163', N'Mo ta 163')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (164, N'Samsung 59', 2, 59000000.0000, 60000000.0000, 5900.0000, N'Link 164', N'Mo ta 164')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (165, N'Samsung 60', 2, 60000000.0000, 61000000.0000, 6000.0000, N'Link 165', N'Mo ta 165')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (166, N'Samsung 61', 2, 61000000.0000, 62000000.0000, 6100.0000, N'Link 166', N'Mo ta 166')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (167, N'Samsung 62', 2, 62000000.0000, 63000000.0000, 6200.0000, N'Link 167', N'Mo ta 167')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (168, N'Samsung 63', 2, 63000000.0000, 64000000.0000, 6300.0000, N'Link 168', N'Mo ta 168')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (169, N'Samsung 64', 2, 64000000.0000, 65000000.0000, 6400.0000, N'Link 169', N'Mo ta 169')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (170, N'Samsung 65', 2, 65000000.0000, 66000000.0000, 6500.0000, N'Link 170', N'Mo ta 170')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (171, N'Samsung 66', 2, 66000000.0000, 67000000.0000, 6600.0000, N'Link 171', N'Mo ta 171')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (172, N'Samsung 67', 2, 67000000.0000, 68000000.0000, 6700.0000, N'Link 172', N'Mo ta 172')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (173, N'Samsung 68', 2, 68000000.0000, 69000000.0000, 6800.0000, N'Link 173', N'Mo ta 173')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (174, N'Samsung 69', 2, 69000000.0000, 70000000.0000, 6900.0000, N'Link 174', N'Mo ta 174')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (175, N'Samsung 70', 2, 70000000.0000, 71000000.0000, 7000.0000, N'Link 175', N'Mo ta 175')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (176, N'Samsung 71', 2, 71000000.0000, 72000000.0000, 7100.0000, N'Link 176', N'Mo ta 176')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (177, N'Samsung 72', 2, 72000000.0000, 73000000.0000, 7200.0000, N'Link 177', N'Mo ta 177')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (178, N'Samsung 73', 2, 73000000.0000, 74000000.0000, 7300.0000, N'Link 178', N'Mo ta 178')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (179, N'Samsung 74', 2, 74000000.0000, 75000000.0000, 7400.0000, N'Link 179', N'Mo ta 179')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (180, N'Samsung 75', 2, 75000000.0000, 76000000.0000, 7500.0000, N'Link 180', N'Mo ta 180')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (181, N'Samsung 76', 2, 76000000.0000, 77000000.0000, 7600.0000, N'Link 181', N'Mo ta 181')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (182, N'Samsung 77', 2, 77000000.0000, 78000000.0000, 7700.0000, N'Link 182', N'Mo ta 182')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (183, N'Samsung 78', 2, 78000000.0000, 79000000.0000, 7800.0000, N'Link 183', N'Mo ta 183')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (184, N'Samsung 79', 2, 79000000.0000, 80000000.0000, 7900.0000, N'Link 184', N'Mo ta 184')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (185, N'Samsung 80', 2, 80000000.0000, 81000000.0000, 8000.0000, N'Link 185', N'Mo ta 185')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (186, N'Samsung 81', 2, 81000000.0000, 82000000.0000, 8100.0000, N'Link 186', N'Mo ta 186')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (187, N'Samsung 82', 2, 82000000.0000, 83000000.0000, 8200.0000, N'Link 187', N'Mo ta 187')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (188, N'Samsung 83', 2, 83000000.0000, 84000000.0000, 8300.0000, N'Link 188', N'Mo ta 188')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (189, N'Samsung 84', 2, 84000000.0000, 85000000.0000, 8400.0000, N'Link 189', N'Mo ta 189')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (190, N'Samsung 85', 2, 85000000.0000, 86000000.0000, 8500.0000, N'Link 190', N'Mo ta 190')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (191, N'Samsung 86', 2, 86000000.0000, 87000000.0000, 8600.0000, N'Link 191', N'Mo ta 191')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (192, N'Samsung 87', 2, 87000000.0000, 88000000.0000, 8700.0000, N'Link 192', N'Mo ta 192')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (193, N'Samsung 88', 2, 88000000.0000, 89000000.0000, 8800.0000, N'Link 193', N'Mo ta 193')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (194, N'Samsung 89', 2, 89000000.0000, 90000000.0000, 8900.0000, N'Link 194', N'Mo ta 194')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (195, N'Samsung 90', 2, 90000000.0000, 91000000.0000, 9000.0000, N'Link 195', N'Mo ta 195')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (196, N'Samsung 91', 2, 91000000.0000, 92000000.0000, 9100.0000, N'Link 196', N'Mo ta 196')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (197, N'Samsung 92', 2, 92000000.0000, 93000000.0000, 9200.0000, N'Link 197', N'Mo ta 197')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (198, N'Samsung 93', 2, 93000000.0000, 94000000.0000, 9300.0000, N'Link 198', N'Mo ta 198')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (199, N'Samsung 94', 2, 94000000.0000, 95000000.0000, 9400.0000, N'Link 199', N'Mo ta 199')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (200, N'Samsung 95', 2, 95000000.0000, 96000000.0000, 9500.0000, N'Link 200', N'Mo ta 200')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (201, N'Samsung 96', 2, 96000000.0000, 97000000.0000, 9600.0000, N'Link 201', N'Mo ta 201')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (202, N'Samsung 97', 2, 97000000.0000, 98000000.0000, 9700.0000, N'Link 202', N'Mo ta 202')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (203, N'Samsung 98', 2, 98000000.0000, 99000000.0000, 9800.0000, N'Link 203', N'Mo ta 203')
GO
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (204, N'Samsung 99', 2, 99000000.0000, 100000000.0000, 9900.0000, N'Link 204', N'Mo ta 204')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (205, N'Samsung 100', 2, 100000000.0000, 101000000.0000, 10000.0000, N'Link 205', N'Mo ta 205')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (206, N'Samsung 101', 2, 101000000.0000, 102000000.0000, 10100.0000, N'Link 206', N'Mo ta 206')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (207, N'Samsung 102', 2, 102000000.0000, 103000000.0000, 10200.0000, N'Link 207', N'Mo ta 207')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (208, N'Samsung 103', 2, 103000000.0000, 104000000.0000, 10300.0000, N'Link 208', N'Mo ta 208')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (209, N'Samsung 104', 2, 104000000.0000, 105000000.0000, 10400.0000, N'Link 209', N'Mo ta 209')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (210, N'Samsung 105', 2, 105000000.0000, 106000000.0000, 10500.0000, N'Link 210', N'Mo ta 210')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (211, N'Oppo 1', 3, 1000000.0000, 2000000.0000, 100.0000, N'Link 211', N'Mo ta 211')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (213, N'Oppo 3', 3, 3000000.0000, 4000000.0000, 300.0000, N'Link 213', N'Mo ta 213')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (214, N'Oppo 4', 3, 4000000.0000, 5000000.0000, 400.0000, N'Link 214', N'Mo ta 214')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (215, N'Oppo 5', 3, 5000000.0000, 6000000.0000, 500.0000, N'Link 215', N'Mo ta 215')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (216, N'Oppo 6', 3, 6000000.0000, 7000000.0000, 600.0000, N'Link 216', N'Mo ta 216')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (217, N'Oppo 7', 3, 7000000.0000, 8000000.0000, 700.0000, N'Link 217', N'Mo ta 217')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (218, N'Oppo 8', 3, 8000000.0000, 9000000.0000, 800.0000, N'Link 218', N'Mo ta 218')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (219, N'Oppo 9', 3, 9000000.0000, 10000000.0000, 900.0000, N'Link 219', N'Mo ta 219')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (220, N'Oppo 10', 3, 10000000.0000, 11000000.0000, 1000.0000, N'Link 220', N'Mo ta 220')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (221, N'Oppo 11', 3, 11000000.0000, 12000000.0000, 1100.0000, N'Link 221', N'Mo ta 221')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (222, N'Oppo 12', 3, 12000000.0000, 13000000.0000, 1200.0000, N'Link 222', N'Mo ta 222')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (223, N'Oppo 13', 3, 13000000.0000, 14000000.0000, 1300.0000, N'Link 223', N'Mo ta 223')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (224, N'Oppo 14', 3, 14000000.0000, 15000000.0000, 1400.0000, N'Link 224', N'Mo ta 224')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (225, N'Oppo 15', 3, 15000000.0000, 16000000.0000, 1500.0000, N'Link 225', N'Mo ta 225')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (226, N'Oppo 16', 3, 16000000.0000, 17000000.0000, 1600.0000, N'Link 226', N'Mo ta 226')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (227, N'Oppo 17', 3, 17000000.0000, 18000000.0000, 1700.0000, N'Link 227', N'Mo ta 227')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (228, N'Oppo 18', 3, 18000000.0000, 19000000.0000, 1800.0000, N'Link 228', N'Mo ta 228')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (229, N'Oppo 19', 3, 19000000.0000, 20000000.0000, 1900.0000, N'Link 229', N'Mo ta 229')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (230, N'Oppo 20', 3, 20000000.0000, 21000000.0000, 2000.0000, N'Link 230', N'Mo ta 230')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (231, N'Oppo 21', 3, 21000000.0000, 22000000.0000, 2100.0000, N'Link 231', N'Mo ta 231')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (232, N'Oppo 22', 3, 22000000.0000, 23000000.0000, 2200.0000, N'Link 232', N'Mo ta 232')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (233, N'Oppo 23', 3, 23000000.0000, 24000000.0000, 2300.0000, N'Link 233', N'Mo ta 233')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (234, N'Oppo 24', 3, 24000000.0000, 25000000.0000, 2400.0000, N'Link 234', N'Mo ta 234')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (235, N'Oppo 25', 3, 25000000.0000, 26000000.0000, 2500.0000, N'Link 235', N'Mo ta 235')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (236, N'Oppo 26', 3, 26000000.0000, 27000000.0000, 2600.0000, N'Link 236', N'Mo ta 236')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (237, N'Oppo 27', 3, 27000000.0000, 28000000.0000, 2700.0000, N'Link 237', N'Mo ta 237')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (238, N'Oppo 28', 3, 28000000.0000, 29000000.0000, 2800.0000, N'Link 238', N'Mo ta 238')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (239, N'Oppo 29', 3, 29000000.0000, 30000000.0000, 2900.0000, N'Link 239', N'Mo ta 239')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (240, N'Oppo 30', 3, 30000000.0000, 31000000.0000, 3000.0000, N'Link 240', N'Mo ta 240')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (241, N'Oppo 31', 3, 31000000.0000, 32000000.0000, 3100.0000, N'Link 241', N'Mo ta 241')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (242, N'Oppo 32', 3, 32000000.0000, 33000000.0000, 3200.0000, N'Link 242', N'Mo ta 242')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (243, N'Oppo 33', 3, 33000000.0000, 34000000.0000, 3300.0000, N'Link 243', N'Mo ta 243')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (244, N'Oppo 34', 3, 34000000.0000, 35000000.0000, 3400.0000, N'Link 244', N'Mo ta 244')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (245, N'Oppo 35', 3, 35000000.0000, 36000000.0000, 3500.0000, N'Link 245', N'Mo ta 245')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (246, N'Oppo 36', 3, 36000000.0000, 37000000.0000, 3600.0000, N'Link 246', N'Mo ta 246')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (247, N'Oppo 37', 3, 37000000.0000, 38000000.0000, 3700.0000, N'Link 247', N'Mo ta 247')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (248, N'Oppo 38', 3, 38000000.0000, 39000000.0000, 3800.0000, N'Link 248', N'Mo ta 248')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (249, N'Oppo 39', 3, 39000000.0000, 40000000.0000, 3900.0000, N'Link 249', N'Mo ta 249')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (250, N'Oppo 40', 3, 40000000.0000, 41000000.0000, 4000.0000, N'Link 250', N'Mo ta 250')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (251, N'Oppo 41', 3, 41000000.0000, 42000000.0000, 4100.0000, N'Link 251', N'Mo ta 251')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (252, N'Oppo 42', 3, 42000000.0000, 43000000.0000, 4200.0000, N'Link 252', N'Mo ta 252')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (253, N'Oppo 43', 3, 43000000.0000, 44000000.0000, 4300.0000, N'Link 253', N'Mo ta 253')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (254, N'Oppo 44', 3, 44000000.0000, 45000000.0000, 4400.0000, N'Link 254', N'Mo ta 254')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (255, N'Oppo 45', 3, 45000000.0000, 46000000.0000, 4500.0000, N'Link 255', N'Mo ta 255')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (256, N'Oppo 46', 3, 46000000.0000, 47000000.0000, 4600.0000, N'Link 256', N'Mo ta 256')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (257, N'Oppo 47', 3, 47000000.0000, 48000000.0000, 4700.0000, N'Link 257', N'Mo ta 257')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (258, N'Oppo 48', 3, 48000000.0000, 49000000.0000, 4800.0000, N'Link 258', N'Mo ta 258')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (259, N'Oppo 49', 3, 49000000.0000, 50000000.0000, 4900.0000, N'Link 259', N'Mo ta 259')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (260, N'Oppo 50', 3, 50000000.0000, 51000000.0000, 5000.0000, N'Link 260', N'Mo ta 260')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (261, N'Oppo 51', 3, 51000000.0000, 52000000.0000, 5100.0000, N'Link 261', N'Mo ta 261')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (262, N'Oppo 52', 3, 52000000.0000, 53000000.0000, 5200.0000, N'Link 262', N'Mo ta 262')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (263, N'Oppo 53', 3, 53000000.0000, 54000000.0000, 5300.0000, N'Link 263', N'Mo ta 263')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (264, N'Oppo 54', 3, 54000000.0000, 55000000.0000, 5400.0000, N'Link 264', N'Mo ta 264')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (265, N'Oppo 55', 3, 55000000.0000, 56000000.0000, 5500.0000, N'Link 265', N'Mo ta 265')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (266, N'Oppo 56', 3, 56000000.0000, 57000000.0000, 5600.0000, N'Link 266', N'Mo ta 266')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (267, N'Oppo 57', 3, 57000000.0000, 58000000.0000, 5700.0000, N'Link 267', N'Mo ta 267')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (268, N'Oppo 58', 3, 58000000.0000, 59000000.0000, 5800.0000, N'Link 268', N'Mo ta 268')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (269, N'Oppo 59', 3, 59000000.0000, 60000000.0000, 5900.0000, N'Link 269', N'Mo ta 269')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (270, N'Oppo 60', 3, 60000000.0000, 61000000.0000, 6000.0000, N'Link 270', N'Mo ta 270')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (271, N'Oppo 61', 3, 61000000.0000, 62000000.0000, 6100.0000, N'Link 271', N'Mo ta 271')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (272, N'Oppo 62', 3, 62000000.0000, 63000000.0000, 6200.0000, N'Link 272', N'Mo ta 272')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (273, N'Oppo 63', 3, 63000000.0000, 64000000.0000, 6300.0000, N'Link 273', N'Mo ta 273')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (274, N'Oppo 64', 3, 64000000.0000, 65000000.0000, 6400.0000, N'Link 274', N'Mo ta 274')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (275, N'Oppo 65', 3, 65000000.0000, 66000000.0000, 6500.0000, N'Link 275', N'Mo ta 275')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (276, N'Oppo 66', 3, 66000000.0000, 67000000.0000, 6600.0000, N'Link 276', N'Mo ta 276')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (277, N'Oppo 67', 3, 67000000.0000, 68000000.0000, 6700.0000, N'Link 277', N'Mo ta 277')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (278, N'Oppo 68', 3, 68000000.0000, 69000000.0000, 6800.0000, N'Link 278', N'Mo ta 278')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (279, N'Oppo 69', 3, 69000000.0000, 70000000.0000, 6900.0000, N'Link 279', N'Mo ta 279')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (280, N'Oppo 70', 3, 70000000.0000, 71000000.0000, 7000.0000, N'Link 280', N'Mo ta 280')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (281, N'Oppo 71', 3, 71000000.0000, 72000000.0000, 7100.0000, N'Link 281', N'Mo ta 281')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (282, N'Oppo 72', 3, 72000000.0000, 73000000.0000, 7200.0000, N'Link 282', N'Mo ta 282')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (283, N'Oppo 73', 3, 73000000.0000, 74000000.0000, 7300.0000, N'Link 283', N'Mo ta 283')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (284, N'Oppo 74', 3, 74000000.0000, 75000000.0000, 7400.0000, N'Link 284', N'Mo ta 284')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (285, N'Oppo 75', 3, 75000000.0000, 76000000.0000, 7500.0000, N'Link 285', N'Mo ta 285')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (286, N'Oppo 76', 3, 76000000.0000, 77000000.0000, 7600.0000, N'Link 286', N'Mo ta 286')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (287, N'Oppo 77', 3, 77000000.0000, 78000000.0000, 7700.0000, N'Link 287', N'Mo ta 287')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (288, N'Oppo 78', 3, 78000000.0000, 79000000.0000, 7800.0000, N'Link 288', N'Mo ta 288')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (289, N'Oppo 79', 3, 79000000.0000, 80000000.0000, 7900.0000, N'Link 289', N'Mo ta 289')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (290, N'Oppo 80', 3, 80000000.0000, 81000000.0000, 8000.0000, N'Link 290', N'Mo ta 290')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (291, N'Oppo 81', 3, 81000000.0000, 82000000.0000, 8100.0000, N'Link 291', N'Mo ta 291')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (292, N'Oppo 82', 3, 82000000.0000, 83000000.0000, 8200.0000, N'Link 292', N'Mo ta 292')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (293, N'Oppo 83', 3, 83000000.0000, 84000000.0000, 8300.0000, N'Link 293', N'Mo ta 293')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (294, N'Oppo 84', 3, 84000000.0000, 85000000.0000, 8400.0000, N'Link 294', N'Mo ta 294')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (295, N'Oppo 85', 3, 85000000.0000, 86000000.0000, 8500.0000, N'Link 295', N'Mo ta 295')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (296, N'Oppo 86', 3, 86000000.0000, 87000000.0000, 8600.0000, N'Link 296', N'Mo ta 296')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (297, N'Oppo 87', 3, 87000000.0000, 88000000.0000, 8700.0000, N'Link 297', N'Mo ta 297')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (298, N'Oppo 88', 3, 88000000.0000, 89000000.0000, 8800.0000, N'Link 298', N'Mo ta 298')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (299, N'Oppo 89', 3, 89000000.0000, 90000000.0000, 8900.0000, N'Link 299', N'Mo ta 299')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (300, N'Oppo 90', 3, 90000000.0000, 91000000.0000, 9000.0000, N'Link 300', N'Mo ta 300')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (301, N'Oppo 91', 3, 91000000.0000, 92000000.0000, 9100.0000, N'Link 301', N'Mo ta 301')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (302, N'Oppo 92', 3, 92000000.0000, 93000000.0000, 9200.0000, N'Link 302', N'Mo ta 302')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (303, N'Oppo 93', 3, 93000000.0000, 94000000.0000, 9300.0000, N'Link 303', N'Mo ta 303')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (304, N'Oppo 94', 3, 94000000.0000, 95000000.0000, 9400.0000, N'Link 304', N'Mo ta 304')
GO
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (305, N'Oppo 95', 3, 95000000.0000, 96000000.0000, 9500.0000, N'Link 305', N'Mo ta 305')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (306, N'Oppo 96', 3, 96000000.0000, 97000000.0000, 9600.0000, N'Link 306', N'Mo ta 306')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (307, N'Oppo 97', 3, 97000000.0000, 98000000.0000, 9700.0000, N'Link 307', N'Mo ta 307')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (308, N'Oppo 98', 3, 98000000.0000, 99000000.0000, 9800.0000, N'Link 308', N'Mo ta 308')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (309, N'Oppo 99', 3, 99000000.0000, 100000000.0000, 9900.0000, N'Link 309', N'Mo ta 309')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (310, N'Oppo 100', 3, 100000000.0000, 101000000.0000, 10000.0000, N'Link 310', N'Mo ta 310')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (311, N'Oppo 101', 3, 101000000.0000, 102000000.0000, 10100.0000, N'Link 311', N'Mo ta 311')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (312, N'Oppo 102', 3, 102000000.0000, 103000000.0000, 10200.0000, N'Link 312', N'Mo ta 312')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (313, N'Oppo 103', 3, 103000000.0000, 104000000.0000, 10300.0000, N'Link 313', N'Mo ta 313')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (314, N'Oppo 104', 3, 104000000.0000, 105000000.0000, 10400.0000, N'Link 314', N'Mo ta 314')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (315, N'Oppo 105', 3, 105000000.0000, 106000000.0000, 10500.0000, N'Link 315', N'Mo ta 315')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (316, N'Iphone 2024', 1, 12345.0000, 123456.0000, NULL, N'', N'')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (317, N'Iphone 2025', 1, 12345.0000, 123456.0000, NULL, N'', N'')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (318, N'oppo 2023', 3, 1111.0000, 2222.0000, NULL, N'', N'')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (323, N'bbb', 1, 111.0000, 222.0000, NULL, N'', N'')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (326, N'hello world 123', 1, 333.0000, 456.0000, NULL, N'', N'')
INSERT [dbo].[SANPHAM] ([Id], [TenSanPham], [ThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [LinkHinhAnh], [MoTa]) VALUES (327, N'hello iphone', 1, 454444.0000, 123123123.0000, NULL, N'', N'')
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
SET IDENTITY_INSERT [dbo].[THUONGHIEU] ON 

INSERT [dbo].[THUONGHIEU] ([Id], [TenThuongHieu]) VALUES (1, N'Iphone')
INSERT [dbo].[THUONGHIEU] ([Id], [TenThuongHieu]) VALUES (2, N'Samsung')
INSERT [dbo].[THUONGHIEU] ([Id], [TenThuongHieu]) VALUES (3, N'Oppo')
SET IDENTITY_INSERT [dbo].[THUONGHIEU] OFF
GO
/****** Object:  Index [IX_NGUOIDUNG]    Script Date: 23/01/2024 17:31:03 PM ******/
ALTER TABLE [dbo].[NGUOIDUNG] ADD  CONSTRAINT [IX_NGUOIDUNG] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_THUONGHIEU] FOREIGN KEY([ThuongHieu])
REFERENCES [dbo].[THUONGHIEU] ([Id])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_THUONGHIEU]
GO
USE [master]
GO
ALTER DATABASE [MyMVC] SET  READ_WRITE 
GO
