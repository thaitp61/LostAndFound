USE [master]
GO

DROP DATABASE [FPTU_Lost_and_Found]
/****** Object:  Database [FPTU_Lost_and_Found]    Script Date: 7/4/2022 5:49:23 PM ******/
CREATE DATABASE [FPTU_Lost_and_Found]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPTU_Lost_and_Found', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FPTU_Lost_and_Found.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FPTU_Lost_and_Found_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FPTU_Lost_and_Found_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPTU_Lost_and_Found].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET  MULTI_USER 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FPTU_Lost_and_Found]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 7/4/2022 5:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Article](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleContent] [nvarchar](max) NOT NULL,
	[ImgURL] [nvarchar](300) NULL,
	[PostTime] [datetime] NOT NULL CONSTRAINT [DF_Article_PostTime]  DEFAULT (getdate()),
	[ArticleStatus] [bit] NOT NULL,
	[LocationID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[ArticleTypeID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[TotalReport] [int] NULL,
	[TotalLike] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArticleType]    Script Date: 7/4/2022 5:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleType](
	[ArticleTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleTypeName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Blog]    Script Date: 7/4/2022 5:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Blog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[BlogImage] [nvarchar](100) NOT NULL,
	[BlogName] [nvarchar](100) NOT NULL,
	[BlogContent] [nvarchar](max) NULL,
	[MemberID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/4/2022 5:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[CommentContent] [nvarchar](max) NOT NULL,
	[CommentTime] [datetime] NOT NULL CONSTRAINT [DF_Comment_CommentTime]  DEFAULT (getdate()),
	[CommentStatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 7/4/2022 5:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemType](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Like]    Script Date: 7/4/2022 5:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[LikeID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[LikeStatus] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 7/4/2022 5:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Member]    Script Date: 7/4/2022 5:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Picture] [nvarchar](200) NULL,
	[Phone] [nvarchar](10) NULL,
	[ProfileInfo] [nvarchar](max) NULL,
	[RoleID] [int] NOT NULL,
	[MemberStatus] [bit] NOT NULL,
	[TotalReport] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 7/4/2022 5:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[ReportContent] [nvarchar](max) NOT NULL,
	[ReportTime] [datetime] NOT NULL CONSTRAINT [DF_Report_ReportTime]  DEFAULT (getdate()),
	[ReportStatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/4/2022 5:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Notification](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](50) NULL,
	[MemberID] [int] NOT NULL,
	[SensorID] [int] NOT NULL,
	[ArticleID] [int] NOT NULL,
	[NotificationStatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


SET IDENTITY_INSERT [dbo].[Article] ON 
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (1, N'Nhặt được CCCD tại phòng Seminar Giấy tờ mang tên TRẦN PHƯƠNG THÁI (2001, Hà Nội)', N'https://timdothatlac.s3.ap-southeast-1.amazonaws.com/images/articles/ebd6e077-6c4b-44e0-8539-81c3e3d2cf07.jpg', CAST(N'2022-06-23 15:57:22.457' AS DateTime), 1, 4, 2, 2, 3, 1, 1)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (2, N'Nhặt được ví tại Nhà xe Giấy tờ mang tên VÕ THỊ TƯỜNG DUY (2001, Bến Tre)', N'https://vn-test-11.slatic.net/p/e212a01b93e8ab0507471c4a7f511e65.jpg', CAST(N'2022-06-22 15:57:22.457' AS DateTime), 1, 2, 3, 2, 1, 0, 5)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (3, N'Nhặt được Giấy phép lái xe tại phòng 202 Tầng 2 Giấy tờ mang tên HOÀNG ĐÌNH THÁI (2001, Hồ Chí Minh)', N'https://accgroup.vn/wp-content/uploads/2021/09/lam-giay-to-xe-mat-bao-lau.jpg', CAST(N'2022-06-21 15:57:22.457' AS DateTime), 1, 1, 4, 2, 2, 3, 4)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (4, N'Nhặt được Giấy tờ tại phòng 403 Tầng 4 Giấy tờ bao gồm giấy tờ xe, các bằng lái xe, điều khiển xe mang biển số 59p1 52921 mang tên NGUYỄN QUỐC SỸ (2001, Vũng Tàu)', N'https://farm6.staticflickr.com/5740/23117735982_5307002fda_o.jpg', CAST(N'2022-06-20 15:57:22.457' AS DateTime), 1, 1, 5, 2, 3, 0, 1)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (5, N'Nhặt được ví tại Sân trường Giấy tờ mang tên NGÔ XUÂN THIỆP (2001, Đồng Nai)', N'https://static2.yan.vn/YanNews/2167221/201904/di-lam-dem-cac-ban-tre-nhat-duoc-vi-tien-100-trieu-dong-va-tra-lai-d172f9ee.jpg', CAST(N'2022-06-19 15:57:22.457' AS DateTime), 1, 6, 6, 2, 1, 2, 2)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (6, N'Nhặt được Giấy phép lái xe tại phòng 027 Tầng trệt Giấy tờ mang tên NGUYỄN HOÀNG TÂN (2001, Đồng Nai)', N'https://thongtingiaypheplaixe.com/wp-content/uploads/2019/11/IMAG0587-scaled.jpg', CAST(N'2022-06-18 15:57:22.457' AS DateTime), 1, 1, 2, 2, 2, 12, 3)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (7, N'Nhặt được CMND tại phòng 119 Tầng 1 Giấy tờ mang tên NGUYỄN THANH TÙNG (2001, Hồ Chí Minh)', N'https://static.cand.com.vn/Files/Image/huutoan/2021/01/30/thumb_660_0d00b6a2-18c5-49c3-ab1f-c755f118479d.jpg', CAST(N'2022-06-17 15:57:22.457' AS DateTime), 1, 1, 3, 2, 3, 10, 1)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (8, N'Nhặt được Giấy tờ tại Sân Vovinam Giấy tờ bao gồm giấy tờ xe, các bằng lái xe, điều khiển xe mang biển số 60AM 12345 mang tên ĐOÀN VŨ QUANG HUY (2001, Vũng Tàu)', N'https://danquangngai.com/upload/images/meocon_9/images/31472633_2016156075370888_55621084908617728_n(1).jpg', CAST(N'2022-06-16 15:57:22.457' AS DateTime), 1, 5, 4, 2, 3, 0, 2)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (9, N'Nhặt được ví tại Sảnh chính (Trống đồng) Giấy tờ mang tên NGUYỄN TRỌNG NGUYÊN VŨ (2001, Vũng Tàu)', N'https://danviet.mediacdn.vn/2021/3/2/15405869525382645198109597458397699628670351n-16146899120431885801469.jpg', CAST(N'2022-06-15 15:57:22.457' AS DateTime), 1, 3, 5, 2, 1, 0, 3)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (10, N'Nhặt được Giấy phép lái xe tại Hội trường C Giấy tờ mang tên ĐÀO ĐỨC THỊNH (2001, Đồng Nai)', N'https://0711.vn/storage/uploads/img2020061423120431596100.jpg', CAST(N'2022-06-14 15:57:22.457' AS DateTime), 1, 11, 6, 2, 2, 0, 1)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (11, N'Rơi ví tại Nhà xe Giấy tờ mang tên HOÀNG NHÃ THY (2001, Đồng Nai)', N'https://vn-test-11.slatic.net/p/e212a01b93e8ab0507471c4a7f511e65.jpg', CAST(N'2022-06-13 15:57:22.457' AS DateTime), 1, 2, 2, 1, 1, 0, 2)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (12, N'Rơi CCCD tại Công viên cây xanh Giấy tờ mang tên NGUYỄN TRẦN THIÊN ĐỨC (2001, Tiền Giang)', N'https://timdothatlac.s3.ap-southeast-1.amazonaws.com/images/articles/ebd6e077-6c4b-44e0-8539-81c3e3d2cf07.jpg', CAST(N'2022-06-12 15:57:22.457' AS DateTime), 1, 7, 3, 1, 3, 0, 3)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (13, N'Rơi Giấy phép lái xe tại Canteen Giấy tờ mang tên TRƯƠNG NGUYỄN ANH HUY (2001, Quảng Ngãi)', N'https://accgroup.vn/wp-content/uploads/2021/09/lam-giay-to-xe-mat-bao-lau.jpg', CAST(N'2022-06-11 15:57:22.457' AS DateTime), 1, 12, 4, 1, 2, 0, 1)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (14, N'Rơi Giấy tờ tại Ao sen Giấy tờ bao gồm giấy tờ xe, các bằng lái xe, điều khiển xe mang biển số 59p1 52921 mang tên NGUYỄN QUANG HÙNG (2001, Quảng Trị)', N'https://farm6.staticflickr.com/5740/23117735982_5307002fda_o.jpg', CAST(N'2022-06-10 15:57:22.457' AS DateTime), 1, 8, 5, 1, 3, 0, 2)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (15, N'Rơi ví tại Sân trường Giấy tờ mang tên NGÔ DUY BÌNH (2002, Tiền Giang)', N'https://static2.yan.vn/YanNews/2167221/201904/di-lam-dem-cac-ban-tre-nhat-duoc-vi-tien-100-trieu-dong-va-tra-lai-d172f9ee.jpg', CAST(N'2022-05-24 15:57:22.457' AS DateTime), 1, 6, 6, 1, 1, 0, 3)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (16, N'Rơi Giấy phép lái xe tại phòng 011 Tầng trệt Giấy tờ mang tên THÁI VĂN MẪN (2001, Đà Nẵng)', N'https://thongtingiaypheplaixe.com/wp-content/uploads/2019/11/IMAG0587-scaled.jpg', CAST(N'2022-04-24 15:57:22.457' AS DateTime), 1, 1, 2, 1, 2, 2, 1)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (17, N'Rơi CMND tại Hội trường A Giấy tờ mang tên PHẠM DUY TÙNG (2000, Bình Phước)', N'https://static.cand.com.vn/Files/Image/huutoan/2021/01/30/thumb_660_0d00b6a2-18c5-49c3-ab1f-c755f118479d.jpg', CAST(N'2022-03-24 15:57:22.457' AS DateTime), 1, 9, 3, 1, 3, 0, 2)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (18, N'Rơi Giấy tờ tại Sân Vovinam Giấy tờ bao gồm giấy tờ xe, các bằng lái xe, điều khiển xe mang biển số 60AM 12345 mang tên ĐẶNG XUÂN ĐẠT (2001, Vũng Tàu)', N'https://danquangngai.com/upload/images/meocon_9/images/31472633_2016156075370888_55621084908617728_n(1).jpg', CAST(N'2022-02-24 15:57:22.457' AS DateTime), 1, 5, 4, 1, 3, 0, 3)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (19, N'Rơi ví tại Sảnh chính (Trống đồng) Giấy tờ mang tên TRẦN QUỐC KHÁNH (2002, Đà Nẵng)', N'https://danviet.mediacdn.vn/2021/3/2/15405869525382645198109597458397699628670351n-16146899120431885801469.jpg', CAST(N'2022-06-23 15:57:22.457' AS DateTime), 1, 3, 5, 1, 1, 2, 1)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (20, N'Rơi Giấy phép lái xe tại Hội trường B Giấy tờ mang tên MAI XUÂN TÙNG (2003, Đà Nẵng)', N'https://0711.vn/storage/uploads/img2020061423120431596100.jpg', CAST(N'2022-06-24 15:57:22.457' AS DateTime), 1, 10, 6, 1, 2, 0, 2)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (26, N'<p>hack fb thầy ho&agrave;ng</p>', N'273446696_366979748282108_1704171107086216918_n.jpg', CAST(N'2022-06-24 16:11:59.023' AS DateTime), 1, 1, 5, 1, 1, 0, 3)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (27, N'<p>mất 100k&nbsp;</p>', N'276222298_1964818983700213_3759381641244114011_n.jpg', CAST(N'2022-06-24 16:32:14.580' AS DateTime), 1, 2, 4, 1, 3, 2, 3)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (28, N'<p>ok</p>', N'stormtrooper_sees_the_stars-wallpaper-1920x1080.jpg', CAST(N'2022-06-24 16:38:59.390' AS DateTime), 1, 3, 4, 1, 3, 3, 2)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (31, N'<p>test 1</p>', N'homer_simpson_donut-wallpaper-1920x1080.jpg', CAST(N'2022-06-24 16:58:11.047' AS DateTime), 1, 1, 2, 1, 1, 2, 1)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (32, N'<p>1</p>', N'Wallpaper.jpg', CAST(N'2022-06-24 17:00:29.820' AS DateTime), 1, 1, 2, 1, 1, 22, 1)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (33, N'<p>2</p>', N'playstation_5_controller_linkin_park_by_alighasaby-wallpaper-1920x1080.jpg', CAST(N'2022-06-24 17:02:47.250' AS DateTime), 1, 1, 2, 1, 1, 0, 2)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (34, N'<p>2</p><p><canvas id="netbeans_glasspane" :netbeans_generated="true" style="position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;" width="656" height="200"></canvas></p>', N'razer_snakes_slime_background-wallpaper-1920x1080.jpg', CAST(N'2022-06-24 17:05:23.320' AS DateTime), 1, 1, 2, 1, 1, 4, 3)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (35, N'<p>1</p>', N'bmw_vision_3d_max-wallpaper-1920x1080.jpg', CAST(N'2022-06-24 17:06:45.743' AS DateTime), 1, 1, 2, 1, 1, 2, 3)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (36, N'<p>1</p><p><canvas id="netbeans_glasspane" :netbeans_generated="true" style="position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;" width="656" height="200"></canvas></p>', N'stormtrooper_sees_the_stars-wallpaper-1920x1080.jpg', CAST(N'2022-06-24 17:09:36.280' AS DateTime), 1, 1, 2, 1, 1, 2, 2)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (37, N'<p>ngu</p>', N'Wallpaper.jpg', CAST(N'2022-06-24 17:12:02.843' AS DateTime), 1, 2, 2, 1, 1, 5, 4)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (38, N'<p>1</p><p><canvas id="netbeans_glasspane" :netbeans_generated="true" style="position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;" width="656" height="200"></canvas></p>', N'homer_simpson_donut-wallpaper-1920x1080.jpg', CAST(N'2022-06-24 17:14:54.137' AS DateTime), 1, 1, 2, 1, 1, 0, 1)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (39, N'<p>1</p>', N'Chroma-Lair_1920x1080.png', CAST(N'2022-06-24 17:17:26.153' AS DateTime), 1, 1, 2, 1, 1, 0, 1)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (40, N'<p>o</p>', N'276222298_1964818983700213_3759381641244114011_n.jpg', CAST(N'2022-06-24 19:07:14.540' AS DateTime), 1, 2, 2, 1, 2, 1, 3)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (41, N'<p>1</p><p><canvas id="netbeans_glasspane" :netbeans_generated="true" width="656" height="200" style="position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;"></canvas></p>', N'razer_snakes_background-wallpaper-1920x1080.jpg', CAST(N'2022-06-24 22:22:15.460' AS DateTime), 1, 1, 2, 1, 1, 0, 1)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (42, N'<p>1</p>', N'273446696_366979748282108_1704171107086216918_n.jpg', CAST(N'2022-06-24 23:03:14.180' AS DateTime), 1, 1, 2, 1, 1, 2, 2)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (43, N'<p>1</p>', N'IMG_7347.JPG', CAST(N'2022-06-24 23:16:58.940' AS DateTime), 1, 1, 2, 2, 1, 13, 1)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (44, N'<p>2</p>', N'macbook_pro_laptop_purple_light-wallpaper-1920x1080.jpg', CAST(N'2022-06-24 23:17:44.873' AS DateTime), 1, 2, 2, 2, 2, 0, 2)
INSERT [dbo].[Article] ([ArticleID], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [LocationID], [MemberID], [ArticleTypeID], [ItemID], [TotalReport], [TotalLike]) VALUES (45, N'<p>1</p>', N'273446696_366979748282108_1704171107086216918_n.jpg', CAST(N'2022-06-24 23:22:49.787' AS DateTime), 1, 1, 2, 1, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[ArticleType] ON 

INSERT [dbo].[ArticleType] ([ArticleTypeID], [ArticleTypeName]) VALUES (1, N'Đồ thất lạc')
INSERT [dbo].[ArticleType] ([ArticleTypeID], [ArticleTypeName]) VALUES (2, N'Đồ nhặt được')
SET IDENTITY_INSERT [dbo].[ArticleType] OFF
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogID], [BlogImage], [BlogName], [BlogContent], [MemberID]) VALUES (1, 'https://ketsattoancau.com/wp-content/uploads/2019/08/nhung-tinh-huong-kho-xu-trong-khach-san-1.jpg',  N'Mẹo hay cho những người chuyên để thất lạc đồ', N'Đựng tai nghe vào cái ví nhỏ, Biến bút thành những bông hoa, Cách giữ chỉ, len hiệu quả, Giá đựng các dây cáp', 1)
INSERT [dbo].[Blog] ([BlogID], [BlogImage], [BlogName], [BlogContent], [MemberID]) VALUES (2, 'https://ezcloud.vn/wp-content/uploads/2018/05/nintchdbpict000251581610-1-1.jpg', N'Cách để phòng tránh bị thất lạc đồ', N'Chú ý đến mỗi việc mình làm, Đặt đồ vật ở vị trí cố định', 1)
INSERT [dbo].[Blog] ([BlogID], [BlogImage], [BlogName], [BlogContent], [MemberID]) VALUES (3, 'https://tintuc.viettelstore.vn/wp-content/uploads/2020/02/cach-khoa-dien-thoai-tu-xa.jpg', N'Cách tìm kiếm điện thoại thất lạc nhanh nhất', N'Cách tốt nhất (và duy nhất) để lấy lại iPhone của bạn là thông qua tính năng gốc của Apple,  Find My iPhone.', 1)
INSERT [dbo].[Blog] ([BlogID], [BlogImage], [BlogName], [BlogContent], [MemberID]) VALUES (4, 'https://duhocnhatbanuytin.net/images/kinh-nghiem/roi-vi-o-nhat.jpg', N'Nếu tìm không thấy đồ thất lạc, cần làm gì?', N'Trước tiên, hãy thử quay lại nơi mà bạn vừa đi qua. Có thể là trong xe, nhà xe, nhà vệ sinh, cốp xe… 
	Ngoài ra, cũng cần lưu ý đến nhất túi quần hoặc túi áo mà bạn mặc gần nhất, hoặc trong túi xách, balo.', 1)
INSERT [dbo].[Blog] ([BlogID], [BlogImage], [BlogName], [BlogContent], [MemberID]) VALUES (5,'https://www.baodongthap.vn/resources/newsimg/90906.jpg', N'Ăn gì để khắc phục chứng hay quên?', N'Long nhãn – Cải thiện chứng hay quên hiệu quả, Nhân sâm – Thực phẩm cải thiện chứng hay quên, Đông trùng hạ thảo', 1)
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [ArticleID], [MemberID], [CommentContent], [CommentTime], [CommentStatus]) VALUES (11, 1, 2, N'Mong chủ nhân sớm tìm được lại CCCD', CAST(N'2022-06-18 12:01:01.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [MemberID], [CommentContent], [CommentTime], [CommentStatus]) VALUES (12, 2, 3, N'Mong chủ nhân sớm tìm được lại Ví', CAST(N'2022-06-21 13:01:01.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [MemberID], [CommentContent], [CommentTime], [CommentStatus]) VALUES (13, 3, 4, N'Mong chủ nhân sớm tìm được lại Giấy phép lái xe', CAST(N'2022-07-12 02:02:02.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [MemberID], [CommentContent], [CommentTime], [CommentStatus]) VALUES (14, 4, 5, N'Mong chủ nhân sớm tìm được lại Giấy tờ', CAST(N'2022-07-12 03:03:04.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [MemberID], [CommentContent], [CommentTime], [CommentStatus]) VALUES (15, 5, 6, N'Mong chủ nhân sớm tìm được lại Ví', CAST(N'2022-07-13 06:02:02.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [MemberID], [CommentContent], [CommentTime], [CommentStatus]) VALUES (16, 6, 2, N'Mong chủ nhân sớm tìm được lại Giấy phép lái xe', CAST(N'2022-07-14 02:22:22.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [MemberID], [CommentContent], [CommentTime], [CommentStatus]) VALUES (17, 7, 3, N'Mong chủ nhân sớm tìm được lại CMND', CAST(N'2022-07-15 22:22:22.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [MemberID], [CommentContent], [CommentTime], [CommentStatus]) VALUES (18, 8, 4, N'Mong chủ nhân sớm tìm được lại Giấy tờ', CAST(N'2022-07-16 22:22:22.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [MemberID], [CommentContent], [CommentTime], [CommentStatus]) VALUES (19, 9, 5, N'Mong chủ nhân sớm tìm được lại Ví', CAST(N'2022-07-17 22:22:22.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [MemberID], [CommentContent], [CommentTime], [CommentStatus]) VALUES (20, 10, 6, N'Mong chủ nhân sớm tìm được lại Giấy phép lái xe', CAST(N'2022-07-18 22:22:22.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[ItemType] ON 

INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (1, N'Ví/Bóp')
INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (2, N'Giấy tờ')
INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (3, N'CCCD/CMND')
INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (4, N'Giấy phép lái xe')
SET IDENTITY_INSERT [dbo].[ItemType] OFF
SET IDENTITY_INSERT [dbo].[Like] ON 

INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (2, 2, 1, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (3, 2, 2, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (4, 3, 1, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (5, 3, 2, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (6, 3, 3, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (7, 4, 1, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (8, 5, 1, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (9, 5, 2, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (10, 6, 1, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (11, 6, 2, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (12, 6, 5, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (13, 7, 6, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (14, 8, 1, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (15, 8, 2, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (16, 9, 1, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (17, 9, 2, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (18, 9, 4, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (19, 10, 6, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (20, 11, 1, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (21, 11, 2, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (22, 12, 1, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (23, 12, 2, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (24, 12, 4, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (25, 13, 6, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (26, 14, 1, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (27, 14, 2, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (28, 15, 1, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (29, 15, 2, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (30, 15, 4, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (31, 16, 6, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (32, 17, 1, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (33, 17, 2, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (34, 18, 1, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (35, 18, 2, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (36, 18, 4, 1)
INSERT [dbo].[Like] ([LikeID], [ArticleID], [MemberID], [LikeStatus]) VALUES (37, 2, 6, 0)
SET IDENTITY_INSERT [dbo].[Like] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (1, N'Phòng học')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (2, N'Nhà xe')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (3, N'Sảnh chính (Trống đồng)')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (4, N'Thư viện')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (5, N'Sân Vovinam')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (6, N'Sân trường')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (7, N'Công viên cây xanh')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (8, N'Ao sen')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (9, N'Hội trường A')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (10, N'Hội trường B')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (11, N'Hội trường C')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (12, N'Canteen')
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberID], [FullName], [Email], [Picture], [Phone], [ProfileInfo], [RoleID], [MemberStatus], [TotalReport]) VALUES (1, N'NaaTy', N'thyhnse151101@fpt.edu.vn', N'https://i.pinimg.com/originals/30/1f/58/301f58a07b86756082b9f37fc908e3d7.jpg', N'12345', N'cutexinkgai', 1, 1, 2)
INSERT [dbo].[Member] ([MemberID], [FullName], [Email], [Picture], [Phone], [ProfileInfo], [RoleID], [MemberStatus], [TotalReport]) VALUES (2, N'Nguyen Quoc Sy', N'synqse151029@fpt.edu.vn', N'https://lh3.googleusercontent.com/a-/AOh14GjXYEr6kKhobEJZPMKBxGjgLTQsUKsdbbuPxb19=s96-c', NULL, NULL, 2, 1, 1)
INSERT [dbo].[Member] ([MemberID], [FullName], [Email], [Picture], [Phone], [ProfileInfo], [RoleID], [MemberStatus], [TotalReport]) VALUES (3, N'Trần Phương Thái K15 HCM', N'thaitpse151053@fpt.edu.vn', N'https://lh3.googleusercontent.com/a-/AOh14GgvIvsCSYPC3rs-Yba5Kik5sFsoPwuLjCpObvso3Q=s96-c', NULL, NULL, 2, 0, 0)
INSERT [dbo].[Member] ([MemberID], [FullName], [Email], [Picture], [Phone], [ProfileInfo], [RoleID], [MemberStatus], [TotalReport]) VALUES (4, N'Nguyen Trong Nguyen Vũ', N'vuntnse151234@fpt.edu.vn', N'https://lh3.googleusercontent.com/a-/AOh14GhAIUdYRS2050BOcaNbCpCozTLnqpxKlqT1DWm1=s96-c', NULL, NULL, 2, 1, 3)
INSERT [dbo].[Member] ([MemberID], [FullName], [Email], [Picture], [Phone], [ProfileInfo], [RoleID], [MemberStatus], [TotalReport]) VALUES (5, N'Doan Vu Quang Huy', N'huydvqse151224@fpt.edu.vn', N'https://lh3.googleusercontent.com/a-/AOh14GjA10ilxjaK-ex8IUmwOVHzNmx7yhwDjoZ22GND3Q=s96-c', NULL, NULL, 2, 1, 2)
INSERT [dbo].[Member] ([MemberID], [FullName], [Email], [Picture], [Phone], [ProfileInfo], [RoleID], [MemberStatus], [TotalReport]) VALUES (6, N'Hoang Dinh Thai (K15 HCM)', N'thaihdse151056@fpt.edu.vn', N'https://lh3.googleusercontent.com/a-/AOh14Gh4UKGw8a7WR1XOOGOlx2eaRLFwKnarUaUy8h8f=s96-c', NULL, NULL, 2, 1, 4)
SET IDENTITY_INSERT [dbo].[Member] OFF
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([ReportID], [ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus]) VALUES (1, 2, 2, N'Đưa hình sai thông tin', CAST(N'2022-08-16 22:22:22.000' AS DateTime), 0)
INSERT [dbo].[Report] ([ReportID], [ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus]) VALUES (2, 5, 3, N'Đưa hình đã photoshop', CAST(N'2022-09-17 23:20:22.000' AS DateTime), 1)
INSERT [dbo].[Report] ([ReportID], [ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus]) VALUES (3, 8, 4, N'Đưa hình sai thông tin', CAST(N'2022-10-18 12:12:22.000' AS DateTime), 1)
INSERT [dbo].[Report] ([ReportID], [ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus]) VALUES (8, 1, 2, N'ok', CAST(N'2022-06-25 15:55:57.863' AS DateTime), 1)
INSERT [dbo].[Report] ([ReportID], [ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus]) VALUES (9, 2, 2, N'test 2', CAST(N'2022-06-25 15:58:19.523' AS DateTime), 1)
INSERT [dbo].[Report] ([ReportID], [ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus]) VALUES (10, 2, 2, N'test 2', CAST(N'2022-06-25 16:01:24.337' AS DateTime), 0)
INSERT [dbo].[Report] ([ReportID], [ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus]) VALUES (11, 2, 2, N'test 2', CAST(N'2022-06-25 16:02:08.250' AS DateTime), 1)
INSERT [dbo].[Report] ([ReportID], [ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus]) VALUES (12, 2, 2, N'test 2', CAST(N'2022-06-25 16:02:17.950' AS DateTime), 0)
INSERT [dbo].[Report] ([ReportID], [ArticleID], [MemberID], [ReportContent], [ReportTime], [ReportStatus]) VALUES (13, 41, 3, N'lỗi hình ảnh

', CAST(N'2022-06-29 14:29:14.353' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Report] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Member')
SET IDENTITY_INSERT [dbo].[Role] OFF

ALTER TABLE [dbo].[Article]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[ItemType] ([ItemID])
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD FOREIGN KEY([ArticleTypeID])
REFERENCES [dbo].[ArticleType] ([ArticleTypeID])
GO
USE [master]
GO
ALTER DATABASE [FPTU_Lost_and_Found] SET  READ_WRITE 
GO
