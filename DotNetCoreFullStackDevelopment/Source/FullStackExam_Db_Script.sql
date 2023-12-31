USE [master]
GO
/****** Object:  Database [FullStackExam]    Script Date: 07-06-2023 12:51:39 ******/
CREATE DATABASE [FullStackExam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FullStackExam', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\FullStackExam.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FullStackExam_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\FullStackExam_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FullStackExam] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FullStackExam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FullStackExam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FullStackExam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FullStackExam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FullStackExam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FullStackExam] SET ARITHABORT OFF 
GO
ALTER DATABASE [FullStackExam] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FullStackExam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FullStackExam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FullStackExam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FullStackExam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FullStackExam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FullStackExam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FullStackExam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FullStackExam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FullStackExam] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FullStackExam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FullStackExam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FullStackExam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FullStackExam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FullStackExam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FullStackExam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FullStackExam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FullStackExam] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FullStackExam] SET  MULTI_USER 
GO
ALTER DATABASE [FullStackExam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FullStackExam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FullStackExam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FullStackExam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FullStackExam] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FullStackExam] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FullStackExam] SET QUERY_STORE = OFF
GO
USE [FullStackExam]
GO
/****** Object:  Table [dbo].[PAYMENTS]    Script Date: 07-06-2023 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAYMENTS](
	[ID] [int] IDENTITY(101,1) NOT NULL,
	[DateOfPayment] [datetime] NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[UserID] [int] NULL,
	[Amount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLE]    Script Date: 07-06-2023 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 07-06-2023 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[ID] [int] IDENTITY(1001,1) NOT NULL,
	[UserID] [varchar](20) NOT NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
	[Email] [varchar](100) NULL,
	[RoleID] [int] NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ProfileURL] [nvarchar](max) NOT NULL,
	[FlatNo] [varchar](50) NOT NULL,
	[Street] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Pincode] [varchar](6) NOT NULL,
	[LastOTP] [varchar](6) NULL,
	[InitDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PAYMENTS] ON 

INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (102, CAST(N'2023-06-06T19:33:34.250' AS DateTime), 4, 2023, 1008, CAST(1026.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (103, CAST(N'2023-06-06T19:37:26.720' AS DateTime), 5, 2023, 1007, CAST(963.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (104, CAST(N'2023-06-06T19:37:36.623' AS DateTime), 1, 2023, 1007, CAST(7156.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (105, CAST(N'2023-06-06T19:37:49.400' AS DateTime), 4, 2023, 1007, CAST(635.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (106, CAST(N'2023-06-06T19:38:41.607' AS DateTime), 6, 2023, 1006, CAST(1595.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (107, CAST(N'2023-06-06T20:33:52.203' AS DateTime), 3, 2023, 1008, CAST(1235.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (108, CAST(N'2023-06-06T21:09:24.920' AS DateTime), 3, 2023, 1008, CAST(633.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (109, CAST(N'2023-06-06T21:34:16.207' AS DateTime), 6, 2023, 1008, CAST(845.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (110, CAST(N'2023-06-07T09:59:12.940' AS DateTime), 2, 2023, 1009, CAST(896.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (111, CAST(N'2023-06-07T10:06:52.423' AS DateTime), 6, 2023, 1008, CAST(596.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (112, CAST(N'2023-06-07T10:09:56.537' AS DateTime), 4, 2023, 1009, CAST(2596.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (113, CAST(N'2023-06-07T10:15:09.340' AS DateTime), 6, 2023, 1008, CAST(896.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (114, CAST(N'2023-06-07T10:18:08.810' AS DateTime), 1, 2023, 1008, CAST(453.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (115, CAST(N'2023-06-07T10:55:49.810' AS DateTime), 6, 2023, 1009, CAST(485.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (116, CAST(N'2023-06-07T10:57:48.957' AS DateTime), 3, 2023, 1009, CAST(8541.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENTS] ([ID], [DateOfPayment], [Month], [Year], [UserID], [Amount]) VALUES (117, CAST(N'2023-06-07T11:40:23.400' AS DateTime), 3, 2023, 1008, CAST(526.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[PAYMENTS] OFF
GO
SET IDENTITY_INSERT [dbo].[ROLE] ON 

INSERT [dbo].[ROLE] ([ID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[ROLE] ([ID], [RoleName]) VALUES (2, N'Devotee')
SET IDENTITY_INSERT [dbo].[ROLE] OFF
GO
SET IDENTITY_INSERT [dbo].[USER] ON 

INSERT [dbo].[USER] ([ID], [UserID], [PasswordHash], [PasswordSalt], [Email], [RoleID], [FirstName], [MiddleName], [LastName], [ProfileURL], [FlatNo], [Street], [City], [State], [Pincode], [LastOTP], [InitDate]) VALUES (1001, N'admin', 0x283882B270E2FAB71281C67F59E2D81601EB473DCCBD7E98905D5F85B4DA3946, 0xD3649E4781868D54F5EFBF25BF3DCF11B81CC06C7C2AFC521910526E40EACA28E263DA1CE43E39D62C341E5039FA1FD451578905DFF7B211B53A59C4BB36F6C5, N'sampatharshit03@gmail.com', 1, N'admin', N'admin', N'admin', N'https://s3.ap-south-1.amazonaws.com/2717-nirmal.s-feb23dotnet/admin.jfif', N'0', N'admin', N'admin', N'admin', N'admin', NULL, CAST(N'2023-06-06T15:02:13.880' AS DateTime))
INSERT [dbo].[USER] ([ID], [UserID], [PasswordHash], [PasswordSalt], [Email], [RoleID], [FirstName], [MiddleName], [LastName], [ProfileURL], [FlatNo], [Street], [City], [State], [Pincode], [LastOTP], [InitDate]) VALUES (1006, N'2023JODO30', 0x920811C457029C2197D8E465AB4E8D4833447677B310C1F43813FFC18F3769EC, 0x8E8DF5081B333C510EAC7B9F389B710C1F2AFD2ED3D51F1328ED12B54F4FBCCE7C333FBE0A05480CC7FC04B42ED7C9EB143A91B36D0B110110600D23554B738D, N'johndoe@example.com', 2, N'John', N'Bob', N'Doe', N'https://nirmal-fullstack.s3.ap-south-1.amazonaws.com/Fullstack/ishaan.jpg', N'q23', N'Fahup Path', N'Mumbai', N'Maharashtra', N'369878', N'588703', CAST(N'2023-05-30T00:00:00.000' AS DateTime))
INSERT [dbo].[USER] ([ID], [UserID], [PasswordHash], [PasswordSalt], [Email], [RoleID], [FirstName], [MiddleName], [LastName], [ProfileURL], [FlatNo], [Street], [City], [State], [Pincode], [LastOTP], [InitDate]) VALUES (1007, N'2023HASA31', 0x8294B51C6DB839E6E949AA37E002E682DDADA821BFCD9B124A2A06B479F30C94, 0xE51F50149907F075A6A5658DB5A5370AF4113636C920C150AC5598877D3B40B4D4443162183850A697878CC8D6735E39BAE1947507904EE0D7551022695A2E10, N'sampatharshit03@gmail.com', 2, N'Harshit', N'Temp', N'Sampat', N'https://nirmal-fullstack.s3.ap-south-1.amazonaws.com/Fullstack/manishsaini.jpg', N'P56', N'Wall Street', N'Ahmedabad', N'Gujarat', N'380025', N'830722', CAST(N'2023-05-31T00:00:00.000' AS DateTime))
INSERT [dbo].[USER] ([ID], [UserID], [PasswordHash], [PasswordSalt], [Email], [RoleID], [FirstName], [MiddleName], [LastName], [ProfileURL], [FlatNo], [Street], [City], [State], [Pincode], [LastOTP], [InitDate]) VALUES (1008, N'2023NISH7', 0x95182606A4FD8E37434EE21EE20396FA6072F069F96BB5E25F78AE611D274CD6, 0x84ABC3947D48CFEDF40DCB7BE05AB1AE6A9E88652BE6EFC0C5169CA524EAC86A4AA240A7792781457A92B4B2EC9623872D0F3ED021151F1D9872BB338251C2E3, N'ndshah1122@gmail.com', 2, N'Nirmal', N'D', N'Shah', N'https://nirmal-fullstack.s3.ap-south-1.amazonaws.com/Fullstack/p2.jpg', N'Q74', N'The Backyard', N'Surat', N'Gujarat', N'396547', N'551024', CAST(N'2023-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[USER] ([ID], [UserID], [PasswordHash], [PasswordSalt], [Email], [RoleID], [FirstName], [MiddleName], [LastName], [ProfileURL], [FlatNo], [Street], [City], [State], [Pincode], [LastOTP], [InitDate]) VALUES (1009, N'2023JAPR9', 0x3BE470EDC0B4AA5C26B79AD4A9F95D9E2336B74408653DF2E88FAE3BD0ADEF74, 0x97F32CD99A815FDC5F7B65D1B06D4CF61CE862F69C57466594D22FC983A3D64363757DBC37C5F97CA918C13CA0748959FF6EB746CBA5ACE0297306A685F1D4C5, N'jayprajapati280@gmail.com', 2, N'Jay', N'B', N'Prajapati', N'https://nirmal-fullstack.s3.ap-south-1.amazonaws.com/Fullstack/manishsaini.jpg', N'Q23', N'The Front Street', N'Surat', N'Gujarat', N'396547', N'626655', CAST(N'2023-05-09T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[USER] OFF
GO
ALTER TABLE [dbo].[PAYMENTS] ADD  DEFAULT (getdate()) FOR [DateOfPayment]
GO
ALTER TABLE [dbo].[USER] ADD  DEFAULT (NULL) FOR [LastOTP]
GO
ALTER TABLE [dbo].[PAYMENTS]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[USER] ([ID])
GO
ALTER TABLE [dbo].[USER]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[ROLE] ([ID])
GO
USE [master]
GO
ALTER DATABASE [FullStackExam] SET  READ_WRITE 
GO
