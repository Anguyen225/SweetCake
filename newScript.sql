
/****** Object:  Database [SWEETCAKE_4GUYS]    Script Date: 01/11/2021 00:07:28 ******/
CREATE DATABASE [SWEETCAKE_4GUYS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWEETCAKE_4GUYS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SWEETCAKE_4GUYS.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SWEETCAKE_4GUYS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SWEETCAKE_4GUYS_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWEETCAKE_4GUYS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET RECOVERY FULL 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET  MULTI_USER 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWEETCAKE_4GUYS', N'ON'
GO
USE [SWEETCAKE_4GUYS]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 01/11/2021 00:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [varchar](30) NOT NULL,
	[Password] [varchar](50) NULL,
	[Fullname] [nvarchar](80) NULL,
	[Gender] [bit] NULL,
	[Email] [varchar](50) NULL,
	[Phone] [char](10) NULL,
	[Dob] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 01/11/2021 00:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NULL,
	[Roleid] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 01/11/2021 00:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [varchar](4) NOT NULL,
	[Name] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 01/11/2021 00:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coupons](
	[Code] [varchar](20) NOT NULL,
	[Value] [int] NULL,
	[Quantity] [int] NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CouponUsed]    Script Date: 01/11/2021 00:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CouponUsed](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CouponCode] [varchar](20) NULL,
	[CustomerId] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 01/11/2021 00:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Districts](
	[Id] [int] NOT NULL,
	[Name] [varchar](30) NULL,
	[Shipfee] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 01/11/2021 00:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[Discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 01/11/2021 00:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [varchar](30) NULL,
	[Createdate] [date] NULL,
	[Phone] [char](10) NULL,
	[Address] [varchar](100) NULL,
	[District] [int] NULL,
	[Email] [varchar](50) NULL,
	[CouponCode] [varchar](20) NULL,
	[Price] [float] NULL,
	[Shipfee] [float] NULL,
	[PaymentMethod] [varchar](20) NULL,
	[PaymentStatus] [bit] NULL,
	[OrderStatus] [varchar](20) NULL,
	[StaffId] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 01/11/2021 00:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[Available] [bit] NULL,
	[Detail] [nvarchar](100) NULL,
	[Photo] [varchar](30) NULL,
	[Discount] [int] NULL,
	[Categoryid] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 01/11/2021 00:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [varchar](4) NOT NULL,
	[Name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Gender], [Email], [Phone], [Dob]) VALUES (N'user01', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Gender], [Email], [Phone], [Dob]) VALUES (N'user02', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Gender], [Email], [Phone], [Dob]) VALUES (N'user03', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Gender], [Email], [Phone], [Dob]) VALUES (N'user04', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Gender], [Email], [Phone], [Dob]) VALUES (N'user05', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Gender], [Email], [Phone], [Dob]) VALUES (N'user06', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Gender], [Email], [Phone], [Dob]) VALUES (N'user07', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Gender], [Email], [Phone], [Dob]) VALUES (N'user08', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'c01', N'Cupcake')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'c02', N'Chocolate')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'c03', N'Donut')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'c04', N'Birthday Cake')
INSERT [dbo].[Districts] ([Id], [Name], [Shipfee]) VALUES (1, N'1', 0)
INSERT [dbo].[Districts] ([Id], [Name], [Shipfee]) VALUES (2, N'2', 20000)
INSERT [dbo].[Districts] ([Id], [Name], [Shipfee]) VALUES (3, N'3', 0)
INSERT [dbo].[Districts] ([Id], [Name], [Shipfee]) VALUES (6, N'6', 20000)
INSERT [dbo].[Districts] ([Id], [Name], [Shipfee]) VALUES (10, N'10', 20000)
INSERT [dbo].[Districts] ([Id], [Name], [Shipfee]) VALUES (13, N'Tân Bình', 0)
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price], [Discount]) VALUES (1, 3, 1, 1, 18000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price], [Discount]) VALUES (2, 3, 2, 1, 35000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price], [Discount]) VALUES (3, 4, 4, 2, 29000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price], [Discount]) VALUES (4, 4, 5, 1, 120000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price], [Discount]) VALUES (10002, 10002, 3, 3, 38000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price], [Discount]) VALUES (10004, 10003, 1, 2, 18000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price], [Discount]) VALUES (10005, 10003, 3, 1, 38000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price], [Discount]) VALUES (10007, 10003, 5, 2, 120000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price], [Discount]) VALUES (10008, 10004, 4, 2, 290000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price], [Discount]) VALUES (10009, 10004, 1, 1, 180000, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerId], [Createdate], [Phone], [Address], [District], [Email], [CouponCode], [Price], [Shipfee], [PaymentMethod], [PaymentStatus], [OrderStatus], [StaffId]) VALUES (3, N'user01', CAST(N'2021-10-12' AS Date), N'0909080809', N'14 Cong Hoa', 3, NULL, NULL, 90000, 0, N'COD', NULL, N'completed', N'')
INSERT [dbo].[Orders] ([Id], [CustomerId], [Createdate], [Phone], [Address], [District], [Email], [CouponCode], [Price], [Shipfee], [PaymentMethod], [PaymentStatus], [OrderStatus], [StaffId]) VALUES (4, N'user02', CAST(N'2021-10-13' AS Date), N'0908070605', N'7 Ly Bah', 6, NULL, NULL, 120000, 20000, N'COD', NULL, N'delivery', NULL)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Createdate], [Phone], [Address], [District], [Email], [CouponCode], [Price], [Shipfee], [PaymentMethod], [PaymentStatus], [OrderStatus], [StaffId]) VALUES (10002, N'user03', CAST(N'2021-10-12' AS Date), N'0909090909', N'20 Ly Thuong Kiet', 13, NULL, NULL, 78000, 0, N'COD', NULL, N'completed', NULL)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Createdate], [Phone], [Address], [District], [Email], [CouponCode], [Price], [Shipfee], [PaymentMethod], [PaymentStatus], [OrderStatus], [StaffId]) VALUES (10003, N'user04', CAST(N'2021-10-13' AS Date), N'0808080708', N'10 Nguyen Hue', 1, NULL, NULL, 57000, 0, N'COD', NULL, N'completed', NULL)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Createdate], [Phone], [Address], [District], [Email], [CouponCode], [Price], [Shipfee], [PaymentMethod], [PaymentStatus], [OrderStatus], [StaffId]) VALUES (10004, N'user05', CAST(N'2021-10-13' AS Date), N'0907758475', N'35 Su Van Hanh', 10, NULL, NULL, 88000, 20000, N'COD', NULL, N'accepted', NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Available], [Detail], [Photo], [Discount], [Categoryid]) VALUES (1, N'Donut Yellow', 18000, 17, 1, N'Bánh Donut chiên vàng hấp dẫn', N'cake1.jpg', 0, N'c03')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Available], [Detail], [Photo], [Discount], [Categoryid]) VALUES (2, N'Chocolate Banana Cupcake', 35000, 10, 1, N'Bánh cupcake chuối nướng kem socola', N'cake2.jpg', 10, N'c01')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Available], [Detail], [Photo], [Discount], [Categoryid]) VALUES (3, N'Matcha Cupcake', 38000, 10, 1, N'Bánh cupcake Matcha Genmicha Nhật Bản', N'cake4.jpg', 0, N'c01')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Available], [Detail], [Photo], [Discount], [Categoryid]) VALUES (4, N'Brownie', 29000, 10, 1, N'Bánh Brownied socola', N'cake5.jpg', 0, N'c02')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [Available], [Detail], [Photo], [Discount], [Categoryid]) VALUES (5, N'Pinky Birthday Cake', 120000, 10, 1, N'Bánh sinh nhật hồng', N'cake6.jpg', 0, N'c04')
SET IDENTITY_INSERT [dbo].[Products] OFF
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD FOREIGN KEY([Roleid])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[CouponUsed]  WITH CHECK ADD FOREIGN KEY([CouponCode])
REFERENCES [dbo].[Coupons] ([Code])
GO
ALTER TABLE [dbo].[CouponUsed]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CouponCode])
REFERENCES [dbo].[Coupons] ([Code])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([District])
REFERENCES [dbo].[Districts] ([Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Categoryid])
REFERENCES [dbo].[Categories] ([Id])
GO
USE [master]
GO
ALTER DATABASE [SWEETCAKE_4GUYS] SET  READ_WRITE 
GO
