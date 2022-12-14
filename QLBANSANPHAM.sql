USE [master]
GO
/****** Object:  Database [QLSANPHAM]    Script Date: 12/2/2019 1:47:06 PM ******/
CREATE DATABASE [QLSANPHAM]
 CONTAINMENT = NONE
ALTER DATABASE [QLSANPHAM] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSANPHAM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSANPHAM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSANPHAM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSANPHAM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSANPHAM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSANPHAM] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSANPHAM] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLSANPHAM] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLSANPHAM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSANPHAM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSANPHAM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSANPHAM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSANPHAM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSANPHAM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSANPHAM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSANPHAM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSANPHAM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLSANPHAM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSANPHAM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSANPHAM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSANPHAM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSANPHAM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSANPHAM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSANPHAM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSANPHAM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLSANPHAM] SET  MULTI_USER 
GO
ALTER DATABASE [QLSANPHAM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSANPHAM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSANPHAM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSANPHAM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLSANPHAM]
GO
/****** Object:  Table [dbo].[CHITIETDONHANG]    Script Date: 12/2/2019 1:47:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONHANG](
	[MADONHANG] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NOT NULL,
	[SOLUONG] [int] NULL,
	[DONGIA] [int] NULL,
 CONSTRAINT [PK_CTDH] PRIMARY KEY CLUSTERED 
(
	[MADONHANG] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DangNhapAmin]    Script Date: 12/2/2019 1:47:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhapAmin](
	[TaiKhoan] [nvarchar](max) NULL,
	[MatKhau] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DONGHO]    Script Date: 12/2/2019 1:47:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](max) NULL,
	[GiaBan] [money] NULL,
	[MoTa] [nvarchar](max) NULL,
	[NgayCapNhat] [datetime] NULL,
	[AnhBia] [nvarchar](max) NULL,
	[SoLuongTon] [int] NULL,
	[MaHA] [int] NULL,
	[XuatXu] [nvarchar](20) NULL,
	[Moi] [int] NULL,
 CONSTRAINT [PK_SP] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DONHANG]    Script Date: 12/2/2019 1:47:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONHANG](
	[MADONHANG] [int] IDENTITY(1,1) NOT NULL,
	[NGAYGIAO] [datetime] NULL,
	[NGAYDAT] [datetime] NULL,
	[DATHANHTOAN] [nvarchar](50) NULL,
	[TINHTRANGGIAO] [int] NULL,
	[MAKH] [int] NULL,
	[TONGTIEN] [int] NULL,
 CONSTRAINT [PK_DH] PRIMARY KEY CLUSTERED 
(
	[MADONHANG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HANG]    Script Date: 12/2/2019 1:47:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANG](
	[MaHA] [int] IDENTITY(1,1) NOT NULL,
	[TenHA] [nvarchar](50) NULL,
 CONSTRAINT [PK_SPw] PRIMARY KEY CLUSTERED 
(
	[MaHA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 12/2/2019 1:47:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MAKH] [int] IDENTITY(1,1) NOT NULL,
	[HOTEN] [nvarchar](50) NULL,
	[GIOITINH] [nvarchar](10) NULL,
	[DIACHI] [nvarchar](50) NULL,
	[SDT] [varchar](40) NULL,
	[EMAIL] [varchar](50) NULL,
	[NGAYSINH] [date] NULL,
	[TAIKHOAN] [nvarchar](50) NULL,
	[MATKHAU] [nvarchar](50) NULL,
 CONSTRAINT [PK_KH] PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 12/2/2019 1:47:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[TENTK] [nvarchar](30) NULL,
	[MATKHAU] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THELOAITIN]    Script Date: 12/2/2019 1:47:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THELOAITIN](
	[MALOAI] [int] IDENTITY(1,1) NOT NULL,
	[TENTHELOAI] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MALOAI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TINTUC]    Script Date: 12/2/2019 1:47:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TINTUC](
	[MATIN] [int] IDENTITY(1,1) NOT NULL,
	[MALOAI] [int] NULL,
	[TIEUDETIN] [nvarchar](100) NULL,
	[NOIDUNGTIN] [nvarchar](max) NULL,
	[NGAYDANGTIN] [date] NULL,
	[ANHTIN] [nvarchar](max) NULL,
	[MoiNhat] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MATIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CHITIETDONHANG] ON 

INSERT [dbo].[CHITIETDONHANG] ([MADONHANG], [MaSP], [SOLUONG], [DONGIA]) VALUES (19, 6, 1, 3850000)
INSERT [dbo].[CHITIETDONHANG] ([MADONHANG], [MaSP], [SOLUONG], [DONGIA]) VALUES (20, 7, 1, 3850000)
INSERT [dbo].[CHITIETDONHANG] ([MADONHANG], [MaSP], [SOLUONG], [DONGIA]) VALUES (21, 9, 1, 50000000)
INSERT [dbo].[CHITIETDONHANG] ([MADONHANG], [MaSP], [SOLUONG], [DONGIA]) VALUES (22, 9, 1, 50000000)
INSERT [dbo].[CHITIETDONHANG] ([MADONHANG], [MaSP], [SOLUONG], [DONGIA]) VALUES (23, 8, 1, 37750000)
INSERT [dbo].[CHITIETDONHANG] ([MADONHANG], [MaSP], [SOLUONG], [DONGIA]) VALUES (24, 8, 1, 37750000)
INSERT [dbo].[CHITIETDONHANG] ([MADONHANG], [MaSP], [SOLUONG], [DONGIA]) VALUES (25, 18, 1, 980000000)
INSERT [dbo].[CHITIETDONHANG] ([MADONHANG], [MaSP], [SOLUONG], [DONGIA]) VALUES (26, 2, 1, 5390000)
SET IDENTITY_INSERT [dbo].[CHITIETDONHANG] OFF
INSERT [dbo].[DangNhapAmin] ([TaiKhoan], [MatKhau]) VALUES (N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (2, N'Giay Nike Jodan1', 7000000.0000, N'Là mẫu giày đang hot nhất hiện tại, được giới trẻ và nghệ sĩ săn đón nồng nhiệt', CAST(0x0000000000000000 AS DateTime), N'02.PNG', 10, 3, N'Mỹ', 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (3, N'Giay Ultra boots',5500000.0000, N'Đây là đôi giày mà có đế bằng boots , rất êm đem đến cảm giác dễ chịu và săn chắc cho đôi chân', CAST(0x0000000000000000 AS DateTime), N'03.PNG', 10, 3, N'Đức', 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (4, N'Giay Gucci Tiger',19000000.0000, N'Đây là đôi giày được giới thương lưu săn đón nồng nhiệt vì độ sang chảnh của nó', CAST(0x0000000000000000 AS DateTime), N'04.PNG', 10, 3, N'Ý', 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (5, N'Giay Supreme',15000000.0000, N'Là đôi giày mà bạn trẻ nào cũng mang nó một lần, vì giá trị của nó và độ chịu chơi', CAST(0x0000000000000000 AS DateTime), N'05.PNG', 10, 3, N'Mỹ', 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (6, N'Giay Van Oldschool',3000000.0000, N'Là đôi giày dược các bạn học sinh mê mệt, với kiểu dáng đơn giản không kém phần thu hút', CAST(0x0000000000000000 AS DateTime), N'06.PNG', 20, 3, N'Việt Nam', 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (7, N'Quan Gucci Distressed', 18000000.0000, N'Một trong những chiếc quần đẹp nhất của Gucci,được giới nghệ sĩ ưa chuộng và săn đón', CAST(0x0000000000000000 AS DateTime), N'07.PNG', 20, 1, N'Ý', 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (8, N'Quan Supreme print jogging pants', 40000000.0000, N'Một chiếc quần tinh tế và phá cách của hãng Supreme,rất được ưa chuộng ở Mỹ ', CAST(0x0000000000000000 AS DateTime), N'08.PNG', 20, 1, N'Mỹ', 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (9, N'Quan Vans Caro', 1500000.0000, N'Quần Caro của  Vans là một trong những chiếc quần dễ phối đồ nhất, với giá thành vừa phải', CAST(0x0000000000000000 AS DateTime), N'09.PNG', 20, 1, N'Việt Nam', 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (10, N'Quan Balenciaga Black Gym Wear Jogger', 6000000.0000, N'Đây là một trong những hãng thời trang đẩng cấp thế giới nên chiếc quần này quả là tuyệt phẩm', CAST(0x0000000000000000 AS DateTime), N'10.PNG', 20, 1, N'Pháp ', 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (11, N'Quan Dior Denim Slim Fit Jeans Pants', 6000000.0000, N'Dior là thương hiệu nhất nhì về thời trang và chiếc quần này cũng không phải dạng vừa', CAST(0x0000000000000000 AS DateTime), N'11.PNG', 20, 1, N'Pháp', 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (12, N'Ao Khoac Du Den Nam', 10000000.0000, N'Là mẫu áo khoác dù Hot hiện tại, cơn sốt về chiếc áo khoác này vẫn chưa dừng lại', CAST(0x0000000000000000 AS DateTime), N'12.PNG', 20, 2, N'Việt Nam', 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (13, N'Ao T-shirt Samurai', 2000000.0000, N'Một chiếc áo năng động và khỏe khoắn,giúp người mặc tưởng tượng mình là một samurai thực thụ', CAST(0x0000000000000000 AS DateTime), N'13.PNG', 20, 2, N'Nhật Bản', 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (14, N'Ao T-shirt Black Fighter', 2500000.0000, N'Là mẫu áo màu đen huyền bí, và nổi bật hình ảnh chiến đấu giúp người mặt tỏa lên sự năng động và tích cực ', CAST(0x0000000000000000 AS DateTime), N'14.PNG', 20, 2, N'Thái Lan', 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (15, N'Ao Khoac Nu Yellow Cat', 900000.0000, N'Mẫu áo khoác được các bạn nữ săn đón nhiều trong thời gian gần đây với màu sắc và kiểu dáng dễ thương', CAST(0x0000000000000000 AS DateTime), N'15.PNG', 20, 2, N'Mỹ', 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (16, N'Ao Khoac Black And White', 1000000.0000, N'Mẫu áo khoác phá cách giữa màu trắng và đen, tôn lên vẻ đẹp bóng tối và ánh sáng', CAST(0x0000000000000000 AS DateTime), N'16.PNG', 20, 2, N'Mỹ', 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (17, N'Tui Gucci raffia HANA', 10000000.0000, N'Nói về gucci thì Túi Xách là khỏi phải bàn cãi, mẫu này là một ví dụ điển hình', CAST(0x0000000000000000 AS DateTime), N'17.PNG', 20, 4, N'Ý', 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (18, N'Tui LV mono brown', 2500000.0000, N'Mẫu túi đơn giản của LV, được thiết kế và bán ra với giá thành trung bình vừa túi tiền của Chị em phụ nữ', CAST(0x0000000000000000 AS DateTime), N'18.PNG', 20, 4, N'Ý', 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (19, N'Tui Charlet & Keith', 15000000.0000, N'Một mẫu túi khá là đẹp mắt và đang dần phát triển mạnh mẽ trên thị trường Túi Xách,giá thành vừa phải ', CAST(0x0000000000000000 AS DateTime), N'19.PNG', 20, 4, N'Singapore', 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (20, N'Tui Balenciaga Classic City Mini', 27000000.0000, N'Đây là mẫu túi đỉnh cao của Hãng thời trang Balenciaga , với thiết kế độc đáo và chất liệu cao cấp', CAST(0x0000000000000000 AS DateTime), N'20.PNG', 20, 4, N'Pháp', 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (21, N'Tui Hermes Constance 24 Shiny', 10000000000.0000, N'Là mẫu túi được các nữa đại gia và nghệ sĩ săn đón vì giá thành và chất lượng với sự nổi trội của Hermes', CAST(0x0000000000000000 AS DateTime), N'21.PNG', 20, 4, N'Pháp', 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (22, N'DongHo G-Shock MTG-B1000', 20000000.0000, N'Là mẫu đồng hồ mà các bạn học sinh rất ưa chuộng,các loại G-Shock không thể thiếu được với các thư sinh', CAST(0x0000000000000000 AS DateTime), N'22.PNG', 20, 5, N'Nhật Bản', 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (23, N'DongHo JACOB & CO ASJP ZODIAC', 4000000000.0000, N'Đây là mẫu đồng hồ với thiết kế dải thiên hà với các hành tinh giống với thực tế,là một kiệt tác mơ ước của tất cả quý ông', CAST(0x0000000000000000 AS DateTime), N'23.PNG', 20, 5, N'Thụy Sĩ', 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (24, N'DongHo Apple Watch', 7700000.0000, N'Nếu các bạn xài dòng Iphone thì đây là một chiếc đồng hồ sẽ giúp đỡ bạn và nhiều lợi ích mà nó mang lại', CAST(0x0000000000000000 AS DateTime), N'24.PNG', 20, 5, N'Mỹ', 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (25, N'DongHo Hublot Spirit Of BigBang', 530000000.0000, N'Đây là mẫu Hublot đáng đồng tiền bác gạo với chất liệu bằng vàng và các viên kim cương đính trên đồng hồ', CAST(0x0000000000000000 AS DateTime), N'25.PNG', 20, 5, N'Thụy Sĩ', 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaHA], [XuatXu], [Moi]) VALUES (26, N'DongHo Louis Moinet MMS Black and Red', 3000000000.0000, N'Là mẫu đồng hồ gần đây đã gây được tiếng vang lớn trong thị trường đồng hồ với giá thành và chất lượng tốt', CAST(0x0000000000000000 AS DateTime), N'25.PNG', 20, 5, N'Thụy Sĩ', 3)


SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
SET IDENTITY_INSERT [dbo].[DONHANG] ON 

INSERT [dbo].[DONHANG] ([MADONHANG], [NGAYGIAO], [NGAYDAT], [DATHANHTOAN], [TINHTRANGGIAO], [MAKH], [TONGTIEN]) VALUES (1, CAST(0x0000AAEB00000000 AS DateTime), CAST(0x0000AAE900000000 AS DateTime), NULL, NULL, 1, 2300000)
INSERT [dbo].[DONHANG] ([MADONHANG], [NGAYGIAO], [NGAYDAT], [DATHANHTOAN], [TINHTRANGGIAO], [MAKH], [TONGTIEN]) VALUES (2, CAST(0x0000AA5F00000000 AS DateTime), CAST(0x0000AA5C00000000 AS DateTime), NULL, NULL, 2, 40000000)
INSERT [dbo].[DONHANG] ([MADONHANG], [NGAYGIAO], [NGAYDAT], [DATHANHTOAN], [TINHTRANGGIAO], [MAKH], [TONGTIEN]) VALUES (3, CAST(0x0000AA6900000000 AS DateTime), CAST(0x0000AA6000000000 AS DateTime), NULL, NULL, 3, 14000000)
INSERT [dbo].[DONHANG] ([MADONHANG], [NGAYGIAO], [NGAYDAT], [DATHANHTOAN], [TINHTRANGGIAO], [MAKH], [TONGTIEN]) VALUES (4, CAST(0x0000AB2A00000000 AS DateTime), CAST(0x0000AB2900000000 AS DateTime), NULL, NULL, 3, 30000000)
INSERT [dbo].[DONHANG] ([MADONHANG], [NGAYGIAO], [NGAYDAT], [DATHANHTOAN], [TINHTRANGGIAO], [MAKH], [TONGTIEN]) VALUES (5, CAST(0x0000AA4100000000 AS DateTime), CAST(0x0000AA4000000000 AS DateTime), NULL, NULL, 4, 32000000)
INSERT [dbo].[DONHANG] ([MADONHANG], [NGAYGIAO], [NGAYDAT], [DATHANHTOAN], [TINHTRANGGIAO], [MAKH], [TONGTIEN]) VALUES (6, CAST(0x0000A9C900000000 AS DateTime), CAST(0x0000AB0900B19365 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[DONHANG] ([MADONHANG], [NGAYGIAO], [NGAYDAT], [DATHANHTOAN], [TINHTRANGGIAO], [MAKH], [TONGTIEN]) VALUES (7, CAST(0x0000A9C800000000 AS DateTime), CAST(0x0000AB0900B70A2F AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[DONHANG] ([MADONHANG], [NGAYGIAO], [NGAYDAT], [DATHANHTOAN], [TINHTRANGGIAO], [MAKH], [TONGTIEN]) VALUES (8, CAST(0x0000A9E700000000 AS DateTime), CAST(0x0000AB0900B7DF52 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[DONHANG] ([MADONHANG], [NGAYGIAO], [NGAYDAT], [DATHANHTOAN], [TINHTRANGGIAO], [MAKH], [TONGTIEN]) VALUES (9, CAST(0x0000AB3500000000 AS DateTime), CAST(0x0000AB0900B86247 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[DONHANG] ([MADONHANG], [NGAYGIAO], [NGAYDAT], [DATHANHTOAN], [TINHTRANGGIAO], [MAKH], [TONGTIEN]) VALUES (10, CAST(0x0000A9E700000000 AS DateTime), CAST(0x0000AB09014E576E AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[DONHANG] ([MADONHANG], [NGAYGIAO], [NGAYDAT], [DATHANHTOAN], [TINHTRANGGIAO], [MAKH], [TONGTIEN]) VALUES (11, CAST(0x0000AB3400000000 AS DateTime), CAST(0x0000AB090152D526 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[DONHANG] ([MADONHANG], [NGAYGIAO], [NGAYDAT], [DATHANHTOAN], [TINHTRANGGIAO], [MAKH], [TONGTIEN]) VALUES (12, CAST(0x0000A9C800000000 AS DateTime), CAST(0x0000AB0E00AEB210 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[DONHANG] ([MADONHANG], [NGAYGIAO], [NGAYDAT], [DATHANHTOAN], [TINHTRANGGIAO], [MAKH], [TONGTIEN]) VALUES (13, CAST(0x0000A9CA00000000 AS DateTime), CAST(0x0000AB1200F24424 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[DONHANG] ([MADONHANG], [NGAYGIAO], [NGAYDAT], [DATHANHTOAN], [TINHTRANGGIAO], [MAKH], [TONGTIEN]) VALUES (14, CAST(0x0000A9C800000000 AS DateTime), CAST(0x0000AB1700DFF734 AS DateTime), NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[DONHANG] OFF
SET IDENTITY_INSERT [dbo].[HANG] ON 


INSERT [dbo].[HANG] ([MaHA], [TenHA]) VALUES (1, N'Quan')
INSERT [dbo].[HANG] ([MaHA], [TenHA]) VALUES (2, N'Ao')
INSERT [dbo].[HANG] ([MaHA], [TenHA]) VALUES (3, N'Giay')
INSERT [dbo].[HANG] ([MaHA], [TenHA]) VALUES (4, N'GioXach')
INSERT [dbo].[HANG] ([MaHA], [TenHA]) VALUES (5, N'DongHo')


SET IDENTITY_INSERT [dbo].[HANG] OFF
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [GIOITINH], [DIACHI], [SDT], [EMAIL], [NGAYSINH], [TAIKHOAN], [MATKHAU]) VALUES (1, N'Luong Mao Kien Phat', N'Nam', N'L29 Chung cu Tan Phuoc P7 Q11 TPHCM', N'0923115039', N'maokienphat@gmail.com', CAST(0xB8230B00 AS Date), N'Phat', N'Phat')
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [GIOITINH], [DIACHI], [SDT], [EMAIL], [NGAYSINH], [TAIKHOAN], [MATKHAU]) VALUES (2, N'Tran Ngoc Khai', N'Nam', N'997 Tran Hung Dao P5 Q5 DaNang', N'0323456712', N'khaingoctran@gmail.com', CAST(0xBE230B00 AS Date), N'Khai', N'Khai')
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [GIOITINH], [DIACHI], [SDT], [EMAIL], [NGAYSINH], [TAIKHOAN], [MATKHAU]) VALUES (3, N'Vu Ngoc Anh', N'Nu', N'879 CMT8 P10 Q10 HaNoi', N'0909234124', N'ngocanhvu@gmail.com', CAST(0xBA220B00 AS Date), N'Anh', N'Anh')
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [GIOITINH], [DIACHI], [SDT], [EMAIL], [NGAYSINH], [TAIKHOAN], [MATKHAU]) VALUES (4, N'Nguyen Truong Gia Khanh', N'Nam', N'94 Quang Trung P3 Q12 TPHCM', N'0794942125', N'linhgia@gmail.com', CAST(0x801D0B00 AS Date), N'Khanh', N'Khanh')

SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[THELOAITIN] ON 

INSERT [dbo].[THELOAITIN] ([MALOAI], [TENTHELOAI]) VALUES (1, N'Tin Trong Nuoc')
INSERT [dbo].[THELOAITIN] ([MALOAI], [TENTHELOAI]) VALUES (2, N'Tin Quoc Te')

SET IDENTITY_INSERT [dbo].[THELOAITIN] OFF
SET IDENTITY_INSERT [dbo].[TINTUC] ON 


INSERT [dbo].[TINTUC] ([MATIN], [MALOAI], [TIEUDETIN], [NOIDUNGTIN], [NGAYDANGTIN], [ANHTIN], [MoiNhat]) VALUES (2, 1, N'Showbiz',N'Nghe si Chi Tai qua doi tai chung cu cua minh', CAST(0x47400B00 AS Date), N'h4.jpg', N'1')
INSERT [dbo].[TINTUC] ([MATIN], [MALOAI], [TIEUDETIN], [NOIDUNGTIN], [NGAYDANGTIN], [ANHTIN], [MoiNhat]) VALUES (3, 1, N'Am nhac',N'Son Tung M-TP ra mat san pham danh dau su tro lai', CAST(0x47400B00 AS Date), N'h2.jpg', N'1')
INSERT [dbo].[TINTUC] ([MATIN], [MALOAI], [TIEUDETIN], [NOIDUNGTIN], [NGAYDANGTIN], [ANHTIN], [MoiNhat]) VALUES (4, 2, N'Bong Da',N'Manchester Unitied thang PSG 3-0 tren san nha', CAST(0x47400B00 AS Date), N'h3.jpg', N'1')
INSERT [dbo].[TINTUC] ([MATIN], [MALOAI], [TIEUDETIN], [NOIDUNGTIN], [NGAYDANGTIN], [ANHTIN], [MoiNhat]) VALUES (5, 2, N'Thoi su', N'Gia vang tang manh', CAST(0x47400B00 AS Date), N'h1.PNG', N'1')

SET IDENTITY_INSERT [dbo].[TINTUC] OFF
ALTER TABLE [dbo].[CHITIETDONHANG]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_SP] FOREIGN KEY([MASP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[CHITIETDONHANG] CHECK CONSTRAINT [FK_CTDH_SP]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_DONGHO_HANG] FOREIGN KEY([MaHA])
REFERENCES [dbo].[HANG] ([MaHA])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_DONGHO_HANG]
GO
ALTER TABLE [dbo].[DONHANG]  WITH CHECK ADD  CONSTRAINT [FK_DH_KH] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHACHHANG] ([MAKH])
GO
ALTER TABLE [dbo].[DONHANG] CHECK CONSTRAINT [FK_DH_KH]
GO
ALTER TABLE [dbo].[TINTUC]  WITH CHECK ADD FOREIGN KEY([MALOAI])
REFERENCES [dbo].[THELOAITIN] ([MALOAI])
GO
USE [master]
GO
ALTER DATABASE [QLDONGHO] SET  READ_WRITE 
GO
