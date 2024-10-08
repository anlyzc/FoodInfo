USE [master]
GO
/****** Object:  Database [DbCoreFoodWebSite]    Script Date: 5.09.2024 17:13:21 ******/
CREATE DATABASE [DbCoreFoodWebSite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbCoreFoodWebSite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DbCoreFoodWebSite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbCoreFoodWebSite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DbCoreFoodWebSite_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DbCoreFoodWebSite] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbCoreFoodWebSite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbCoreFoodWebSite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET  MULTI_USER 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbCoreFoodWebSite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbCoreFoodWebSite] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DbCoreFoodWebSite] SET QUERY_STORE = OFF
GO
USE [DbCoreFoodWebSite]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5.09.2024 17:13:21 ******/
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
/****** Object:  Table [dbo].[Admins]    Script Date: 5.09.2024 17:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NULL,
	[Password] [nvarchar](20) NULL,
	[AdminRole] [nvarchar](1) NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5.09.2024 17:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](20) NOT NULL,
	[CategoryDescription] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 5.09.2024 17:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foods](
	[FoodID] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[Stock] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Foods] PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240904071816_test', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240904103841_CreateStatusColumnInCategoriesTable', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240905062833_mig1', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([AdminID], [Username], [Password], [AdminRole]) VALUES (1, N'admin1', N'1234', N'A')
INSERT [dbo].[Admins] ([AdminID], [Username], [Password], [AdminRole]) VALUES (2, N'admin2', N'1111', N'A')
INSERT [dbo].[Admins] ([AdminID], [Username], [Password], [AdminRole]) VALUES (3, N'admin3', N'abcde', N'B')
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (1, N'Fruit', N'test', 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (2, N'Vegatables', N'test2', 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (3, N'Legumes', N'ss', 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (4, N'Drinks', N'tes3', 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (5, N'Bakery products', N'test', 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (6, N'Fruit juices ', N'test', 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (7, N'Cereals', N'tet', 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (8, N'Spicies ', N'test', 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (9, N'Desserts', N'test', 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Foods] ON 

INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (1, N'Apple', N'test', 1, N'https://i.hizliresim.com/8to9nxk.jpg', 250, 1)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (2, N'Orange', N'p', 2, N'https://i.hizliresim.com/km2er04.jpg', 300, 1)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (3, N'Tomato', N'd', 1.25, N'https://i.hizliresim.com/ldygurg.jpg', 500, 2)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (4, N'Watermelon', N'k', 1.5, N'https://i.hizliresim.com/b92r1ha.jpg', 300, 1)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (5, N'Lentil', N'm', 3.5, N'https://i.hizliresim.com/pfr3w77.jpg', 400, 3)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (6, N'Rice', N'p', 2.5, N'https://i.hizliresim.com/14t0jqi.jpg', 270, 3)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (7, N'Meize', N'm', 3.2, N'https://i.hizliresim.com/8e90np4.jpg', 180, 3)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (8, N'Lemon', N'l', 1.3, N'https://i.hizliresim.com/g8964lf.jpg', 120, 2)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (9, N'Cucumber', N's', 1.1, N'https://i.hizliresim.com/k1u2d8x.jpg', 210, 2)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (10, N'Garlic', N'etest', 3.2, N'https://i.hizliresim.com/biy4nu4.jpg', 150, 2)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (12, N'Banana', N'test', 2.25, N'https://i.hizliresim.com/476efuc.jpg', 300, 1)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (13, N'Grape', N'test', 1, N'https://i.hizliresim.com/hyyap08.jpg', 400, 1)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (14, N'Potato', N'test', 1, N'https://i.hizliresim.com/hs07euu.jpg', 350, 2)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (15, N'Mandarin', N'test', 1.2, N'https://i.hizliresim.com/1zvef3h.jpg', 210, 1)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (16, N'Kiwi', N'test

', 3.5, N'https://i.hizliresim.com/8xiio4v.jpg', 120, 1)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (17, N'Lettuce', N'deneme', 1.2, N'https://i.hizliresim.com/habfuim.jpg', 250, 2)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (18, N'Parsley', N'deneme', 1.1, N'https://i.hizliresim.com/gby9e50.jpg', 200, 2)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (19, N'Arugula', N'test', 2.9, N'https://i.hizliresim.com/2o2ijbv.jpg', 300, 2)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (20, N'Carrot', N'test', 120, N'https://i.hizliresim.com/k6nblk1.jpg', 130, 2)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (21, N'Melon', N'test
', 15, N'https://i.hizliresim.com/cw9b1c9.jpg', 160, 1)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (22, N'Peach', N'test', 200, N'https://i.hizliresim.com/sfctjhl.jpg', 137, 1)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (23, N'Cherry', N'test', 230, N'https://i.hizliresim.com/cjzs58s.jpg', 328, 1)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (24, N'Strawberry', N'test
', 375, N'https://i.hizliresim.com/gf31150.jpg', 170, 1)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (25, N'Pineapple', N'test
', 320, N'https://i.hizliresim.com/n9sug7v.jpg', 140, 1)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (26, N'Avocado', N'test', 45, N'https://i.hizliresim.com/3remeg4.jpg', 110, 1)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (27, N'Bean', N'test', 75, N'https://i.hizliresim.com/46lg2dp.jpg', 300, 3)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (28, N'Chickpea', N'test', 85, N'https://i.hizliresim.com/o3b3xqq.jpg', 225, 3)
INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Price], [ImageURL], [Stock], [CategoryID]) VALUES (29, N'Wheat', N'test', 75, N'https://i.hizliresim.com/6t22etc.jpg', 140, 3)
SET IDENTITY_INSERT [dbo].[Foods] OFF
GO
/****** Object:  Index [IX_Foods_CategoryID]    Script Date: 5.09.2024 17:13:21 ******/
CREATE NONCLUSTERED INDEX [IX_Foods_CategoryID] ON [dbo].[Foods]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF__Categorie__Categ__47DBAE45]  DEFAULT (N'') FOR [CategoryName]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF__Categorie__Statu__48CFD27E]  DEFAULT (CONVERT([bit],(0))) FOR [Status]
GO
ALTER TABLE [dbo].[Foods]  WITH CHECK ADD  CONSTRAINT [FK_Foods_Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Foods] CHECK CONSTRAINT [FK_Foods_Categories_CategoryID]
GO
USE [master]
GO
ALTER DATABASE [DbCoreFoodWebSite] SET  READ_WRITE 
GO
