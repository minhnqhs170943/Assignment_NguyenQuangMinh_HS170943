﻿USE [master]
GO
/****** Object:  Database [fastfood]    Script Date: 3/4/2024 1:52:48 AM ******/
CREATE DATABASE [apple_meomeo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'fastfood', FILENAME = N'E:\New folder\MSSQL16.MSSQLSERVER\MSSQL\DATA\fastfood.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'fastfood_log', FILENAME = N'E:\New folder\MSSQL16.MSSQLSERVER\MSSQL\DATA\fastfood_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [fastfood] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [fastfood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [fastfood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [fastfood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [fastfood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [fastfood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [fastfood] SET ARITHABORT OFF 
GO
ALTER DATABASE [fastfood] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [fastfood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [fastfood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [fastfood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [fastfood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [fastfood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [fastfood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [fastfood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [fastfood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [fastfood] SET  ENABLE_BROKER 
GO
ALTER DATABASE [fastfood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [fastfood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [fastfood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [fastfood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [fastfood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [fastfood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [fastfood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [fastfood] SET RECOVERY FULL 
GO
ALTER DATABASE [fastfood] SET  MULTI_USER 
GO
ALTER DATABASE [fastfood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [fastfood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [fastfood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [fastfood] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [fastfood] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [fastfood] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'fastfood', N'ON'
GO
ALTER DATABASE [fastfood] SET QUERY_STORE = ON
GO
ALTER DATABASE [fastfood] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [fastfood]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/4/2024 1:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 3/4/2024 1:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/4/2024 1:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[phonenumber] [nvarchar](20) NULL,
	[Address] [nvarchar](255) NULL,
	[OrderDate] [date] NULL,
	[TotalAmount] [int] NULL,
	[StatusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 3/4/2024 1:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[orderstatus_id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderstatus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/4/2024 1:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 3/4/2024 1:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/4/2024 1:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Name]) VALUES (1, N'Thịt tươi')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (2, N'Rau củ')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (3, N'Thực phẩm sẵn')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (4, N'Đồ ăn nhanh')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (5, N'Đồ uống')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (1, 1, 3, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (2, 1, 2, 2)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (3, 2, 18, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (4, 2, 19, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (5, 3, 5, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (6, 3, 8, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (7, 4, 11, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (8, 4, 12, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (9, 4, 13, 2)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (10, 5, 5, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (11, 5, 7, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (12, 5, 23, 2)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (13, 5, 56, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (14, 6, 61, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (15, 6, 80, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (16, 6, 90, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (17, 7, 17, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (18, 7, 16, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (19, 7, 37, 2)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (20, 7, 40, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (21, 7, 60, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (22, 7, 89, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (23, 8, 24, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (24, 8, 40, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (25, 8, 52, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (26, 8, 80, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (27, 9, 3, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (28, 9, 68, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (29, 9, 80, 2)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (30, 10, 2, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (31, 10, 63, 2)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (32, 11, 2, 3)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (33, 11, 68, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (34, 11, 3, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (35, 11, 79, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (36, 11, 6, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (37, 11, 56, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (38, 12, 42, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (39, 12, 7, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (40, 12, 5, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (41, 13, 42, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (42, 13, 7, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (43, 13, 5, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (44, 14, 47, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (45, 15, 1, 2)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (46, 15, 5, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (47, 15, 109, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (48, 16, 1, 2)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (49, 16, 5, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (50, 16, 109, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (51, 17, 2, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (52, 18, 1, 2)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (53, 18, 7, 1)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (54, 18, 109, 2)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (1, 3, N'vit con cute', N'037373737', N'Boy pho HaNoi', CAST(N'2023-10-20' AS Date), 115000, 3)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (2, 2, N'meo con cute', N'037373737', N'Hot gril NamDing', CAST(N'2023-10-30' AS Date), 65000, 3)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (3, 2, N'ga con cute', N'037373737', N'Trap boy FPT', CAST(N'2023-11-01' AS Date), 65000, 3)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (4, 3, N'cho con cute', N'037373737', N'Sad girl HaiPhong', CAST(N'2023-10-20' AS Date), 160000, 2)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (5, 4, N'Nguyễn Trường Huy', N'0364816112', N'Thạch Hòa, Thạch Thất, Hà Nội', CAST(N'2023-11-06' AS Date), 155000, 3)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (6, 4, N'nguy', N'0364816112', N'Thạch Hòa, Thạch Thất, Hà Nội', CAST(N'2023-11-06' AS Date), 90000, 3)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (7, 5, N'Văn Hoàng', N'0123456789', N'Na Hang, Tuyên Quang', CAST(N'2023-11-06' AS Date), 185000, 1)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (8, 3, N'Hoàng Neymar', N'4309657363', N'phố 276, Tỉnh sujeft, Brazil', CAST(N'2023-11-06' AS Date), 237000, 2)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (9, 6, N'quan van truong', N'9743453245', N'Vu Han, Trung Quoc', CAST(N'2023-11-07' AS Date), 140000, 1)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (10, 7, N'Trieu tu long', N'035354546456', N'vu han, trung quoc', CAST(N'2023-11-07' AS Date), 234000, 1)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (11, 5, N'Pham Van Hoang', N'0945667346', N'Thach, Hoa, Thach That, Ha Noi', CAST(N'2023-11-08' AS Date), 439000, 1)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (12, 4, N'n t huy', N'0345678906', N'Thạch Hòa, Thạch Thất, Hà Nội', CAST(N'2023-11-09' AS Date), 167000, 1)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (13, 4, N'n t huy', N'0345678906', N'Thạch Hòa, Thạch Thất, Hà Nội', CAST(N'2023-11-09' AS Date), 167000, 1)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (14, 4, N'Huy', N'0827549666', N'Thạch Hòa, Thạch Thất, Hà Nội', CAST(N'2024-01-24' AS Date), 60000, 1)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (15, 8, N'TrHuyNgurYeenxx', N'0987638754', N'Thạch Hòa, Thạch Thất, Hà Nội', CAST(N'2024-03-04' AS Date), 111000, 1)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (16, 8, N'TrHuyNgurYeenxx', N'0987638754', N'Thạch Hòa, Thạch Thất, Hà Nội', CAST(N'2024-03-04' AS Date), 111000, 1)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (17, 8, N'Tuấn Cùi Bến Tre', N'4098768765', N'Hà Giang', CAST(N'2024-03-04' AS Date), 74000, 1)
INSERT [dbo].[Orders] ([ID], [UserID], [Name], [phonenumber], [Address], [OrderDate], [TotalAmount], [StatusID]) VALUES (18, 4, N'Huy', N'0987349856', N'Thạch Hòa, Thạch Thất, Hà Nội', CAST(N'2024-03-04' AS Date), 119000, 3)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([orderstatus_id], [status_name]) VALUES (1, N'wait')
INSERT [dbo].[OrderStatus] ([orderstatus_id], [status_name]) VALUES (2, N'process')
INSERT [dbo].[OrderStatus] ([orderstatus_id], [status_name]) VALUES (3, N'done')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (1, N'Đậu Mơ Bà Tú', N'Dùng ngay khi nhận hàng
Tủ mát <10 ngày
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 15000, N'img/product/daumobatu.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (2, N'Sườn Non Heo Nguyên Tảng', N'Dùng ngay khi nhận hàng
Tủ đông <30 ngày
Lưu ý:
- Không cấp đông thực phẩm trở lại khi đã rã đông
- Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 74000, N'img/product/suonnonheonguyentang.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (3, N'Tim Heo', N'35000', 55000, N'img/product/timheo.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (4, N'Sụn Non Heo', N'Tủ đông <6 tháng
Lưu ý:- Không cấp đông thực phẩm trở lại khi đã rã đông
- Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 89000, N'img/product/sunnonheo.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (5, N'Nạc Vai Heo', N'Tủ đông <6 tháng
Lưu ý:Không cấp đông thực phẩm trở lại khi đã rã đông
Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 56000, N'img/product/nacvaiheo.png', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (6, N'Khoanh Giò Heo', N'Tủ đông <6 tháng
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 55000, N'img/product/khoanhgioheo.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (7, N'Trứng Gà', N'Dùng ngay khi nhận hàng
Tủ mát <10 ngày
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 39000, N'img/product/trungga.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (8, N'Trứng Vịt', N'Dùng ngay khi nhận hàng
Tủ mát <10 ngày
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 45000, N'img/product/trungvit.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (9, N'Bắp Bò Cắt Mỏng', N'Dùng ngay khi nhận hàng
Tủ đông <30 ngày
Lưu ý:- Không cấp đông thực phẩm trở lại khi đã rã đông
- Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 139000, N'img/product/bapbocatmong.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (10, N'Tôm Sú', N'30 ngày kể từ ngày đóng gói
Tủ đông <30 ngày
Lưu ý:- Không cấp đông thực phẩm trở lại khi đã rã đông
- Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 79000, N'img/product/tomsu.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (11, N'Lõi Vai Bò Canada', N'Dùng ngay khi nhận hàng
Tủ đông <30 ngày
Lưu ý:- Không cấp đông thực phẩm trở lại khi đã rã đông
- Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 129000, N'img/product/loivaibocanada.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (12, N'Ba Chỉ Bò Cắt Mỏng', N'Dùng ngay khi nhận hàng
Tủ đông <30 ngày
Lưu ý:- Không cấp đông thực phẩm trở lại khi đã rã đông
- Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 139000, N'img/product/bachibocatmong.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (13, N'Rib Finger Dẻ Sườn Bò', N'Dùng ngay khi nhận hàng
Tủ đông <30 ngày
Lưu ý:- Không cấp đông thực phẩm trở lại khi đã rã đông
- Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 220000, N'img/product/desuonbo.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (14, N'Thăn Bò Úc Cắt Lúc Lắc', N'Dùng ngay khi nhận hàng
Tủ đông <30 ngày
Lưu ý:- Không cấp đông thực phẩm trở lại khi đã rã đông
- Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 63000, N'img/product/thanbouc.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (15, N'Ức Gà', N'Dùng ngay khi nhận hàng
Tủ đông <30 ngày
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 24000, N'img/product/ucga.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (16, N'Gà Ta', N'Dùng ngay khi nhận hàng
Tủ đông <30 tháng
Lưu ý:- Không cấp đông thực phẩm trở lại khi đã rã đông
- Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 54000, N'img/product/gata.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (17, N'Lòng Gà', N'Dùng ngay khi nhận hàng
Tủ đông <15 ngày
Lưu ý:- Không cấp đông thực phẩm trở lại khi đã rã đông
- Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 23000, N'img/product/longga.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (18, N'Vịt', N'Dùng ngay khi nhận hàng
Tủ đông <30 ngày
Lưu ý:- Không sử dụng khi sản phẩm có dấu hiệu hư hỏng
- Không cấp đông thực phẩm trở lại khi đã rã đông', 44000, N'img/product/vitchatsan.jpeg', 1)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (19, N'Mướp Đắng VietGAP', N'Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 22000, N'img/product/muopdang.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (20, N'Sấu Bào Vỏ', N'Sử dụng khi còn tươi
Tủ đông
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 10000, N'img/product/saubaovo.png', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (21, N'Hành Tây VietGAP', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 16000, N'img/product/hanhtay.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (22, N'Nấm Kim Châm Hữu Cơ', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 17000, N'img/product/namkimcham.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (23, N'Rau Muống Lá VietGAP', N'Sử dụng khi còn tươi
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 14000, N'img/product/raumuong.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (24, N'Củ Cải Trắng', N'Sử dụng khi còn tươi
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 8000, N'img/product/cucaitrang.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (25, N'Rau Dền VietGAP', N'Sử dụng khi còn tươi
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 13000, N'img/product/rauden.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (26, N'Ớt Chuông Đỏ', N'Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 20000, N'img/product/otchuongdo.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (27, N'Bắp Cải VietGAP', N'Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 24000, N'img/product/bapcai.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (28, N'Mồng Tơi VietGAP', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 14000, N'img/product/mongtoi.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (29, N'Mướp Xanh VietGAP', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 20000, N'img/product/muopxanh.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (30, N'Dưa Chuột VietGAP', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 18000, N'img/product/duachuot.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (31, N'Cà Rốt VietGAP', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 18000, N'img/product/carot.png', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (32, N'Cà Chua VietGAP', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 20000, N'img/product/cachua.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (33, N'Hành Lá VietGAP', N'Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 8000, N'img/product/hanhla.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (34, N'Đậu Đũa VietGAP', N'Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 10000, N'img/product/daudua.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (35, N'Bí Xanh', N'Sử dụng khi còn tươi
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 10000, N'img/product/bixanh.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (36, N'Ngô Ngọt', N'Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 15000, N'img/product/ngongot.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (37, N'Gừng Củ', N'Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 16000, N'img/product/gung.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (38, N'Giá Đỗ', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 10000, N'img/product/giado.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (39, N'Măng Nứa Tươi', N'Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 8000, N'img/product/mangnuatuoi.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (40, N'Nghệ Củ', N'Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 10000, N'img/product/nghecu.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (41, N'Sườn Xào Chua Ngọt', N'Bước 1:
Rửa sạch các nguyên liệu đã sơ chế, để ráo nước.
Sườn non chần sơ trong nước sôi 3 phút, rửa sạch, để ráo.
Bước 2:
Đặt chảo lên bếp làm nóng. Chiên sườn ngập dầu 3 - 4 phút cho vàng đều với lửa vừa. Vớt sườn ra, thấm bớt dầu.
Bước 3:
Bật bếp lên cho 2 muỗng canh dầu ăn vào chảo, đợi dầu nóng, cho hành tím băm vào phi thơm.
Cho 100ml nước lọc, cho từ từ gói gia vị hoàn chỉnh xào chua ngọt vào đảo đều.
Cho sườn vào xào đều 5 phút. Nêm nếm cho vừa ăn rồi tắt bếp.
Bước 4:
Thái hành lá nhỏ và rắc lên sườn. Bày món ra dĩa và thưởng thức.', 52000, N'img/product/suonxaochuangot.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (42, N'Canh Chua Cá Quả', N'Bước 1
Rửa sạch cá quả đã sơ chế, để ráo nước. Rửa sạch nguyên liệu nấu canh, để ráo nước. Cà chua cắt múi cau. Dọc mùng tước vỏ, cắt miếng vừa ăn, bóp muối. Sau đó chần sơ dọc mùng qua với nước sôi, vắt sạch để dọc mùng không bị ngứa và mặn. Mùi tàu, rau ngổ cắt nhỏ.
Bước 2
Cho 1 muỗng canh dầu ăn vào nồi, đợi dầu nóng cho hành tím băm, đầu hành băm vào phi thơm, rồi rót 750ml nước lọc vào nồi, thả cá vào nấu khoảng 10 phút cho chín, rồi nhẹ nhàng vớt ra. Thả dứa vào nấu 2 phút, sau đó thêm tiếp cà chua.
Bước 3
Khi nước sôi lăn tăn, cho từ từ gói gia vị khô và nêm thêm nước mắm, nêm nếm cho vừa ăn. Thả cá đã chín vào cùng giá đỗ, dọc mùng nấu thêm 1 - 2 phút cho canh sôi bùng. Rắc mùi tàu, rau ngổ lên mặt rồi tắt bếp.
* Bí quyết: Thêm nước mắm làm dậy mùi thơm và canh thêm đậm đà
Bước 4
Cho canh ra tô, rắc thêm tỏi phi để tăng thêm hương vị.', 72000, N'img/product/canhchuacaqua.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (43, N'Sườn Non Heo Kho Trứng Cút', N'Bước 1:
Rửa sạch các nguyên liệu đã sơ chế, để ráo nước. Hành lá cắt nhỏ. Luộc trứng cút chín rồi bóc vỏ để riêng. Ướp sườn với gói gia vị hoàn chỉnh kho Việt trong 15 phút.
Bước 2:
Đặt nồi lên bếp, cho 2 muỗng canh dầu ăn vào nồi, đợi dầu nóng, phi thơm hành tím băm, tỏi băm. Sau đó, cho hỗn hợp sườn ướp vào xào cho thịt săn lại.
Bước 3:
Tiếp đến, rót 100 ml nước lọc, nước dừa và trứng cút vào nấu khoảng 15 - 20 phút đến khi nước có độ sệt. Thêm hành lá vào nồi, nêm nếm cho vừa ăn rồi tắt bếp.
Bước 4:
Bày món ăn ra dĩa, rắc tiêu xay lên mặt, trang trí tùy thích và thưởng thức. Ngon hơn khi ăn nóng cùng cơm trắng.
Ghi chú:
- Gói gia vị nên đổ từ từ (không đổ hết) để nêm nếm cho vừa ăn.
- Có thể thay đổi định lượng nước và gia vị để phù hợp với khẩu phần và khẩu vị.', 64000, N'img/product/suonnonheokho.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (44, N'Ba Chỉ Heo Rang Cháy Cạnh', N'Bước 1:
Rửa sạch các nguyên liệu đã qua sơ chế để ráo nước. Hành lá cắt nhỏ.
Bước 2:
Đặt chảo lên bếp cho 1 muỗng canh dầu ăn vào chảo đợi dầu ăn nóng cho thịt ba rọi vào rang trên lửa lớn cho thịt vàng cháy cạnh.
Bước 3:
Tiếp đến cho gói sốt gia vị vào đảo lên cho gia vị thấm đều vào thịt, nấu trên lửa nhỏ trong 5 phút. Nêm lại cho vừa ăn rồi tắt bếp.
Bước 4:
Bày món ăn ra đĩa, hành lá, ớt chỉ thiên cắt nhỏ cùng một ít tiêu xay cho lên mặt. Ngon khi thưởng thức nóng cùng cơm trắng.', 52000, N'img/product/bachiheorang.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (45, N'Canh Giò Heo Hầm Củ Sen', N'Bước 1:
Sơ chế, rửa sạch nguyên vật liệu, để ráo nước hoàn toàn, tiến hành cắt thái. Hành lá, mùi ta cắt nhỏ, củ sen cắt miếng vừa ăn, giò heo rã đông ở nhiệt độ mát, sau đó rửa sạch.
* Bí quyết làm nước canh trong: Luộc giò heo qua nước sôi khoảng 5 phút, sau đó vớt ra rửa sạch.
Bước 2:
Đặt nồi lên bếp cho 2 muỗng canh dầu ăn vào đợi dầu nóng rồi cho giò heo vào xào 2 phút cho săn lại. Sau đó cho khoảng 750ml nước lọc vào nấu sôi rồi hạ lửa nhỏ nấu trong 15 phút. Thường xuyên vớt bọt để nước canh được trong.
Bước 3:
Tiếp đến cho củ sen, táo đỏ, kỷ tử vào nồi nấu thêm 15 phút. Cho từ từ gói gia vị hoàn chỉnh vào khuấy đều, nêm nếm lại cho vừa ăn. Cho hành lá, mùi ta lên mặt rồi tắt bếp.
* Gói gia vị nên đổ từ từ (không đổ hết) để nêm nếm cho vừa ăn.
* Bí quyết: Thêm nước mắm làm dậy mùi thơm và canh thêm đậm đà.
Bước 4:
Bày món ăn ra tô và thưởng thức. Món canh ngon hơn khi ăn nóng cùng cơm trắng, có thể chấm kèm với nước mắm ớt để tăng vị đậm đà.', 52000, N'img/product/gioheohamcusen.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (46, N'Sườn Cốt Lết Heo Rim Nước Dừa', N'Bước 1:
Sơ chế, rửa sạch nguyên vật liệu, để ráo nước hoàn toàn, tiến hành cắt thái. Hành lá cắt nhỏ, hành tím, tỏi băm nhuyễn (1/2 để ướp và 1/2 để phi thơm), ớt cắt lát xéo, cốt lết heo rã đông ở nhiệt độ mát, sau đó rửa sạch, ướp với 1/2 hành tím, tỏi băm và gói sốt kho trong 15 phút.
Bước 2:
Đặt nồi lên bếp, mở lửa lớn cho 2 muỗng canh dầu ăn, đợi dầu nóng cho 1/2 hành tím, tỏi đã băm nhuyễn vào phi thơm, sau đó cho thịt đã ướp vào xào cho thịt săn lại
Bước 3:
Tiếp đến rót 100ml nước lọc và toàn bộ nước dừa vào đun sôi, sau đó điều chỉnh về lửa nhỏ rim thịt khoảng 20 phút để nước rút đến vị vừa ăn và thấm đều vào thịt thì cho hành lá và ớt vào rồi tắt bếp
Bước 4:
Bày món ăn ra đĩa và thưởng thức. Ngon hơn khi ăn nóng cùng với cơm trắng.', 62000, N'img/product/heorimnuocdua.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (47, N'Đùi Gà Hầm Thuốc Bắc Ngải Cứu', N'Bước 1 :
Gà rã đông, rửa sạch, chiên sơ hoặc nướng trong 5 phút ở nhiệt độ 200 độ C cho da gà căng và chắc. Gói thuốc bắc rửa sạch và ngâm nước 30 phút. Ngải cứu nhặt và rửa sạch. Gừng rửa sạch, thái lát.
Bước 2 :
Đặt nồi lên bếp, cho 700ml nước sôi và gói thuốc bắc, gừng thái lát vào nồi, ninh 5 phút. Sau đó, cho gà vào trong nồi ninh nhỏ lửa 30 phút.
Bước 3 :
Đổ gói sốt hầm và ngải cứu vào nồi, nêm nếm theo khẩu vị, tiếp tục ninh thêm 15 phút hoặc cho đến khi gà đạt độ mềm như ý muốn.
* Gói sốt nên đổ từ từ (không đổ hết) để nêm nếm cho vừa ăn.
* Bí quyết: Thêm rượu nếp cái hoặc rượu trắng để nước hầm thêm thơm.
Bước 4 :
Múc gà hầm ra bát to và thưởng thức. Ăn kèm với cơm nóng hoặc mì.', 60000, N'img/product/duigahamthuocbac.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (48, N'Đùi Gà Góc Tư Kho Trứng Cút', N'Bước 1:
Rửa sạch các nguyên liệu đã sơ chế, để ráo nước.
Hành lá cắt nhỏ. Luộc trứng cút chín, bóc vỏ để riêng.
Ướp gà với gói gia vị hoàn chỉnh kho tộ trong 10 phút.
Trong lúc chờ ướp thịt gà, chiên trứng cút trong chảo ngập dầu với lửa vừa đến khi da trứng cút vàng giòn.
Bước 2:
Đặt nồi lên bếp, cho 2 muỗng canh dầu ăn vào nồi, băm nhuyễn hành tím, tỏi, đợi dầu nóng cho vào phi thơm. Sau đó, cho hỗn hợp thịt ướp vào xào cho thịt săn lại.
Bước 3:
Tiếp đến, rót 200 ml nước lọc và trứng cút vào nấu khoảng 15 - 20 phút để nước có độ sệt.
Thêm hành lá vào nồi, nêm nếm cho vừa ăn rồi tắt bếp.
Bước 4:
Bày món ăn ra dĩa, rắc tiêu xay lên mặt và thưởng thức.
Ngon hơn khi ăn nóng cùng cơm trắng.
Ghi chú:
- Gói gia vị nên đổ từ từ (không đổ hết) để nêm nếm cho vừa ăn.
- Có thể thay đổi định lượng nước và gia vị để phù hợp với khẩu phần và khẩu vị.', 50000, N'img/product/duigakhotrungcut.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (49, N'Cá Nục Kho Cà', N'Bước 1:
Cá nục rửa sạch, để ráo, cà chua rửa sạch, cắt múi cau. Cho gói gia vị vào ướp cá trong 10 phút.
Bước 2:
Cho 2 muỗng canh dầu ăn vào chảo làm nóng. Chiên cá mỗi mặt 2 phút cho cá vàng đều phần da. Sau đó gắp ra, thấm ráo dầu.
Bước 3:
Băm nhuyễn hành tím. Trong chảo vừa chiên cá, cho hành tím băm vào phi thơm. Cho cà chua vào đảo đều 2 - 3 phút. Thêm 1 chén nước lọc vào, nấu lửa vừa cho sôi nhẹ. Cho cá đã chiên và gói gia vị sốt vào, nấu lửa vừa khoảng 8 - 10 phút đến khi nước sệt lại, nếm nếm lại cho vừa ăn và tắt bếp.
Bước 4:
Cho cá ra dĩa, rắc hành lá cắt nhuyễn. Ngon hơn khi dùng với cơm nóng.', 39000, N'img/product/canuckhoca.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (50, N'Lẩu Thái Hải Sản', N'Bước 1:
Rửa sạch lại các nguyên liệu đã sơ chế. Thịt bò để rã đông. Các loại rau lẩu rửa sạch, để ráo nước. Cà chua cắt múi cau, dứa thái miếng vừa. Riềng thái sợi nhuyễn, hành tím và sả cây đâp dập nhẹ. Lá chanh bóp nhẹ cho thơm.
Bước 2:
Cho 2 muỗng canh dầu ăn vào nồi, chỉnh lửa vừa, cho hành tây, cà chua, dứa, riềng, sả, ớt vào xào thơm khoảng 1 phút. Thêm 1.5 Lít nước lọc và gói sốt lẩu vào, cho thêm lá chanh vào cho dậy mùi thơm, đun 7-8 phút cho sôi. Nêm nếm lại cho vừa ăn.
* Bí quyết: Ngon hơn khi cho thêm nước cốt dừa.
Bước 3:
Bày món ăn ra nồi lẩu, khi ăn đun sôi lẩu, nhúng nhân lẩu, rau, nấm vào và thưởng thức. Ăn kèm với bún hoặc mì. Chấm kèm với nước mắm ớt hoặc gia vị chanh ớt để tăng hương vị của món ăn.', 249000, N'img/product/lauthaihaisan.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (51, N'Lẩu Gà Ta Nấm', N'Bước 1:
Rửa sạch các nguyên liệu đã sơ chế để ráo nước.
Hành tây cắt múi cau, hành lá cắt khúc phần đầu hành băm nhỏ.
Bước 2:
Bật bếp lên cho 2 thìa canh dầu ăn vào nồi đợi dầu nóng cho dầu hành băm vào phi thơm sau đó cho gà vào xào săn lại. Rót 1.5 lít nước vào nồi đun sôi lên.
Bước 3:
Nấu gà khoảng 10-15 phút, sau đó cho từ từ nước cốt lẩu vào đảo đều, nêm nếm lại cho vừa ăn rồi cho hành lá, hành tây, mỗi loại nấm 1 ít.
Bước 4:
Bày món ăn ra nồi lẩu, khi ăn đun sôi lẩu, nhúng nhân lẩu, rau, nấm vào và thưởng thức. Ăn kèm với bún hoặc mì. Chấm kèm với nước mắm ớt hoặc gia vị chanh ớt để tăng hương vị của món ăn.

Ghi chú:
- Gói gia vị nên đổ từ từ (không đổ hết) để nêm nếm cho vừa ăn.
- Có thể thay đổi định lượng nước và gia vị để phù hợp với khẩu phần và khẩu vị.', 196000, N'img/product/laugatanam.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (52, N'Lẩu Ếch Chua Cay', N'Bước 1:
Rửa sạch lại các nguyên liệu đã sơ chế. Ếch để rã đông, chặt miếng vừa ăn. Các loại rau lẩu rửa sạch, để ráo nước. Cà chua cắt múi cau, dứa thái miếng vừa. Hành tím và sả cây đâp dập nhẹ.
Bước 2:
Cho 2 muỗng canh dầu ăn vào nồi, chỉnh lửa vừa, phi thơm hành tím. Cho ếch vào xào khoảng 2-3 phút. Cho tiếp cà chua, dứa, măng, sả, ớt vào xào thơm cùng ếch thêm khoảng 1 phút, sau đó bày ếch và măng ra đĩa. Thêm 1.5 lít nước lọc và gói sốt lẩu vào nồi, cho thêm rau ngổ, mùi tàu vào cho dậy mùi thơm, đun 7-8 phút cho sôi. Nêm nếm lại cho vừa ăn.
Bước 3:
Bày món ăn ra nồi lẩu, khi ăn đun sôi lẩu, nhúng ếch, rau, nấm vào và thưởng thức. Ăn kèm với bún hoặc mì. Chấm kèm với nước mắm ớt hoặc gia vị chanh ớt để tăng hương vị của món ăn.', 199000, N'img/product/lauechchuacay.png', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (53, N'Măng Trúc Xào Bò Chay', N'Bước 1:
Măng trúc rửa sạch, thái cọng hoặc thái vát theo nhu cầu, chần nước sôi trong 2 phút. Hành lá, mùi tàu rửa sạch, cắt khúc nhỏ. Hành tím băm nhuyễn.
Bước 2:
Bật bếp lên cho 2 muỗng canh dầu ăn vào chảo đợi dầu nóng, cho hành tím băm vào phi thơm. Sau đó, cho măng trúc, hành lá, mùi tàu và thêm từ từ gói gia vị hoàn chỉnh món xào chay vào xào khoảng 1 phút trên lửa vừa, nêm nếm lại cho vừa ăn rồi tắt bếp.
Bước 3
Bày món ăn ra dĩa, rắc tiêu xay lên mặt và thưởng thức. Ngon hơn khi ăn nóng cùng cơm trắng.

Ghi chú: - Gói gia vị nên đổ từ từ (không đổ hết) để nêm nếm cho vừa ăn. - Có thể thay đổi định lượng nước và gia vị để phù hợp với khẩu phần và khẩu vị', 50000, N'img/product/mangtrucxaobo.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (54, N'Đậu Cove Xào Tỏi Chay', N'Bước 1:
Rửa sạch các nguyên liệu đã sơ chế để ráo nước. Tỏi tép đập dập.
Bước 2:
Bật bếp lên cho 2 thìa canh dầu ăn vào chảo đợi dầu nóng cho tỏi băm, tỏi tép vào phi thơm. Sau đó cho đậu cove, thêm từ từ gói gia vị khô, nước mắm vào xào khoảng 5 phút trên lửa vừa, nêm nếm lại cho vừa ăn rồi tắt bếp.
Bước 3:
Bày món ăn ra đĩa rắc tỏi phi lên mặt, trang trí tùy thích và thưởng thức. Ngon hơn khi ăn nóng cùng cơm trắng, chấm kèm với nước tương ớt.', 17000, N'img/product/daucovexaotoi.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (55, N'Nấm Đùi Gà Kho Tiêu Chay', N'Bước 1 :
Rửa sạch nấm đùi gà, để ráo nước, cắt miếng vừa ăn.
Bước 2 :
Bật bếp lên cho 3 thìa canh dầu ăn vào nồi đợi dầu nóng cho nấm vào xào trong 5 phút trên lửa vừa.
Bước 3 :
Tiếp đến cho gói gia vị sốt vào đảo đều trong 3 phút. Sau đó cho 50ml nước lọc vào nồi kho thêm 5 đến 7 phút cho cạn nước nêm nếm lại cho vừa ăn rồi tắt bếp.', 32000, N'img/product/namduigakhotieu.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (56, N'Canh Ngũ Sắc Chay', N'Bước 1:
Rửa sạch lại các nguyên liệu đã sơ chế, để ráo nước. Gừng tươi thái sợi nhuyễn.
Bước 2:
Cho 750ml nước lọc vào nồi, bật lửa vừa. Cho cà rốt, ngô ngọt, củ sen và nấm đông cô tươi vào nấu khoảng 15 phút. Nêm gói gia vị, khuấy đều cho tan.
Bước 3:
Thêm đậu cove vào nấu 1 phút cho sôi bùng lên. Nêm nếm lại cho vừa miệng rồi tắt bếp.
* Bí quyết: Thêm nước mắm làm dậy mùi thơm
Bước 4:
Cho canh ra tô, cho gừng tươi thái sợi nhuyễn lên mặt. Ăn ngon khi còn nóng cùng cơm trắng.', 32000, N'img/product/canhngusac.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (57, N'Viên Mọc Chay', N'Dùng ngay khi nhận hàng
Tủ đông <30 ngày
Lưu ý:- Không cấp đông thực phẩm trở lại khi đã rã đông
- Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 8000, N'img/product/viemmocchay.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (58, N'Cà Tím Áp Chảo Xốt Cay Chay', N'Bước 1:
Rửa sạch các nguyên liệu: nấm hương khô, nấm đùi gà, cà tím, gừng, mùi tàu rồi để ráo nước. Ngâm sườn non chay, nấm hương khô 10 phút cho mềm rới vắt ráo nước. Sườn non chay thái hạt lựu. Nấm đùi gà, nấm hương băm nhuyễn. Gừng tươi, mùi tàu thái sợi nhuyễn.
Bước 2:
Cho 3 muỗng canh dầu ăn vào chảo, chỉnh lửa vừa, làm nóng dầu ăn. Cho cà tím vào áp chảo 2-3 phút mỗi mặt, vớt ra thấm ráo dầu. Tiếp tục cho gừng sợi và 1/2 gói ớt băm vào chảo, đảo đếu cho thơm. Cho nấm băm nhuyễn và sườn non hạt lựu vào xào trên lửa vừa trong 3 phút cho chín mềm. Cho gói sốt gia vị và mùi tàu thái sợi nhuyễn vào đảo nhẹ thêm 1 phút. Nêm nếm lại cho vừa ăn rồi tắt bếp.
Bước 3:
Xếp cà tím vào đĩa sao cho đẹp mắt. Rưới phần sốt cay lên mặt. Món cà tím áp chảo sốt cay với vị mặn ngọt, chua cay hòa quyện rất bắt vị, dùng ngon khi còn nóng cùng cơm trắng.', 34000, N'img/product/catimapchao.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (59, N'Đậu Phụ Chiên Sả Ớt Chay', N'Bước 1
Rửa sạch các nguyên liệu đã sơ chế, để ráo nước. Ớt chỉ thiên cắt lát, dùng dao khía nhẹ trên miếng đậu phụ.
Bước 2
Đổ gói gia vị khô, gói sả ớt băm vào tô trộn đều lên, tiếp đến cho đậu phụ vào dùng tay xoa đều cho sả và gia vị bám đều vào miếng đậu phụ.
Bước 3
Bật bếp lên cho khoảng 200 ml dầu ăn vào chảo đợi dầu nóng cho đậu phụ vào chiên trên lửa nhỏ cho vàng các mặt, rồi vớt ra để ráo dầu.
Bước 4
Bày món ăn ra đĩa cùng phần rau ăn kèm, trang trí tuỳ thích và thưởng thức. Ngon hơn khi ăn nóng cùng cơm trắng, chấm kém cùng tương ớt.', 27000, N'img/product/dauphuchiensaot.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (60, N'Canh Rong Biển Nấu Nấm Chay', N'Bước 1 :
Sơ chế, rửa sạch nguyên vật liệu, để ráo nước hoàn toàn, tiến hành cắt thái
- Gừng cắt sợi nhuyễn
- Rong biển khô cắt vụn nhỏ
- Nấm đông cô cắt mỏng vừa ăn
- Nấm bào ngư để nguyên tai nấm

Bước 2 :
Đặt nồi lên bếp cho 750ml nước lọc vào nấu sôi, sau đó cho nấm bào ngư, nấm đông cô và gói gia vị vào nấu khoảng 5 phút. Tiếp đến cho rong biển vào, thêm gừng cắt sợi làm dậy mùi thơm. Nêm nếm lại cho vừa ăn rồi tắt bếp.
Bước 3 :
Bày món ăn ra tô và thưởng thức. Món canh ngon hơn khi ăn nóng cùng cơm trắng.', 46000, N'img/product/canhrongbien.jpeg', 3)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (61, N'Burger Gà Classic', N'Burger gà tươi ngon với sốt mayonnaise và rau sống.', 35000, N'img/product/burgergaclassic.jfif', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (62, N'Bánh Mì Phô Mai BBQ', N'Bánh mì mềm xốp, nhân phô mai và thịt BBQ nướng chín.', 25000, N'img/product/banhmifomai.jfif', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (63, N'Pizza Pepperoni', N'Pizza thơm ngon với phô mai, xốt cà chua và lớp pepperoni.', 80000, N'img/product/pizzapep.jfif', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (64, N'Bánh Mì Bơ Ớt', N'Bánh mì giòn tan, phết bơ và ớt, hấp dẫn từng miếng.', 20000, N'img/product/banhmiboot.jfif', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (65, N'Hotdog Chảo', N'Hotdog nóng hổi với xốt ớt, hành tây và bơ.', 30000, N'img/product/hotdogchao.jfif', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (66, N'Gỏi Cuốn Tôm', N'Gỏi cuốn tươi mát, nhân tôm, rau sống và bún.', 50000, N'img/product/goicuontom.jpg', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (67, N'Sushi Cuộn Phô Mai', N'Sushi cuộn với lớp phô mai béo ngậy và tôm.', 60000, N'img/product/sushicuon.png', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (68, N'Salad Gà Cesar', N'Salad rau sống, gà nướng và sốt Cesar thơm ngon.', 45000, N'img/product/saladga.jfif', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (69, N'Bánh Pizza Que', N'Pizza nhỏ xinh, ăn vặt với que tiện lợi.', 35000, N'img/product/pizzaque.jfif', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (70, N'Bánh bao nhân thịt', N'Có rất nhiều cách làm bánh bao ngon, đặc biệt là ở phần nhân bên trong: bánh bao xíu mại, bánh bao nhân đậu xanh, bánh bao nhân gà nấm,… Trong đó, bánh bao nhân thịt được nhiều người yêu thích nhất, lớp vỏ bánh bao mềm mịn, thơm thơm, kết hợp với nhân thịt bùi bùi rất hấp dẫn. Cùng Nấu ăn không khó vào bếp trổ tài thực hiện cách làm bánh bao nhân thịt miến tại nhà thơm ngon này để ăn sáng.', 20000, N'img/product/banhbaonhanthit.jpg', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (71, N'Mì Xào Hải Sản', N'Mì xào hải sản tươi ngon với nước sốt đậm đà.', 55000, N'img/product/mixaohaisan.jfif', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (72, N'Bánh Hotteok Hàn Quốc', N'Bánh ngọt Hàn Quốc, giòn thơm với nhân đậu và đường.', 25000, N'img/product/banhhanquoc.jfif', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (73, N'Khoai Tây Chiên Cay', N'Khoai tây chiên giòn, ướp cay nồng.', 18000, N'img/product/khoaitaychiencay.jfif', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (74, N'Cơm Bò Lúc Lắc', N'Cơm trắng kèm bò lúc lắc thơm ngon và sốt tiêu đen.', 50000, N'img/product/comboluclac.jfif', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (75, N'Tacos Gà Mexicano', N'Tacos với nhân gà, sốt salsa và rau sống.', 38000, N'img/product/tacogamexico.jfif', 4)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (76, N'Cà Phê Sữa Đá', N'Cà phê đậm đà, ngon miệng, pha cùng sữa đặc có đá.', 20000, N'img/product/cafesuada.jfif', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (77, N'Trà Sữa Thái Xanh', N'Trà xanh thơm ngon, pha chế kèm sữa tươi và bọt.', 25000, N'img/product/trasuathaixanh.jfif', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (78, N'Nước Mía Lá Dứa', N'Nước mía tươi ngon, thêm lá dứa cho hương vị đặc biệt.', 20000, N'img/product/nuocmialadua.jpeg', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (79, N'Sinh Tố Dừa', N'Sự kết hợp hoàn hảo giữa dừa tươi và sữa tươi.', 30000, N'img/product/sinhtodua.jpg', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (80, N'Bia Hơi', N'Bia tươi ngon, rất phổ biến trong các quán ăn và quán nhậu.', 20000, N'img/product/biahoihanoi.jfif', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (81, N'Cốt Dừa', N'Đồ uống lạ miệng, với cốt dừa, đá và sữa đặc.', 18000, N'img/product/nuoccotdua.jfif', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (82, N'Sinh Tố Chanh Xanh', N'Sinh tố chua ngọt, bổ dưỡng từ chanh xanh và đường.', 25000, N'img/product/sinhtotranh.jfif', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (83, N'Nước Ép Cà Rốt', N'Nước ép cà rốt tươi ngon, giàu vitamin A.', 20000, N'img/product/nuocepcarot.jfif', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (84, N'Sữa Chua Nếp Cẩm', N'Sữa chua truyền thống kết hợp với nếp cẩm thơm ngon.', 35000, N'img/product/suachuanepcam.jfif', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (85, N'Trà đào cam sả', N'Trà thơm ngon pha chế từ lá đào và đường phèn.', 28000, N'img/product/tradaocamxa.jfif', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (86, N'Chanh Muối', N'Chanh muối giải khát, chua chua mặn mặn, thích hợp trong ngày nắng.', 18000, N'img/product/chanhmuoi.jfif', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (87, N'Cà Phê Trứng', N'Cà phê sữa đặc phủ lớp trứng gà, hương vị độc đáo.', 30000, N'img/product/cafetrung.jfif', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (88, N'Chè Thái', N'Chè truyền thống với nhiều loại đậu, thạch, và đường phèn.', 30000, N'img/product/chethai.jfif', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (89, N'Trà Lài Bưởi', N'Trà lái hòa quyện với hương bưởi tươi ngon.', 20000, N'img/product/tralaibuoi.jfif', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (90, N'Sinh Tố Bơ', N'Sinh tố bơ mềm mịn, thơm ngon và bổ dưỡng.', 35000, N'img/product/sinhtobo.jfif', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (91, N'Nước Ép Mận', N'Nước mận ngâm thơm ngon kết hợp với nước dừa.', 18000, N'img/product/nuocman.jfif', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (92, N'Mùi Ta VietGAP', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 7000, N'img/product/muita.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (93, N'Ngải Cứu', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 15000, N'img/product/ngaicuu.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (94, N'Ớt Chỉ Thiên Đỏ (Ớt Hiểm Đỏ) VietGAP', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 5000, N'img/product/otchithien.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (95, N'Hành Tím', N'
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 12000, N'img/product/hanhtim.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (96, N'Tỏi', N'
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 15000, N'img/product/toi.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (97, N'Nấm Sò (Bào Ngư) Nâu', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 23000, N'img/product/namso.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (98, N'Lá Lốt VietGAP', N'
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 5000, N'img/product/lalot.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (99, N'Đậu Bắp', N'
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 11000, N'img/product/daubap.jpeg', 2)
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (100, N'Xà Lách Lolo Xanh VietGAP', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 20000, N'img/product/xalach.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (101, N'Dọc Mùng', N'
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 16000, N'img/product/docmung.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (102, N'Quất Tươi', N'
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 10000, N'img/product/quattuoi.png', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (103, N'Su Su', N'
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 25000, N'img/product/suus.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (104, N'Hẹ Lá VietGAP', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 7000, N'img/product/hela.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (105, N'Khoai Sọ', N'Dùng ngay khi nhận hàng
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 20000, N'img/product/khoaiso.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (106, N'Củ Sen Tươi Cắt Lát', N'Sử dụng khi còn tươi
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 14000, N'img/product/cusentuoi.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (107, N'Rau Răm', N'
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 7000, N'img/product/rauram.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (108, N'Quýt Giống Thái', N'
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 39000, N'img/product/quytgionghtai.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (109, N'Dừa Xiêm Sọ Bến Tre', N'
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 25000, N'img/product/duaxiembentre.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (110, N'Củ Đậu', N'
Bảo quản nhiệt độ mát 5 - 10 độ
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 25000, N'img/product/cudau.jpeg', 2)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (111, N'Dứa (Nguyên Trái)', N'
Lưu ý:Không sử dụng khi sản phẩm có dấu hiệu hư hỏng', 22000, N'img/product/duanguyentrai.jpeg', 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [username], [Password], [role_id]) VALUES (1, N'admin', N'123', 1)
INSERT [dbo].[Users] ([ID], [username], [Password], [role_id]) VALUES (2, N'ronaldo', N'12345', 2)
INSERT [dbo].[Users] ([ID], [username], [Password], [role_id]) VALUES (3, N'neymar', N'12345', 2)
INSERT [dbo].[Users] ([ID], [username], [Password], [role_id]) VALUES (4, N'huy', N'123', 2)
INSERT [dbo].[Users] ([ID], [username], [Password], [role_id]) VALUES (5, N'Hoang', N'123', 2)
INSERT [dbo].[Users] ([ID], [username], [Password], [role_id]) VALUES (6, N'vantruong', N'123', 2)
INSERT [dbo].[Users] ([ID], [username], [Password], [role_id]) VALUES (7, N'trieuvan', N'123', 2)
INSERT [dbo].[Users] ([ID], [username], [Password], [role_id]) VALUES (8, N'nguyenhuy', N'123', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[OrderStatus] ([orderstatus_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
USE [master]
GO
ALTER DATABASE [fastfood] SET  READ_WRITE 
GO
