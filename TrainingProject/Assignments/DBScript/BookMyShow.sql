USE [master]
GO
/****** Object:  Database [BookMyShow]    Script Date: 13-07-2023 12:00:42 ******/
CREATE DATABASE [BookMyShow]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookMyShow', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\BookMyShow.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookMyShow_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\BookMyShow_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookMyShow] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookMyShow].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookMyShow] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookMyShow] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookMyShow] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookMyShow] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookMyShow] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookMyShow] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookMyShow] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookMyShow] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookMyShow] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookMyShow] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookMyShow] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookMyShow] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookMyShow] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookMyShow] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookMyShow] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookMyShow] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookMyShow] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookMyShow] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookMyShow] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookMyShow] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookMyShow] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookMyShow] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookMyShow] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookMyShow] SET  MULTI_USER 
GO
ALTER DATABASE [BookMyShow] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookMyShow] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookMyShow] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookMyShow] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookMyShow] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookMyShow] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookMyShow] SET QUERY_STORE = OFF
GO
USE [BookMyShow]
GO
/****** Object:  Table [dbo].[BATCH]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BATCH](
	[ID] [int] IDENTITY(101,1) NOT NULL,
	[ScreenID] [int] NULL,
	[MovieID] [int] NULL,
	[ShowTime] [datetime] NOT NULL,
	[FACTOR] [decimal](1, 1) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedByID] [int] NULL,
	[UpdateByID] [int] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BATCH_STATUS]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BATCH_STATUS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BatchID] [int] NULL,
	[ROW] [varchar](2) NOT NULL,
	[COL] [int] NOT NULL,
	[BatchPrice] [int] NOT NULL,
	[IsBooked] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOOKED_TICKETS]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOKED_TICKETS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BatchID] [int] NULL,
	[UserID] [int] NULL,
	[Amount] [decimal](5, 2) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedByID] [int] NULL,
	[UpdateByID] [int] NULL,
	[Status] [varchar](max) NULL,
	[Row_Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookedSeat]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookedSeat](
	[ID] [int] IDENTITY(101,1) NOT NULL,
	[TicketID] [int] NULL,
	[ROW] [varchar](2) NOT NULL,
	[COL] [int] NOT NULL,
	[Rate] [decimal](5, 2) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAST]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAST](
	[ID] [int] IDENTITY(101,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Gender] [varchar](255) NOT NULL,
	[DOB] [date] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[City] [varchar](255) NOT NULL,
	[State] [varchar](255) NOT NULL,
	[Country] [varchar](255) NOT NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedByID] [int] NULL,
	[UpdateByID] [int] NULL,
	[ProfileURL] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACILITY]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACILITY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Icon] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LAYOUT]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LAYOUT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScreenID] [int] NULL,
	[ROW] [varchar](2) NOT NULL,
	[COL] [int] NOT NULL,
	[BasePrice] [int] NOT NULL,
	[SeatTypeID] [int] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOVIE]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOVIE](
	[ID] [int] IDENTITY(101,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Duration] [varchar](255) NOT NULL,
	[IMDB_Rating] [decimal](4, 1) NULL,
	[ReleaseDate] [date] NULL,
	[PosterLink] [nvarchar](max) NULL,
	[TrailerLink] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedByID] [int] NULL,
	[UpdateByID] [int] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOVIE_ROLE]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOVIE_ROLE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieAccess]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieAccess](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[MovieId] [int] NULL,
	[isApproved] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedByID] [int] NULL,
	[UpdateByID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOVIECAST]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOVIECAST](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NULL,
	[CastID] [int] NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieObjects]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieObjects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NULL,
	[ObjectID] [int] NULL,
	[ObjectTypeID] [int] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObjectName]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObjectName](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](255) NOT NULL,
	[TypeID] [int] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObjectType]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObjectType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLE]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLE](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCREEN]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCREEN](
	[ID] [int] IDENTITY(101,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[TheaterID] [int] NULL,
	[ScreenTypeID] [int] NULL,
	[CreatedByID] [int] NULL,
	[UpdateByID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[ScreenBasePrice] [decimal](10, 2) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCREEN_TYPE]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCREEN_TYPE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](255) NOT NULL,
	[FACTOR] [decimal](3, 1) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEAT_TYPE]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEAT_TYPE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](255) NOT NULL,
	[Factor] [decimal](5, 2) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THEATRE]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THEATRE](
	[ID] [int] IDENTITY(11,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Street] [varchar](255) NOT NULL,
	[City] [varchar](255) NOT NULL,
	[State] [varchar](255) NOT NULL,
	[Country] [varchar](255) NOT NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedByID] [int] NULL,
	[UpdateByID] [int] NULL,
	[MinTicketPrice] [decimal](10, 2) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THEATRE FACILITY]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THEATRE FACILITY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TheatureID] [int] NULL,
	[FacilityID] [int] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[UserID] [int] IDENTITY(1001,1) NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[DOB] [date] NOT NULL,
	[Email] [varchar](255) NULL,
	[PhoneNo] [varchar](10) NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[RoleID] [int] NULL,
	[LastOTP] [varchar](6) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CAST] ON 

INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (101, N'Ajay Devgn', N'male', CAST(N'1969-04-02' AS Date), N'Vishal Veeru Devgan (born 2 April 1969), known professionally as Ajay Devgn, is an Indian actor, film director, editor and producer who works primarily in Hindi cinema. A leading actor of Hindi cinema, Devgn has appeared in over 100 films and has won numerous accolades, including four National Film Awards and four Filmfare Awards. In 2016, he was honoured by the Government of India with the Padma Shri, the country''s fourth-highest civilian honour', N'mumbai', N'maharashtra', N'india', CAST(N'2023-05-30T19:27:03.073' AS DateTime), CAST(N'2023-05-30T19:27:03.073' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685455020/casts/profiles/ajay.jfif1685455020526.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (102, N'Salman Khan', N'male', CAST(N'1965-12-27' AS Date), N'Salman Salim Abdul Rashid Khan (pronounced [s?l''m??n x??n] born 27 December 1965) is an Indian actor, film producer, and television personality who works predominantly in Hindi films. In a film career spanning over thirty five years, Khan has received numerous awards, including two National Film Awards as a film producer, and two Filmfare Awards as an actor.[3] He is cited in the media as one of the most commercially successful actors of Indian cinema.[4][5] Forbes has included Khan in listings of the highest-paid celebrities in the world, in 2015 and 2018, with him being the highest-ranked Indian in the latter year.', N'mumbai', N'maharashtra', N'india', CAST(N'2023-05-30T19:31:42.747' AS DateTime), CAST(N'2023-05-30T19:31:42.747' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685455302/casts/profiles/salman.jfif1685455302155.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (103, N'Shah Rukh Khan', N'male', CAST(N'1965-11-02' AS Date), N'Shah Rukh Khan (pronounced [''??????x x??n]; born 2 November 1965), also known by the initialism SRK, is an Indian actor and film producer who works in Hindi films. Referred to in the media as the "Baadshah of Bollywood" and "King Khan", he has appeared in more than 90 films, and earned numerous accolades, including 14 Filmfare Awards. He has been awarded the Padma Shri by the Government of India, as well as the Ordre des Arts et des Lettres and Legion of Honour by the Government of France. Khan has a significant following in Asia and the Indian diaspora worldwide. In terms of audience size and income, he has been described as one of the most successful film stars in the world. Many of his films thematise Indian national identity and connections with diaspora communities, or gender, racial, social and religious differences and grievances.', N'mumbai', N'maharashtra', N'india', CAST(N'2023-05-30T19:33:35.800' AS DateTime), CAST(N'2023-05-30T19:33:35.800' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685455415/casts/profiles/shahRukh.jfif1685455415170.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (104, N'Tamanna Bhatia', N'female', CAST(N'1989-12-21' AS Date), N'Tamanna Bhatia (born 21 December 1989), sometimes known mononymously as Tamannaah, is an Indian actress who works in Telugu, Tamil and Hindi cinema. Having starred in over 73 films, she has won a South Indian International Movie Award and received eight Filmfare Awards South nominations. She was conferred with Kalaimamani in 2010, and an honorary doctorate in 2022 for her contributions to Indian cinema.', N'mumbai', N'maharashtra', N'india', CAST(N'2023-05-30T19:36:34.200' AS DateTime), CAST(N'2023-05-30T19:36:34.200' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685455593/casts/profiles/tamananaah.jfif1685455592921.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (105, N'Rashmika Mandanna', N'female', CAST(N'1996-04-05' AS Date), N'English Literature at the M. S. Ramaiah College of Arts, Science and Commerce in Bangalore.', N'kodagu', N'karnataka', N'india', CAST(N'2023-05-30T19:45:22.127' AS DateTime), CAST(N'2023-05-30T19:45:22.127' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685456121/casts/profiles/rashmika.jfif1685456120587.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (106, N'Shruti Haasan', N'female', CAST(N'1986-01-28' AS Date), N'Shruti Haasan (born 28 January 1986) is an Indian actress and playback singer who primarily works in Telugu, Hindi and Tamil films. She is a recipient of several accolades including two Filmfare Award South and three South Indian International Movie Awards. She has appeared in Forbes India''s Celebrity 100 list of 2015 and 2016.', N'mumbai', N'maharashtra', N'india', CAST(N'2023-05-31T10:04:53.323' AS DateTime), CAST(N'2023-05-31T10:04:53.323' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685507690/casts/profiles/shruti.jfif1685507690562.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (107, N'Kriti Sanon', N'female', CAST(N'1990-07-27' AS Date), N'Kriti Sanon (born 27 July 1990) is an Indian actress who works in Hindi and Telugu-language films. After pursuing a degree in engineering from the Jaypee Institute of Information Technology, she briefly worked as a fashion model. Sanon began her acting career by playing the leading lady in the 2014 action films 1: Nenokkadine and Heropanti. The latter earned her the Filmfare Award for Best Female Debut.', N'mumbai', N'maharashtra', N'india', CAST(N'2023-05-31T10:12:10.377' AS DateTime), CAST(N'2023-05-31T10:12:10.377' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685508129/casts/profiles/kriti.jfif1685508128669.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (108, N'Saif Ali Khan', N'male', CAST(N'1970-08-16' AS Date), N'Saif Ali Khan Pataudi born Sajid Ali Khan Pataudi; 16 August 1970) is an Indian actor and film producer who works in Hindi films. Part of the Pataudi family, he is the son of actress Sharmila Tagore and cricketer Mansoor Ali Khan Pataudi.', N'mumbai', N'maharashtra', N'india', CAST(N'2023-05-31T10:16:05.407' AS DateTime), CAST(N'2023-05-31T10:16:05.407' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685508364/casts/profiles/saif.jfif1685508364756.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (109, N'Prabhas ', N'male', CAST(N'1979-10-23' AS Date), N'Uppalapati Venkata Suryanarayana Prabhas Raju (born 23 October 1979), known mononymously as Prabhas ([p?ab?a?s]), is an Indian actor who predominantly works in Telugu cinema. One of the highest-paid actors in Indian cinema, Prabhas has featured in Forbes India''s Celebrity 100 list three times since 2015 based on his income and popularity. He has received seven Filmfare Awards South nominations and is a recipient of a Nandi Award and a SIIMA Award.', N'hyderabad', N'telangana', N'india', CAST(N'2023-05-31T10:20:09.060' AS DateTime), CAST(N'2023-05-31T10:20:09.060' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685508608/casts/profiles/prabhas.jfif1685508608436.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (110, N'Akshay Kumar', N'male', CAST(N'1967-09-09' AS Date), N'Rajiv Hari Om Bhatia (born 9 September 1967), known professionally as Akshay Kumar, is an Indian-born naturalised Canadian actor and film producer who works in Hindi cinema. In over 30 years of acting, Kumar has appeared in over 100 films and has won several awards, including two National Film Awards and two Filmfare Awards. He received the Padma Shri, India''s fourth-highest civilian honour, from the Government of India in 2009. Kumar is one of the most prolific actors in Indian cinema. Forbes included Kumar in their lists of both highest-paid celebrities and highest-paid actors in the world from 2015 to 2020. Between 2019 and 2020, he was the only Indian on both lists.', N'mumbai', N'maharashtra', N'india', CAST(N'2023-05-31T10:23:21.833' AS DateTime), CAST(N'2023-05-31T10:23:21.833' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685508801/casts/profiles/Akshay_Kumar.jpg1685508801225.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (111, N'Amala Paul', N'female', CAST(N'1991-10-26' AS Date), N'Amala Paul (born 26 October 1991) is an Indian actress who predominantly appears in Tamil, Malayalam and Telugu films. She made her acting debut by appearing in a supporting role in the Malayalam-language film Neelathamara (2009). She won the Tamil Nadu State Film Award for Best Actress for playing the title role in Mynaa (2010).', N'ernakulam', N'kerala', N'india', CAST(N'2023-05-31T10:29:47.530' AS DateTime), CAST(N'2023-05-31T10:29:47.530' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685509187/casts/profiles/amala.jfif1685509186142.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (112, N'Rajkumar Hirani', N'male', CAST(N'1962-11-20' AS Date), N'Rajkumar Hirani is an Indian film director and editor. Hirani has directed five Hindi films, including Munna Bhai M.B.B.S., Lage Raho Munnabhai, 3 Idiots, PK and Sanju, and all of which have been commercial and critical successes. Most of which have won several awards, including the national awards.', N'nagpur', N'maharashtra', N'india', CAST(N'2023-05-31T10:42:21.930' AS DateTime), CAST(N'2023-05-31T10:42:21.930' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685509941/casts/profiles/rajkumar.jfif1685509940756.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (113, N'S. S. Rajamouli', N'male', CAST(N'1973-10-10' AS Date), N'Koduri Srisaila Sri Rajamouli born 10 October 1973) is an Indian film director and screenwriter who primarily works in Telugu cinema and is known for his action, fantasy, and epic genre films. He is the highest grossing Indian director of all time and the highest-paid director in India', N'hyderabad', N'telangana', N'india', CAST(N'2023-05-31T10:46:44.390' AS DateTime), CAST(N'2023-05-31T10:46:44.390' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685510203/casts/profiles/SS_Rajamouli.jpg1685510203787.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (115, N'Bandreddi Sukumar', N'male', CAST(N'1970-01-23' AS Date), N'Bandreddi Sukumar (born 23 January 1970) is an Indian film director, screenwriter and producer who works in Telugu cinema. He is known for his complex and multi-layered screenplays, and infusing grey shades in the characterisation of his protagonists. He is one of the highest paid directors in South Indian cinema.', N'mattaparru', N'andhra pradesh', N'india', CAST(N'2023-05-31T11:10:37.913' AS DateTime), CAST(N'2023-05-31T11:10:37.913' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685511637/casts/profiles/sukumar.jfif1685511637281.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (116, N'Bhushan Kumar', N'male', CAST(N'1977-11-27' AS Date), N'Bhushan Kumar Dua (born 27 November 1977) is an Indian film producer and music producer. He is the chairman and managing director of Super Cassettes Industries Limited, also known as T-Series. He is known for his work in Bollywood. Kumar''s subsequent projects included such films as Yaariyan, a youth-based film helmed by his wife Divya Khosla Kumar. In 2014, Kumar revived B.R. Chopra Films with Bhoothnath Returns. He then entered the genre of horror thriller with Creature 3D, starring Bipasha Basu and Imran Abbas and directed by Vikram Bhatt.', N'delhi', N'delhi', N'india', CAST(N'2023-06-01T15:57:35.210' AS DateTime), CAST(N'2023-06-01T15:57:35.210' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685615252/casts/profiles/bhushan.jpg1685615252284.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (117, N'Chris Hemsworth', N'male', CAST(N'1983-08-11' AS Date), N'Christopher Hemsworth AM (born 11 August 1983) is an Australian actor. He rose to prominence playing Kim Hyde in the Australian television series Home and Away (2004–2007) before beginning a film career in Hollywood. In the Marvel Cinematic Universe (MCU), Hemsworth started playing Thor with the 2011 film of the same name and most recently reprised the role in Thor: Love and Thunder (2022), which established him among the world''s highest-paid actors.', N'melbourne', N'victoria', N'australia', CAST(N'2023-06-01T16:17:26.130' AS DateTime), CAST(N'2023-06-01T16:17:26.130' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685616445/casts/profiles/Chris_Hemsworth.jpg1685616444320.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (118, N'Olga Kurylenko', N'female', CAST(N'1979-11-14' AS Date), N'Olga Kostyantynivna Kurylenko (Ukrainian: ????? ????????????? ?????????; born 14 November 1979) is a Ukrainian and French[a] actress and model. Born and raised in Berdyansk, Kurylenko moved to Paris at the age of 16 to pursue a modelling career. After starting her acting career in 2005, she had her breakthrough film role in the action-thriller Hitman (2007). She is known as Bond girl Camille Montes in the 22nd James Bond film, Quantum of Solace (2008) and as Taskmaster in the superhero film Black Widow (2021).', N'berdyansk', N'ukrainian ssr', N'soviet union', CAST(N'2023-06-01T16:20:11.600' AS DateTime), CAST(N'2023-06-01T16:20:11.600' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685616610/casts/profiles/Olga%20Kurylenko.jpg1685616610689.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (119, N'Sam Hargrave', N'male', CAST(N'1982-11-26' AS Date), N'Sam Hargrave is an American stunt coordinator, stuntman, actor and director. He is best known for his collaborations with the Russo brothers, including being the stunt coordinator for several films in the Marvel Cinematic Universe. The pair also wrote and produced Hargrave''s directorial debut, Extraction (2020). Hargrave also served as Second Unit Director for season two of The Mandalorian.', N'melbourne', N'victoria', N'australia', CAST(N'2023-06-01T16:24:29.683' AS DateTime), CAST(N'2023-06-01T16:24:29.683' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685616869/casts/profiles/sam.jfif1685616868955.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (120, N'Deepika Padukone', N'female', CAST(N'1986-01-05' AS Date), N'Deepika Padukone (born 5 January 1986) is an Indian actress who works predominantly in Hindi films. She is one of the highest-paid actresses in India, and her accolades include three Filmfare Awards. She features in listings of the nation''s most popular personalities; Time named her one of the 100 most influential people in the world in 2018 and awarded her the TIME100 Impact Award in 2022.', N'mumbai', N'maharashtra', N'india', CAST(N'2023-06-01T16:32:58.540' AS DateTime), CAST(N'2023-06-01T16:32:58.540' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685617377/casts/profiles/deepika-padukone-jpg.jpg1685617376574.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (121, N'John Abraham', N'male', CAST(N'1962-12-17' AS Date), N'John Abraham (born 17 December 1972) is an Indian actor and film producer who works in Hindi films. Known for his stoic action hero persona, he is a recipient of a National Film Award along with four Filmfare Awards nominations. Abraham has appeared in Forbes India''s Celebrity 100 list since 2017. After a successful modelling career, Abraham made his acting debut with the erotic thriller film Jism (2003), a sleeper hit. He gained success with the action film Dhoom (2004) and expanded to comedic roles in Garam Masala (2005), Taxi No. 9211 (2006), and Dostana (2008). He also starred in the critically acclaimed dramas Water (2005), Kabul Express (2006) and New York (2009). In the subsequent decade, Abraham''s career fluctuated commercially. He had successes in the ensemble films Housefull 2 (2012), Race 2 (2013), and Welcome Back (2015), and in the acclaimed political thriller Madras Cafe (2013). Abraham subsequently had his biggest commercial successes as a leading man in the action dramas Parmanu (2018), Satyameva Jayate (2018) and Batla House (2019). In 2023, Abraham starred in his highest-grossing release, the action film Pathaan.', N'mumbai', N'maharashtra', N'india', CAST(N'2023-06-01T16:52:07.577' AS DateTime), CAST(N'2023-06-01T16:52:07.577' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685618527/casts/profiles/JohnAbraham.jpg1685618525683.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (122, N'Allu Arjun', N'male', CAST(N'1982-04-08' AS Date), N'Allu Arjun (born 8 April 1982) is an Indian actor who works in Telugu films. One of the highest paid actors in India,  Arjun is also known for his extraordinary dancing skills.  He is a recipient of several awards including six Filmfare Awards and three Nandi Awards.  Allu Arjun made his debut with Gangotri in 2003. He rose to prominence starring in Sukumar''s cult classic Arya (2004) for which he earned a Nandi Special Jury Award.[6] He consolidated his reputation with the action films Bunny (2005) and Desamuduru (2007). In 2008, he starred in the romantic drama Parugu for which he won his first Filmfare Award for Best Actor – Telugu.', N'madras', N'tamil nadu', N'india', CAST(N'2023-06-01T16:59:08.060' AS DateTime), CAST(N'2023-06-01T16:59:08.060' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685618947/casts/profiles/allu.jfif1685618946491.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (123, N'Mahesh Babu', N'male', CAST(N'1975-08-09' AS Date), N'Ghattamaneni Mahesh Babu (born 9 August 1975) is an Indian actor, producer, media personality, and philanthropist who works mainly in Telugu cinema. He has appeared in more than 25 films, and won several accolades including, eight Nandi Awards, five Filmfare Telugu Awards, four SIIMA Awards, three CineMAA Awards, and one IIFA Utsavam Award. One of the highest-paid Telugu film actors,  he also owns the production house G. Mahesh Babu Entertainment.', N'chennai', N'tamil nadu', N'india', CAST(N'2023-06-01T17:04:35.433' AS DateTime), CAST(N'2023-06-01T17:04:35.433' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685619274/casts/profiles/220px-Mahesh_Babu_in_Spyder.jpg1685619273415.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (124, N'Dhanush', N'male', CAST(N'1983-07-28' AS Date), N'Venkatesh Prabhu Kasthuri Raja (born 28 July 1983), known professionally as Dhanush, is an Indian actor, producer, director, lyricist and playback singer who predominantly works in Tamil cinema. along with Hindi Cinema. He acted in two Hindi films Ranjhanaa and Atrange Re. Having starred in 46 films over his career, his accolades include four National Film Awards (two as actor and two as producer), 14 SIIMA Awards, nine Vijay Awards, seven Filmfare Awards South, five Vikatan Awards, five Edison Awards and a Filmfare Award. He has been included in the Forbes India Celebrity 100 list six times, which is based on the earnings of Indian celebrities.', N'madras', N'tamil nadu', N'india', CAST(N'2023-06-02T11:13:57.190' AS DateTime), CAST(N'2023-06-02T11:13:57.190' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685684634/casts/profiles/dhanush.jfif1685684633562.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (125, N'Siddharth Randeria', N'male', CAST(N'1955-12-17' AS Date), N'Siddharth Randeria was born on 17 December 1955 in Mumbai, India to Gujarati writer and stage actor Madhukar Randeria. His son Ishaan Randeria is also associated with stage and cinema. Siddharth is known for his Gujarati comedy plays for which he has won multiple awards as a writer, director and actor. He is involved in theatre since 1970 and performed as lead actor in many plays and over the last 50 years holds the record for the most live performances by an actor, crossing over 12,000 live performances till date.', N'ahmedabad', N'gujarat', N'india', CAST(N'2023-06-05T11:54:13.470' AS DateTime), CAST(N'2023-06-05T11:54:13.470' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685946252/casts/profiles/siddharthRanderia.jfif1685946251320.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (126, N'Siddhi Idnani', N'female', CAST(N'1994-01-10' AS Date), N'Third runner-up at the 2014 Clean and Clear Bombay Times Fresh Face 2014, Siddhi Idnani made her acting debut with the Devang Patel-starrer 2017 comedy Grand Hali, which also co-stars Khevna Rajyaguru and Hasmukh Bhavsar. Her 2018 release includes the comedy-drama Jamba Lakidi Pamba.', N'mumbai', N'maharashtra', N'india', CAST(N'2023-06-05T15:29:28.740' AS DateTime), CAST(N'2023-06-05T15:29:28.740' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685959168/casts/profiles/siddhi.jfif1685959167332.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (127, N'Vandana Pathak', N'female', CAST(N'1976-01-26' AS Date), N'Vandana Pathak is an Indian film, stage, and television actress best known for her role as Jayshree Parekh in the Khichdi franchise. Born and brought up in Ahmedabad, she is the daughter of Gujarati actor Arvind Vaidya. Making her television debut in 1995, she gained overnight stardom due to her terrific performance as Meenakshi Mathur in popular sitcom Hum Paanch. She has played many Gujarati roles in Indian serials. In a career spanning more than two decades, she has most of her memorable work in comedy plays and sitcoms. In 2020, Vandana is making her Gujarati film debut with Golkeri, a comedy-drama film directed by Viral Shah.', N'ahmedabad', N'gujarat', N'india', CAST(N'2023-06-05T16:07:48.843' AS DateTime), CAST(N'2023-06-05T16:07:48.843' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685961468/casts/profiles/vandana.jfif1685961467341.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (128, N'Ishaan Randeria', N'male', CAST(N'1999-01-01' AS Date), N'An Indian director and writer, Ishaan Randeria is noted for his works in Gujarati cinema. Having made his directorial debut with Gujjubhai The Great in 2015, he subsequently directed GujjuBhai - Most Wanted (2018), a Gujarati comedy-drama featuring Jimit Trivedi, Jayesh More, Vyoma Nandi, and Sunil Vishrani in important roles.', N'ahmedabad', N'gujarat', N'india', CAST(N'2023-06-05T16:09:12.847' AS DateTime), CAST(N'2023-06-05T16:09:12.847' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685961551/casts/profiles/ishaan.jfif1685961550948.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (129, N'Sachin - Jigar', N'male', CAST(N'1996-01-16' AS Date), N'Sachin-Jigar is a Mumbai based music composer duo who is known for their work in Bollywood and Gujarati cinema. The duo before working together assisted Pritam and started their career by composing for various TV soaps and jingles. The duo has composed music for more than 5000 TV episodes made their debut in Bollywood with My Name Is Anthony Gonsalves in 2008. The duo`s other popular films include Shor in the City (2011), I, Me Aur Main (2013), Finding Fanny (2014), ABCD 2 (2015) A Flying Jatt (2016) and Carry on Kesar (2017), a Gujarati film directed by Vipul Mehta. Their other 2017 release includes the action comedy A Gentleman and Kangana Ranaut-starrer, Simran which is directed by Hansal Mehta. They are also associated with the 2017 Gujarati movie Best of Luck Laalu directed by Vipul Mehta. Their other projects include Parmanu: The Story of Pokhran (2018), Veere Di Wedding (2018), Gold (2018), Arjun Patiala (2019), Made In China (2019), Bala (2019), Street Dancer 3 (2020) and Angrezi Medium (2020). Sachin-Jigar`s 2021 project includes Roohi.', N'ahmedabad', N'gujarat', N'india', CAST(N'2023-06-05T16:10:47.037' AS DateTime), CAST(N'2023-06-05T16:10:47.037' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685961645/casts/profiles/sachinJigar.jfif1685961645677.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (130, N'Malhar Thakar', N'male', CAST(N'1990-06-28' AS Date), N'Malhar Thakar is an Indian actor who primarily works in the Gujarati film and theatre industry. Malhar began his career as a theater actor and after completing nine successful years in theater, he made his feature debut with the 2015 movie Chhello Divas. The movie went on to become a blockbuster at the box office and Malhar won high praises for his performance. He carried on the success of his first movie to his next release Thai Jashe! (2016), wherein his performance as Pranav Joshi received positive reviews from the audience.

While the actor received recognition in the industry, he was offered a slurry of scripts by filmmakers. However, Malhar rejected 15 scripts before he signed his third movie Passport (2016). In 2017 he was seen in movies such as Cash on Delivery and Love Ni Bhavai. In 2018, he starred in the crime drama - Mijaaj and the comedy, Shu Thayu? Malhar Thakar`s other releases include Midnight With Menka, Saheb and Golkeri.', N'ahmedabad', N'gujarat', N'india', CAST(N'2023-06-05T17:16:11.153' AS DateTime), CAST(N'2023-06-05T17:16:11.153' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685965570/casts/profiles/malhar.jfif1685965569278.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (131, N'Monal Gajjar', N'female', CAST(N'1991-05-13' AS Date), N'Entering the entertainment industry in 2012 with the Telugu film Sudigadu, Monal Gajjar is a popular actress who has worked in most of the prominent Indian film industries. She was nominated at the SIIMA Award for Best Female Debutant for Sudigadu. She went on to star in a Malayalam film Dracula 2012 (2013), and then Tamil films like Sigaram Thodu (2014) and Vanavarayan Vallavarayan (2014). Monal has also featured in Gujarati films like Thai Jashe! (2016) and I Wish (2017). In 2018 Monal starred in the director duo Rahul Bhole and Vinit Kanojia`s Gujarati drama, Reva. The cast also includes Abhinay Banker, Chetan Dhanani, Yatin Karyekar, Prashant Barot, Rupa Borgaonkar, and Dayashankar Pandey in important roles. The movie is based on the 1998 novel "Tatvamasi" by renowned Gujarati writer Dhruv Bhatt. Her 2021 reelase incldues Kaagaz.', N'ahmedabad', N'gujarat', N'india', CAST(N'2023-06-05T17:18:26.527' AS DateTime), CAST(N'2023-06-05T17:18:26.527' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685965705/casts/profiles/monal-gajjar.jpg1685965705004.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (132, N'Manish Saini', N'male', CAST(N'1992-04-13' AS Date), N'Manish Saini is an Indian filmmaker who works in Gujarati language films. He is known for his work as a director in the 2017 film Dhh for which he received a National Film Award at the 65th National Film Awards. The film is a story of three school children who come to believe that a magician, who just came to city, can magically get them out of their troubles.  The film that starred Naseeruddin Shah was released by Viacom18 and was also a part of the Toronto International Film Festival Kids.', N'ahmedabad', N'gujarat', N'india', CAST(N'2023-06-05T17:22:56.547' AS DateTime), CAST(N'2023-06-05T17:22:56.547' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685965976/casts/profiles/manishSaini.jpg1685965975914.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (133, N'Nayanthara', N'female', CAST(N'1984-11-18' AS Date), N'Diana Mariam Kurian, famously known by her stage name, Nayanthara, is an Indian actress who is primarily known for her work in Tamil, Malayalam and Telugu cinema. Hailed as the `Lady Superstar` of South Indian cinema, she made her acting debut in 2003 with the Malayalam movie Manassinakkare, and her Kollywood debut with Ayya (2005). She has since appeared in over 70 films, enjoying tremendous box office success besides winning 5 Filmfare Awards and 6 SIIMA Awards besides earning top honours at the Tamil Nadu and Andhra Pradesh State Film Awards.', N'banglore', N'karnataka', N'india', CAST(N'2023-06-05T17:26:02.587' AS DateTime), CAST(N'2023-06-05T17:26:02.587' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685966162/casts/profiles/Nayanthara.jfif1685966161885.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1116, N'Aarjav Trivedi', N'male', CAST(N'1995-06-02' AS Date), N'Aarjav Trivedi is an Indian actor associated with the Gujarati film industry. He rose to fame with his debut movie, Chhello Divas: A New Beginning (2015). After his debut he was seen in Shubh Aarambh (2017), Duniyadari (2017) and Shu Thayu? (2018). His 2019 release includes Hellaro.', N'ahmedabad', N'gujarat', N'india', CAST(N'2023-06-07T19:18:08.540' AS DateTime), CAST(N'2023-06-07T19:18:08.540' AS DateTime), 1002, 1002, N'https://res.cloudinary.com/movie-booking-site/image/upload/v1686145687/casts/profiles/aarjav-trivedi-1061519-1680495803.jpg1686145686876.webp', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1117, N'Ezra Miller', N'male', CAST(N'1992-09-30' AS Date), N'Ezra Miller is an American actor and singer who is best known for his performances in movies like We Need to Talk About Kevin (2011) and The Perks of Being a Wallflower (2012), as well as for his role as the superhero Flash in the DC Extended Universe.

Miller made his acting debut in the 2008 drama film Afterschool, which was nominated for the Golden Camera Award at the Cannes Film Festival that year. Subsequently, the actor appeared in comedy-dramas like City Island (2009), Every Day (2010) and Another Happy Day (2011) before landing his breakout role in the psychological thriller We Need to Talk About Kevin. (2011). For his portrayal of the titular character Kevin, Miller was nominated for a Critic`s Choice Movie Award for Best Actor and a British Independent Film Award for Best Supporting Actor that year.', N'hoboken', N'new jersy', N'united states of america', CAST(N'2023-06-19T13:08:41.820' AS DateTime), CAST(N'2023-06-19T13:08:41.820' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585144465775602245ezra-miller.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1118, N'Ben Affleck', N'male', CAST(N'1972-08-15' AS Date), N'Ben Affleck is an American television and film actor, director, writer, and producer who started his acting career as a child artist with the PBS educational television series The Voyage of the Mimi in 1984. He is was seen in films like Shakespeare in Love, Pearl Harbor, and Gone Girl. However, he is best remembered for his portrayal of Batman in Batman v Superman: Dawn of Justice.

Affleck made his directorial debut with 2007 neo-noir mystery film Gone Baby Gone, which he also co-wrote. However, it was his 2012 political thriller Argo, which he also starred in, that brought him immense fame and won him the Golden Globe and BAFTA Award for Best Director, and the Golden Globe, BAFTA and Academy Award for Best Picture.', N'san francisco', N'california', N'united states of america', CAST(N'2023-06-19T15:20:39.850' AS DateTime), CAST(N'2023-06-19T15:20:39.850' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585144386474239070Ben_Affleck.png', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1119, N'Michael Keaton', N'male', CAST(N'1951-09-05' AS Date), N'An American film and television actor, director, and producer, Michael Keaton is known for appearing in movies like Mr. Mom (1983), Beetlejuice (1988), Batman (1989), Batman Returns (1992), Much Ado About Nothing (1993), Noah`s Ark: The New Beginning (2012), Birdman (2014) and Spotlight (2015). Keaton received an Academy Award nomination and a Golden Globe Award for playing the titular character in Alejandro G. Inarritu black comedy, Birdman.

For his contribution to the world of cinema, he was named the Officer of Order of Arts and Letters in France, in 2016.', N'coraopolis', N'pennsylvania', N'united states of america', CAST(N'2023-06-19T18:35:44.607' AS DateTime), CAST(N'2023-06-19T18:35:44.607' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585144269499164841MichaelKeaton.png', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1120, N'Barbara Muschietti', N'female', CAST(N'1971-12-22' AS Date), N'Barbara Muschietti is an Argentine film producer and writer, who is best known for being one of the writers on the 2013 horror movie, Mama. Her brother Andy Muschietti and Neil Cross were the other two writers. Barbara also served as the producer for the movie. In 2017 she produced Andy Muschietti`s horror movie, It. The movie is based on legendary writer Stephen King`s horror epic of the same name. Barbara is also serving as a producer on the upcoming TV series, Locke and Key. The show based on the horror comics by Joe Hill is being directed by Andy Muschietti. Her 2019 release includes IT: Chapter Two.', N'buenos aires', N'buenos aires', N'argentina', CAST(N'2023-06-19T18:39:08.610' AS DateTime), CAST(N'2023-06-19T18:39:08.610' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585144267389663989BarbaraMuschietti.png', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1121, N'Joby Harold', N'male', CAST(N'1982-08-26' AS Date), N'Associated with films like Awake (2007), Edge of Tomorrow (2014), and My Blind Brother (2016), Joby Harold is an American director, producer, and screenwriter. His 2017 project as a writer and producer includes the adventure drama film King Arthur: Legend of the Sword. Directed by Guy Ritchie, the movie stars Charlie Hunnam, Katie McGrath, Jude Law, and Eric Bana in important roles. In 2018 he worked on the movie Robin Hood. His 2019 release includes John Wick: Chapter 3 - Parabellum. His other projects include Army of the Dead (2021). He has also served as executive producer for web series like Underground (2016-17), Spinning Out (2020) and Obi-Wan Kenobi (2022).', N'london', N'england', N'united kingdom', CAST(N'2023-06-19T18:43:35.913' AS DateTime), CAST(N'2023-06-19T18:43:35.913' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585144264723488748JobyHarold.png', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1122, N'Andrés Muschietti', N'male', CAST(N'1973-08-23' AS Date), N'Andy Muschietti is an Argentine filmmaker, best known for directing the It film series. He made his directorial debut with the supernatural horror film Mama (2013). In 2015, New Line Cinema hired Muscheitti for the direction of It, the two-part adaptation of Stephen King`s 1986 novel of the same name. Muschietti is also an Executive producer of a TV series titled Locke and Key for Netflix.', N'buenos aires', N'buenos aires', N'argentina', CAST(N'2023-06-19T18:47:07.040' AS DateTime), CAST(N'2023-06-19T18:47:07.040' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585144262609058461AndrésMuschietti.png', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1123, N'Christina Hodson', N'female', CAST(N'1977-06-02' AS Date), N'Christina Hodson is a British screenwriter who wrote the Naomi Watts thriller Shut In (2016). She was noticed when one of her movie scripts "Seed" ended up in the 2013 Black List of best unproduced scripts. In 2017 Denise Di Novi directed Hodson`s script to make Unforgettable. The movie cast includes Rosario Dawson, Katherine Heigl and Geoff Stults. Her other release includes Bumblebee (2019) and Harley Quinn: Birds Of Prey (2020).', N'london', N'england', N'united kingdom', CAST(N'2023-06-19T18:52:55.883' AS DateTime), CAST(N'2023-06-19T18:52:55.883' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585144259124697546ChristinaHodson.png', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1124, N'Kiara Advani', N'female', CAST(N'1992-07-31' AS Date), N'An Indian actress in Bollywood, Kiara Advani made her acting debut with the 2014 film Fugly, starring Mohit Marwah, Vijender Singh, and Jimmy Shergill.', N'mumbai', N'maharashtra', N'india', CAST(N'2023-06-30T11:25:35.800' AS DateTime), CAST(N'2023-06-30T11:25:35.800' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585135023513317525KIARA.jfif', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1125, N'Gajraj Rao', N'male', CAST(N'1971-01-01' AS Date), N'An Indian actor and ad filmmaker Gajraj Rao, known for essaying supporting roles in Hindi movies, started his acting career in the early 90s with the biographical crime drama Bandit Queen in 1994. Following his feature film debut, he went on to be associated with several movies like Dil Se (1998), Dil Hai Tumhaara (2002), Black Friday (2004), No Smoking (2007), and Aamir (2008). However, it was his portrayal of Inspector Dhaniram in the murder mystery Talvar that won him widespread recognition, earning him several award nominations under the category of Best Actor in a Negative Role.', N'jaipur', N'rajasthan', N'india', CAST(N'2023-06-30T12:20:00.150' AS DateTime), CAST(N'2023-06-30T12:20:00.150' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585134990862389664gajrajRao.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1126, N'Anuradha Patel', N'female', CAST(N'1965-06-14' AS Date), N'Anuradha Patel is an Indian film actress, born on March 14th, 1965 in Mumbai, Maharashtra. She is married to actor Kanwaljeet Singh, and they have two sons. She has appeared in a TV serial Dekho Magar Pyar Se on Star TV. She has acted in several Hindi films such as Utsav, Dharam Adhikari, Dayavan, Ijaazat etc.', N'mumbai', N'maharashtra', N'india', CAST(N'2023-06-30T12:23:29.740' AS DateTime), CAST(N'2023-06-30T12:23:29.740' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585134988774963633anuradhaPatel.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1127, N'Sajid Nadiadwala', N'male', CAST(N'1966-02-18' AS Date), N'An Indian film director and producer, Sajid Nadiadwala is primarily associated with Hindi film industry. He also owns his a production company called Nadiadwala Grandson Entertainment.

Nadiadwala started off as a production assistant in his family production house, where he studied filmmaking closely. In 1992, he went on to establish his own production house and produce his first film Zulm Ki Hukumat starring Govinda and Dharmendra. He is known for producing films such as Jeet (1996), Judwaa (1997), Har Dil Jo Pyar Karega (2000) and Mujhse Shaadi Karogi (2004).', N'mumbai', N'maharashtra', N'india', CAST(N'2023-06-30T12:25:06.890' AS DateTime), CAST(N'2023-06-30T12:25:06.890' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585134987796293803sajid_nadiadwala.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1128, N'Kishor Arora', N'male', CAST(N'1968-08-09' AS Date), N'Kishor Arora is a notable film producer in Hindi cinema. He has helmed production of several films over the years including Beyond the Clouds (2017), Lost (2023) and Satyaprem Ki Katha (2023). He also produced a Marathi feature, Anandi Gopal, that told the fascinating tale of India`s first female Doctor. He also produced, a two season web-series Karenjit Kaur that told the story of Sunny Leone. He worked on a war based period epic centered around the life of tribal revolutionary leader Birsa Munda, who fought against British rule, directed by Pa Ranjith. Kishor was also involved in the production of a web series based on the autobiography of Phoolan Devi, famously known as India`s Bandit Queen. Having worked for over a decade, Kishor has extensively produced international features, commercials and short films. Kishor Arora, along with Shareen Mantri Kedia, co-founded Namah Pictures, a Mumbai-headquartered production company that takes pride in backing and presenting true blue content-driven projects.', N'delhi', N'delhi', N'india', CAST(N'2023-06-30T12:36:21.380' AS DateTime), CAST(N'2023-06-30T12:36:21.380' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585134981051051959kishor-arora.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1129, N'Kartik Aaryan', N'male', CAST(N'1988-11-22' AS Date), N'The new Bollywood heartthrob who has wowed one and all with his dashing looks and spirited performances, Kartik Aaryan`s career has steadily been on the upward trajectory ever since his debut in Pyaar Ka Punchnama (2011).
', N'gwalior', N'madhya pradesh', N'india', CAST(N'2023-06-30T12:40:03.350' AS DateTime), CAST(N'2023-06-30T12:40:03.350' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585134978867747641kartik.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1130, N'Harrison Ford', N'male', CAST(N'1942-07-13' AS Date), N'Born to Dorothy Ford, a homemaker, and former radio actress, and Christopher Ford was an advertising executive and a former actor, Harrison Ford is an American actor and producer. He attended a drama class in his senior year at college to overcome his shyness. In 1964, Ford traveled to Los Angeles to apply for the job of a radio voice-over. He ended up staying in California and eventually signed a $150 a week contract with Columbia Pictures` New Talent program, playing small roles in films. His first known appearance was a minor role as a bellhop in Dead Heat on a Merry-Go-Round (1966). He gained worldwide fame for his starring roles as Han Solo in the Star Wars film series and as the title character of Indiana Jones movie series.', N'chicago', N'illinois', N'united states of america', CAST(N'2023-06-30T12:46:05.280' AS DateTime), CAST(N'2023-06-30T12:46:05.280' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585134975211546159harrison-ford.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1131, N'Antonio Banderas', N'male', CAST(N'1960-08-10' AS Date), N'Antonio Banderas, born as Jose Antonio Dominguez Banderas, in Malaga, Spain, is a widely known film actor in Hollywood. After studying at the School of Dramatic Art, Antonio made his debut at a small theatre in Malaga. In addition to being a struggling actor, he also worked as a waiter and took up small modelling jobs. Later, Banderas joined the troupe at the National Theatre of Spain, where his stage performances caught the attention of film director, Pedro Almodovar, who then cast Antonio in his debut film, Labyrinth of Passion (1982).', N'malaga', N'andalucia', N'spain', CAST(N'2023-06-30T12:47:25.440' AS DateTime), CAST(N'2023-06-30T12:47:25.440' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585134974409847516antonio-banderas.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1132, N'John Rhys-Davies', N'male', CAST(N'1944-05-05' AS Date), N'John Rhys-Davies is a Welsh actor who is known for portraying the role of Gimli and the voice of Treebeard in the Lord of the Rings trilogy, Sallah in the Raiders of the Lost Ark and other Indiana Jones films. He also played Michael Malone in the 1993 remake of the 1950s television series The Untouchables (1993-94), Vasco Rodrigues in the mini-series Shogun (1975), Prof. Maximillian Arturo in Sliders (1995-2000), King Richard I in Robin of Sherwood, General Leonid Pushkin in the James Bond film The Living Daylights (1987) and Macro in I, Claudius (1976). He provided the voices of Cassim in Aladdin and the King of Thieves, Ranjan`s father in The Jungle Book 2 (2003), Macbeth in Gargoyles, Man Ray in SpongeBob SquarePants, Hades in Justice League and Tobias in the computer game Freelancer.', N'salisbury', N'england', N'united kingdom', CAST(N'2023-06-30T12:49:21.430' AS DateTime), CAST(N'2023-06-30T12:49:21.430' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585134973249607790john-rhys-davies.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1133, N'James Mangold', N'male', CAST(N'1963-12-16' AS Date), N'James Mangold is an American film and television director, screenwriter and producer. He was the co – writer for the movies The Wolverine,Cop Land,Girl, Interrupted, Knight and Day. He has directed the movie Walk the Line. Mangold has produced and directed the pilots for the television series Men In Trees, NYC 22 and Vegas.', N'new york', N'new york', N'united states of america', CAST(N'2023-06-30T12:50:59.930' AS DateTime), CAST(N'2023-06-30T12:50:59.930' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585134972262994299james.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1134, N'Vicky Kaushal', N'male', CAST(N'1988-05-16' AS Date), N'Vicky Kaushal is an Indian actor who is best remembered for his performance in award-winning movie Masaan in 2015 for which he won the IIFA Award for Best Male Debut.', N'mumbai', N'maharashtra', N'india', CAST(N'2023-06-30T13:39:38.597' AS DateTime), CAST(N'2023-06-30T13:39:38.597' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585134943077565274vicky.jpg', 1)
INSERT [dbo].[CAST] ([ID], [Name], [Gender], [DOB], [Description], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [ProfileURL], [Status]) VALUES (1135, N'Sara Ali Khan', N'female', CAST(N'1995-08-12' AS Date), N'Daughter of the Nawab of Bollywood, Saif Ali Khan, and his first wife Amrita Singh, Sara Ali Khan is one of the newest actresses on the block to become a part of Bollywood. After graduating from the University of Columbia in 2016, Sara returned to India and started to prepare for her debut project - Kedarnath directed by Abhishek Kapoor, who is known for directing Rock On!!, Kedarnath also features Sushant Singh Rajput, whom the director worked with, in his acting debut Kai Po Che.', N'mumbai', N'maharashtra', N'india', CAST(N'2023-06-30T13:41:15.793' AS DateTime), CAST(N'2023-06-30T13:41:15.793' AS DateTime), 1002, 1002, N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Profiles/-8585134942105892212sara.jpg', 1)
SET IDENTITY_INSERT [dbo].[CAST] OFF
GO
SET IDENTITY_INSERT [dbo].[FACILITY] ON 

INSERT [dbo].[FACILITY] ([ID], [Name], [Icon], [Status]) VALUES (1, N'Parking', N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Facilities/-8585143456486505012parking.png', 1)
INSERT [dbo].[FACILITY] ([ID], [Name], [Icon], [Status]) VALUES (2, N'Ticket Cancellation', N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Facilities/-8585143454015863445bookCancel.png', 1)
INSERT [dbo].[FACILITY] ([ID], [Name], [Icon], [Status]) VALUES (3, N'Food Court', N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Facilities/-8585143453411397124food.png', 1)
INSERT [dbo].[FACILITY] ([ID], [Name], [Icon], [Status]) VALUES (4, N'M Ticket', N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Facilities/-8585143452535283496mTicket.png', 1)
INSERT [dbo].[FACILITY] ([ID], [Name], [Icon], [Status]) VALUES (5, N'F & B', N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Facilities/-8585143451902584206FandB.png', 1)
INSERT [dbo].[FACILITY] ([ID], [Name], [Icon], [Status]) VALUES (6, N'Wheel Chair Facility', N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Facilities/-8585143449513843782wheelChair.png', 1)
INSERT [dbo].[FACILITY] ([ID], [Name], [Icon], [Status]) VALUES (7, N'Recliner Seats', N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Facilities/-8585143449296544613recliner.png', 1)
INSERT [dbo].[FACILITY] ([ID], [Name], [Icon], [Status]) VALUES (8, N'Gaming Zone', N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Facilities/-8585143449154133869game.png', 1)
SET IDENTITY_INSERT [dbo].[FACILITY] OFF
GO
SET IDENTITY_INSERT [dbo].[LAYOUT] ON 

INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (5, 101, N'A', 1, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (6, 101, N'A', 2, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (7, 101, N'A', 3, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (8, 101, N'A', 4, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (9, 101, N'A', 5, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (10, 101, N'A', 6, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (11, 101, N'A', 7, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (12, 101, N'A', 8, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (13, 101, N'A', 9, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (14, 101, N'A', 10, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (15, 101, N'A', 11, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (16, 101, N'A', 12, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (17, 101, N'A', 13, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (18, 101, N'A', 14, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (19, 101, N'A', 15, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (20, 101, N'A', 16, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (21, 101, N'A', 17, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (22, 101, N'A', 18, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (23, 101, N'A', 19, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (24, 101, N'A', 20, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (25, 101, N'A', 21, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (26, 101, N'A', 22, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (27, 101, N'B', 1, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (28, 101, N'B', 2, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (29, 101, N'B', 3, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (30, 101, N'B', 4, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (31, 101, N'B', 5, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (32, 101, N'B', 6, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (33, 101, N'B', 7, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (34, 101, N'B', 8, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (35, 101, N'B', 9, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (36, 101, N'B', 10, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (37, 101, N'B', 11, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (38, 101, N'B', 12, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (39, 101, N'B', 13, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (40, 101, N'B', 14, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (41, 101, N'B', 15, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (42, 101, N'B', 16, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (43, 101, N'B', 17, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (44, 101, N'B', 18, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (45, 101, N'B', 19, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (46, 101, N'B', 20, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (47, 101, N'B', 21, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (48, 101, N'B', 22, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (49, 101, N'A', 1, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (50, 101, N'A', 2, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (51, 101, N'A', 3, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (52, 101, N'A', 4, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (53, 101, N'A', 5, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (54, 101, N'A', 6, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (55, 101, N'A', 7, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (56, 101, N'A', 8, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (57, 101, N'A', 9, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (58, 101, N'A', 10, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (59, 101, N'A', 11, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (60, 101, N'A', 12, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (61, 101, N'A', 13, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (62, 101, N'A', 14, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (63, 101, N'A', 15, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (64, 101, N'A', 16, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (65, 101, N'A', 17, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (66, 101, N'A', 18, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (67, 101, N'A', 19, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (68, 101, N'A', 20, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (69, 101, N'A', 21, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (70, 101, N'B', 1, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (71, 101, N'B', 2, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (72, 101, N'B', 3, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (73, 101, N'B', 4, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (74, 101, N'B', 5, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (75, 101, N'B', 6, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (76, 101, N'B', 7, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (77, 101, N'B', 8, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (78, 101, N'B', 9, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (79, 101, N'B', 10, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (80, 101, N'B', 11, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (81, 101, N'B', 12, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (82, 101, N'B', 13, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (83, 101, N'B', 14, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (84, 101, N'B', 15, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (85, 101, N'B', 16, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (86, 101, N'B', 17, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (87, 101, N'B', 18, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (88, 101, N'B', 19, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (89, 101, N'B', 20, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (90, 101, N'B', 21, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (91, 101, N'C', 1, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (92, 101, N'C', 2, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (93, 101, N'C', 3, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (94, 101, N'C', 4, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (95, 101, N'C', 5, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (96, 101, N'C', 6, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (97, 101, N'C', 7, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (98, 101, N'C', 8, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (99, 101, N'C', 9, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (100, 101, N'C', 10, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (101, 101, N'C', 11, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (102, 101, N'C', 12, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (103, 101, N'C', 13, 140, 2, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (104, 101, N'C', 14, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (105, 101, N'C', 15, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (106, 101, N'C', 16, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (107, 101, N'C', 17, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (108, 101, N'C', 18, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (109, 101, N'C', 19, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (110, 101, N'C', 20, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (111, 101, N'C', 21, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (112, 101, N'D', 1, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (113, 101, N'D', 2, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (114, 101, N'D', 3, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (115, 101, N'D', 4, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (116, 101, N'D', 5, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (117, 101, N'D', 6, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (118, 101, N'D', 7, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (119, 101, N'D', 8, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (120, 101, N'D', 9, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (121, 101, N'D', 10, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (122, 101, N'D', 11, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (123, 101, N'D', 12, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (124, 101, N'D', 13, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (125, 101, N'D', 14, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (126, 101, N'D', 15, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (127, 101, N'D', 16, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (128, 101, N'D', 17, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (129, 101, N'D', 18, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (130, 101, N'D', 19, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (131, 101, N'D', 20, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (132, 101, N'D', 21, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (133, 101, N'E', 1, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (134, 101, N'E', 2, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (135, 101, N'E', 3, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (136, 101, N'E', 4, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (137, 101, N'E', 5, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (138, 101, N'E', 6, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (139, 101, N'E', 7, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (140, 101, N'E', 8, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (141, 101, N'E', 9, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (142, 101, N'E', 10, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (143, 101, N'E', 11, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (144, 101, N'E', 12, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (145, 101, N'E', 13, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (146, 101, N'E', 14, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (147, 101, N'E', 15, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (148, 101, N'E', 16, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (149, 101, N'E', 17, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (150, 101, N'E', 18, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (151, 101, N'E', 19, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (152, 101, N'E', 20, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (153, 101, N'E', 21, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (154, 101, N'F', 1, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (155, 101, N'F', 2, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (156, 101, N'F', 3, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (157, 101, N'F', 4, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (158, 101, N'F', 5, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (159, 101, N'F', 6, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (160, 101, N'F', 7, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (161, 101, N'F', 8, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (162, 101, N'F', 9, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (163, 101, N'F', 10, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (164, 101, N'F', 11, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (165, 101, N'F', 12, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (166, 101, N'F', 13, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (167, 101, N'F', 14, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (168, 101, N'F', 15, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (169, 101, N'F', 16, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (170, 101, N'F', 17, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (171, 101, N'F', 18, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (172, 101, N'F', 19, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (173, 101, N'F', 20, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (174, 101, N'F', 21, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (175, 101, N'A', 1, 180, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (176, 101, N'A', 2, 180, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (177, 101, N'A', 3, 180, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (178, 101, N'A', 4, 180, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (179, 101, N'A', 5, 180, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (180, 101, N'A', 6, 180, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (181, 101, N'B', 1, 180, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (182, 101, N'B', 2, 180, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (183, 101, N'B', 3, 180, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (184, 101, N'B', 4, 180, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (185, 101, N'B', 5, 180, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (186, 101, N'B', 6, 180, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (187, 102, N'A', 1, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (188, 102, N'A', 2, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (189, 102, N'A', 3, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (190, 102, N'A', 4, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (191, 102, N'A', 5, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (192, 102, N'A', 6, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (193, 102, N'A', 7, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (194, 102, N'A', 8, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (195, 102, N'A', 9, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (196, 102, N'A', 10, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (197, 102, N'A', 11, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (198, 102, N'A', 12, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (199, 102, N'A', 13, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (200, 102, N'A', 14, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (201, 102, N'A', 15, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (202, 102, N'A', 16, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (203, 102, N'A', 17, 170, 1, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (204, 102, N'A', 18, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (205, 102, N'A', 19, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (206, 102, N'A', 20, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (207, 102, N'A', 21, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (208, 102, N'A', 22, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (209, 102, N'A', 23, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (210, 102, N'B', 1, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (211, 102, N'B', 2, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (212, 102, N'B', 3, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (213, 102, N'B', 4, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (214, 102, N'B', 5, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (215, 102, N'B', 6, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (216, 102, N'B', 7, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (217, 102, N'B', 8, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (218, 102, N'B', 9, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (219, 102, N'B', 10, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (220, 102, N'B', 11, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (221, 102, N'B', 12, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (222, 102, N'B', 13, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (223, 102, N'B', 14, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (224, 102, N'B', 15, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (225, 102, N'B', 16, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (226, 102, N'B', 17, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (227, 102, N'B', 18, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (228, 102, N'B', 19, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (229, 102, N'B', 20, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (230, 102, N'B', 21, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (231, 102, N'B', 22, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (232, 102, N'B', 23, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (233, 102, N'C', 1, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (234, 102, N'C', 2, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (235, 102, N'C', 3, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (236, 102, N'C', 4, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (237, 102, N'C', 5, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (238, 102, N'C', 6, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (239, 102, N'C', 7, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (240, 102, N'C', 8, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (241, 102, N'C', 9, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (242, 102, N'C', 10, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (243, 102, N'C', 11, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (244, 102, N'C', 12, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (245, 102, N'C', 13, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (246, 102, N'C', 14, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (247, 102, N'C', 15, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (248, 102, N'C', 16, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (249, 102, N'C', 17, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (250, 102, N'C', 18, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (251, 102, N'C', 19, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (252, 102, N'C', 20, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (253, 102, N'C', 21, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (254, 102, N'C', 22, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (255, 102, N'C', 23, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (256, 102, N'D', 1, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (257, 102, N'D', 2, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (258, 102, N'D', 3, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (259, 102, N'D', 4, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (260, 102, N'D', 5, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (261, 102, N'D', 6, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (262, 102, N'D', 7, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (263, 102, N'D', 8, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (264, 102, N'D', 9, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (265, 102, N'D', 10, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (266, 102, N'D', 11, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (267, 102, N'D', 12, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (268, 102, N'D', 13, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (269, 102, N'D', 14, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (270, 102, N'D', 15, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (271, 102, N'D', 16, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (272, 102, N'D', 17, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (273, 102, N'D', 18, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (274, 102, N'D', 19, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (275, 102, N'D', 20, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (276, 102, N'D', 21, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (277, 102, N'D', 22, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (278, 102, N'D', 23, 170, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (279, 102, N'A', 1, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (280, 102, N'A', 2, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (281, 102, N'A', 3, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (282, 102, N'A', 4, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (283, 102, N'A', 5, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (284, 102, N'A', 6, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (285, 102, N'A', 7, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (286, 102, N'A', 8, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (287, 102, N'A', 9, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (288, 102, N'A', 10, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (289, 102, N'A', 11, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (290, 102, N'A', 12, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (291, 102, N'A', 13, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (292, 102, N'A', 14, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (293, 102, N'A', 15, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (294, 102, N'A', 16, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (295, 102, N'A', 17, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (296, 102, N'A', 18, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (297, 102, N'A', 19, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (298, 102, N'A', 20, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (299, 102, N'A', 21, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (300, 102, N'A', 22, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (301, 102, N'A', 23, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (302, 102, N'A', 24, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (303, 102, N'A', 25, 180, 2, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (304, 102, N'B', 1, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (305, 102, N'B', 2, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (306, 102, N'B', 3, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (307, 102, N'B', 4, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (308, 102, N'B', 5, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (309, 102, N'B', 6, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (310, 102, N'B', 7, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (311, 102, N'B', 8, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (312, 102, N'B', 9, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (313, 102, N'B', 10, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (314, 102, N'B', 11, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (315, 102, N'B', 12, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (316, 102, N'B', 13, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (317, 102, N'B', 14, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (318, 102, N'B', 15, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (319, 102, N'B', 16, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (320, 102, N'B', 17, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (321, 102, N'B', 18, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (322, 102, N'B', 19, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (323, 102, N'B', 20, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (324, 102, N'B', 21, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (325, 102, N'B', 22, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (326, 102, N'B', 23, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (327, 102, N'B', 24, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (328, 102, N'B', 25, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (329, 102, N'C', 1, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (330, 102, N'C', 2, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (331, 102, N'C', 3, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (332, 102, N'C', 4, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (333, 102, N'C', 5, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (334, 102, N'C', 6, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (335, 102, N'C', 7, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (336, 102, N'C', 8, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (337, 102, N'C', 9, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (338, 102, N'C', 10, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (339, 102, N'C', 11, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (340, 102, N'C', 12, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (341, 102, N'C', 13, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (342, 102, N'C', 14, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (343, 102, N'C', 15, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (344, 102, N'C', 16, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (345, 102, N'C', 17, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (346, 102, N'C', 18, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (347, 102, N'C', 19, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (348, 102, N'C', 20, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (349, 102, N'C', 21, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (350, 102, N'C', 22, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (351, 102, N'C', 23, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (352, 102, N'C', 24, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (353, 102, N'C', 25, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (354, 102, N'D', 1, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (355, 102, N'D', 2, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (356, 102, N'D', 3, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (357, 102, N'D', 4, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (358, 102, N'D', 5, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (359, 102, N'D', 6, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (360, 102, N'D', 7, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (361, 102, N'D', 8, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (362, 102, N'D', 9, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (363, 102, N'D', 10, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (364, 102, N'D', 11, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (365, 102, N'D', 12, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (366, 102, N'D', 13, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (367, 102, N'D', 14, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (368, 102, N'D', 15, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (369, 102, N'D', 16, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (370, 102, N'D', 17, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (371, 102, N'D', 18, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (372, 102, N'D', 19, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (373, 102, N'D', 20, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (374, 102, N'D', 21, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (375, 102, N'D', 22, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (376, 102, N'D', 23, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (377, 102, N'D', 24, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (378, 102, N'D', 25, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (379, 102, N'E', 1, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (380, 102, N'E', 2, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (381, 102, N'E', 3, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (382, 102, N'E', 4, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (383, 102, N'E', 5, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (384, 102, N'E', 6, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (385, 102, N'E', 7, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (386, 102, N'E', 8, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (387, 102, N'E', 9, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (388, 102, N'E', 10, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (389, 102, N'E', 11, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (390, 102, N'E', 12, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (391, 102, N'E', 13, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (392, 102, N'E', 14, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (393, 102, N'E', 15, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (394, 102, N'E', 16, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (395, 102, N'E', 17, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (396, 102, N'E', 18, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (397, 102, N'E', 19, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (398, 102, N'E', 20, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (399, 102, N'E', 21, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (400, 102, N'E', 22, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (401, 102, N'E', 23, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (402, 102, N'E', 24, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (403, 102, N'E', 25, 180, 2, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (404, 102, N'F', 1, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (405, 102, N'F', 2, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (406, 102, N'F', 3, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (407, 102, N'F', 4, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (408, 102, N'F', 5, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (409, 102, N'F', 6, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (410, 102, N'F', 7, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (411, 102, N'F', 8, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (412, 102, N'F', 9, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (413, 102, N'F', 10, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (414, 102, N'F', 11, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (415, 102, N'F', 12, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (416, 102, N'F', 13, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (417, 102, N'F', 14, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (418, 102, N'F', 15, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (419, 102, N'F', 16, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (420, 102, N'F', 17, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (421, 102, N'F', 18, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (422, 102, N'F', 19, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (423, 102, N'F', 20, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (424, 102, N'F', 21, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (425, 102, N'F', 22, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (426, 102, N'F', 23, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (427, 102, N'F', 24, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (428, 102, N'F', 25, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (429, 102, N'G', 1, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (430, 102, N'G', 2, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (431, 102, N'G', 3, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (432, 102, N'G', 4, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (433, 102, N'G', 5, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (434, 102, N'G', 6, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (435, 102, N'G', 7, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (436, 102, N'G', 8, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (437, 102, N'G', 9, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (438, 102, N'G', 10, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (439, 102, N'G', 11, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (440, 102, N'G', 12, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (441, 102, N'G', 13, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (442, 102, N'G', 14, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (443, 102, N'G', 15, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (444, 102, N'G', 16, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (445, 102, N'G', 17, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (446, 102, N'G', 18, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (447, 102, N'G', 19, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (448, 102, N'G', 20, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (449, 102, N'G', 21, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (450, 102, N'G', 22, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (451, 102, N'G', 23, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (452, 102, N'G', 24, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (453, 102, N'G', 25, 180, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (454, 102, N'A', 1, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (455, 102, N'A', 2, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (456, 102, N'A', 3, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (457, 102, N'A', 4, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (458, 102, N'A', 5, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (459, 102, N'A', 6, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (460, 102, N'A', 7, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (461, 102, N'A', 8, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (462, 102, N'A', 9, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (463, 102, N'A', 10, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (464, 102, N'A', 11, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (465, 102, N'A', 12, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (466, 102, N'A', 13, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (467, 102, N'A', 14, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (468, 102, N'A', 15, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (469, 102, N'A', 16, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (470, 102, N'A', 17, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (471, 102, N'A', 18, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (472, 102, N'A', 19, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (473, 102, N'A', 20, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (474, 102, N'B', 1, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (475, 102, N'B', 2, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (476, 102, N'B', 3, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (477, 102, N'B', 4, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (478, 102, N'B', 5, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (479, 102, N'B', 6, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (480, 102, N'B', 7, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (481, 102, N'B', 8, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (482, 102, N'B', 9, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (483, 102, N'B', 10, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (484, 102, N'B', 11, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (485, 102, N'B', 12, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (486, 102, N'B', 13, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (487, 102, N'B', 14, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (488, 102, N'B', 15, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (489, 102, N'B', 16, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (490, 102, N'B', 17, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (491, 102, N'B', 18, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (492, 102, N'B', 19, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (493, 102, N'B', 20, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (494, 102, N'C', 1, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (495, 102, N'C', 2, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (496, 102, N'C', 3, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (497, 102, N'C', 4, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (498, 102, N'C', 5, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (499, 102, N'C', 6, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (500, 102, N'C', 7, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (501, 102, N'C', 8, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (502, 102, N'C', 9, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (503, 102, N'C', 10, 200, 3, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (504, 102, N'C', 11, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (505, 102, N'C', 12, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (506, 102, N'C', 13, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (507, 102, N'C', 14, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (508, 102, N'C', 15, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (509, 102, N'C', 16, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (510, 102, N'C', 17, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (511, 102, N'C', 18, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (512, 102, N'C', 19, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (513, 102, N'C', 20, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (514, 102, N'D', 1, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (515, 102, N'D', 2, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (516, 102, N'D', 3, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (517, 102, N'D', 4, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (518, 102, N'D', 5, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (519, 102, N'D', 6, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (520, 102, N'D', 7, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (521, 102, N'D', 8, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (522, 102, N'D', 9, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (523, 102, N'D', 10, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (524, 102, N'D', 11, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (525, 102, N'D', 12, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (526, 102, N'D', 13, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (527, 102, N'D', 14, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (528, 102, N'D', 15, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (529, 102, N'D', 16, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (530, 102, N'D', 17, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (531, 102, N'D', 18, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (532, 102, N'D', 19, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (533, 102, N'D', 20, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (534, 102, N'A', 1, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (535, 102, N'A', 2, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (536, 102, N'A', 3, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (537, 102, N'A', 4, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (538, 102, N'A', 5, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (539, 102, N'A', 6, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (540, 102, N'A', 7, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (541, 102, N'A', 8, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (542, 102, N'A', 9, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (543, 102, N'A', 10, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (544, 102, N'B', 1, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (545, 102, N'B', 2, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (546, 102, N'B', 3, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (547, 102, N'B', 4, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (548, 102, N'B', 5, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (549, 102, N'B', 6, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (550, 102, N'B', 7, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (551, 102, N'B', 8, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (552, 102, N'B', 9, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (553, 102, N'B', 10, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (554, 115, N'A', 1, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (555, 115, N'A', 2, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (556, 115, N'A', 3, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (557, 115, N'A', 4, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (558, 115, N'A', 5, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (559, 115, N'A', 6, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (560, 115, N'A', 7, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (561, 115, N'A', 8, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (562, 115, N'A', 9, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (563, 115, N'A', 10, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (564, 115, N'A', 11, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (565, 115, N'A', 12, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (566, 115, N'A', 13, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (567, 115, N'A', 14, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (568, 115, N'A', 15, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (569, 115, N'A', 16, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (570, 115, N'B', 1, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (571, 115, N'B', 2, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (572, 115, N'B', 3, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (573, 115, N'B', 4, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (574, 115, N'B', 5, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (575, 115, N'B', 6, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (576, 115, N'B', 7, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (577, 115, N'B', 8, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (578, 115, N'B', 9, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (579, 115, N'B', 10, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (580, 115, N'B', 11, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (581, 115, N'B', 12, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (582, 115, N'B', 13, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (583, 115, N'B', 14, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (584, 115, N'B', 15, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (585, 115, N'B', 16, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (586, 115, N'C', 1, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (587, 115, N'C', 2, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (588, 115, N'C', 3, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (589, 115, N'C', 4, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (590, 115, N'C', 5, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (591, 115, N'C', 6, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (592, 115, N'C', 7, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (593, 115, N'C', 8, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (594, 115, N'C', 9, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (595, 115, N'C', 10, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (596, 115, N'C', 11, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (597, 115, N'C', 12, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (598, 115, N'C', 13, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (599, 115, N'C', 14, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (600, 115, N'C', 15, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (601, 115, N'C', 16, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (602, 115, N'D', 1, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (603, 115, N'D', 2, 200, 3, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (604, 115, N'D', 3, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (605, 115, N'D', 4, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (606, 115, N'D', 5, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (607, 115, N'D', 6, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (608, 115, N'D', 7, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (609, 115, N'D', 8, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (610, 115, N'D', 9, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (611, 115, N'D', 10, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (612, 115, N'D', 11, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (613, 115, N'D', 12, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (614, 115, N'D', 13, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (615, 115, N'D', 14, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (616, 115, N'D', 15, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (617, 115, N'D', 16, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (618, 115, N'E', 1, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (619, 115, N'E', 2, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (620, 115, N'E', 3, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (621, 115, N'E', 4, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (622, 115, N'E', 5, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (623, 115, N'E', 6, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (624, 115, N'E', 7, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (625, 115, N'E', 8, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (626, 115, N'E', 9, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (627, 115, N'E', 10, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (628, 115, N'E', 11, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (629, 115, N'E', 12, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (630, 115, N'E', 13, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (631, 115, N'E', 14, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (632, 115, N'E', 15, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (633, 115, N'E', 16, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (634, 115, N'F', 1, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (635, 115, N'F', 2, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (636, 115, N'F', 3, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (637, 115, N'F', 4, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (638, 115, N'F', 5, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (639, 115, N'F', 6, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (640, 115, N'F', 7, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (641, 115, N'F', 8, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (642, 115, N'F', 9, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (643, 115, N'F', 10, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (644, 115, N'F', 11, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (645, 115, N'F', 12, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (646, 115, N'F', 13, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (647, 115, N'F', 14, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (648, 115, N'F', 15, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (649, 115, N'F', 16, 200, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (650, 115, N'A', 1, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (651, 115, N'A', 2, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (652, 115, N'A', 3, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (653, 115, N'A', 4, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (654, 115, N'A', 5, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (655, 115, N'A', 6, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (656, 115, N'A', 7, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (657, 115, N'A', 8, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (658, 115, N'B', 1, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (659, 115, N'B', 2, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (660, 115, N'B', 3, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (661, 115, N'B', 4, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (662, 115, N'B', 5, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (663, 115, N'B', 6, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (664, 115, N'B', 7, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (665, 115, N'B', 8, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (666, 115, N'C', 1, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (667, 115, N'C', 2, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (668, 115, N'C', 3, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (669, 115, N'C', 4, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (670, 115, N'C', 5, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (671, 115, N'C', 6, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (672, 115, N'C', 7, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (673, 115, N'C', 8, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (674, 115, N'D', 1, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (675, 115, N'D', 2, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (676, 115, N'D', 3, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (677, 115, N'D', 4, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (678, 115, N'D', 5, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (679, 115, N'D', 6, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (680, 115, N'D', 7, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (681, 115, N'D', 8, 240, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (682, 116, N'A', 1, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (683, 116, N'A', 2, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (684, 116, N'A', 3, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (685, 116, N'A', 4, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (686, 116, N'A', 5, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (687, 116, N'A', 6, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (688, 116, N'A', 7, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (689, 116, N'A', 8, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (690, 116, N'A', 9, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (691, 116, N'A', 10, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (692, 116, N'A', 11, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (693, 116, N'A', 12, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (694, 116, N'A', 13, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (695, 116, N'A', 14, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (696, 116, N'A', 15, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (697, 116, N'A', 16, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (698, 116, N'A', 17, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (699, 116, N'A', 18, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (700, 116, N'A', 19, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (701, 116, N'A', 20, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (702, 116, N'A', 21, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (703, 116, N'A', 22, 110, 1, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (704, 116, N'A', 23, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (705, 116, N'A', 24, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (706, 116, N'A', 25, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (707, 116, N'A', 26, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (708, 116, N'A', 27, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (709, 116, N'A', 28, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (710, 116, N'B', 1, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (711, 116, N'B', 2, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (712, 116, N'B', 3, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (713, 116, N'B', 4, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (714, 116, N'B', 5, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (715, 116, N'B', 6, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (716, 116, N'B', 7, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (717, 116, N'B', 8, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (718, 116, N'B', 9, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (719, 116, N'B', 10, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (720, 116, N'B', 11, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (721, 116, N'B', 12, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (722, 116, N'B', 13, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (723, 116, N'B', 14, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (724, 116, N'B', 15, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (725, 116, N'B', 16, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (726, 116, N'B', 17, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (727, 116, N'B', 18, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (728, 116, N'B', 19, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (729, 116, N'B', 20, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (730, 116, N'B', 21, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (731, 116, N'B', 22, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (732, 116, N'B', 23, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (733, 116, N'B', 24, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (734, 116, N'B', 25, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (735, 116, N'B', 26, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (736, 116, N'B', 27, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (737, 116, N'B', 28, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (738, 116, N'C', 1, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (739, 116, N'C', 2, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (740, 116, N'C', 3, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (741, 116, N'C', 4, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (742, 116, N'C', 5, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (743, 116, N'C', 6, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (744, 116, N'C', 7, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (745, 116, N'C', 8, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (746, 116, N'C', 9, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (747, 116, N'C', 10, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (748, 116, N'C', 11, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (749, 116, N'C', 12, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (750, 116, N'C', 13, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (751, 116, N'C', 14, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (752, 116, N'C', 15, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (753, 116, N'C', 16, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (754, 116, N'C', 17, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (755, 116, N'C', 18, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (756, 116, N'C', 19, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (757, 116, N'C', 20, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (758, 116, N'C', 21, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (759, 116, N'C', 22, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (760, 116, N'C', 23, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (761, 116, N'C', 24, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (762, 116, N'C', 25, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (763, 116, N'C', 26, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (764, 116, N'C', 27, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (765, 116, N'C', 28, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (766, 116, N'D', 1, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (767, 116, N'D', 2, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (768, 116, N'D', 3, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (769, 116, N'D', 4, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (770, 116, N'D', 5, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (771, 116, N'D', 6, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (772, 116, N'D', 7, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (773, 116, N'D', 8, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (774, 116, N'D', 9, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (775, 116, N'D', 10, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (776, 116, N'D', 11, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (777, 116, N'D', 12, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (778, 116, N'D', 13, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (779, 116, N'D', 14, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (780, 116, N'D', 15, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (781, 116, N'D', 16, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (782, 116, N'D', 17, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (783, 116, N'D', 18, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (784, 116, N'D', 19, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (785, 116, N'D', 20, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (786, 116, N'D', 21, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (787, 116, N'D', 22, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (788, 116, N'D', 23, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (789, 116, N'D', 24, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (790, 116, N'D', 25, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (791, 116, N'D', 26, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (792, 116, N'D', 27, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (793, 116, N'D', 28, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (794, 116, N'E', 1, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (795, 116, N'E', 2, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (796, 116, N'E', 3, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (797, 116, N'E', 4, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (798, 116, N'E', 5, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (799, 116, N'E', 6, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (800, 116, N'E', 7, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (801, 116, N'E', 8, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (802, 116, N'E', 9, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (803, 116, N'E', 10, 110, 1, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (804, 116, N'E', 11, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (805, 116, N'E', 12, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (806, 116, N'E', 13, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (807, 116, N'E', 14, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (808, 116, N'E', 15, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (809, 116, N'E', 16, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (810, 116, N'E', 17, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (811, 116, N'E', 18, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (812, 116, N'E', 19, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (813, 116, N'E', 20, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (814, 116, N'E', 21, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (815, 116, N'E', 22, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (816, 116, N'E', 23, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (817, 116, N'E', 24, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (818, 116, N'E', 25, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (819, 116, N'E', 26, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (820, 116, N'E', 27, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (821, 116, N'E', 28, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (822, 116, N'F', 1, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (823, 116, N'F', 2, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (824, 116, N'F', 3, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (825, 116, N'F', 4, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (826, 116, N'F', 5, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (827, 116, N'F', 6, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (828, 116, N'F', 7, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (829, 116, N'F', 8, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (830, 116, N'F', 9, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (831, 116, N'F', 10, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (832, 116, N'F', 11, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (833, 116, N'F', 12, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (834, 116, N'F', 13, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (835, 116, N'F', 14, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (836, 116, N'F', 15, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (837, 116, N'F', 16, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (838, 116, N'F', 17, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (839, 116, N'F', 18, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (840, 116, N'F', 19, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (841, 116, N'F', 20, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (842, 116, N'F', 21, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (843, 116, N'F', 22, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (844, 116, N'F', 23, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (845, 116, N'F', 24, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (846, 116, N'F', 25, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (847, 116, N'F', 26, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (848, 116, N'F', 27, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (849, 116, N'F', 28, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (850, 116, N'G', 1, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (851, 116, N'G', 2, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (852, 116, N'G', 3, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (853, 116, N'G', 4, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (854, 116, N'G', 5, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (855, 116, N'G', 6, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (856, 116, N'G', 7, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (857, 116, N'G', 8, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (858, 116, N'G', 9, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (859, 116, N'G', 10, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (860, 116, N'G', 11, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (861, 116, N'G', 12, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (862, 116, N'G', 13, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (863, 116, N'G', 14, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (864, 116, N'G', 15, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (865, 116, N'G', 16, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (866, 116, N'G', 17, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (867, 116, N'G', 18, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (868, 116, N'G', 19, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (869, 116, N'G', 20, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (870, 116, N'G', 21, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (871, 116, N'G', 22, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (872, 116, N'G', 23, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (873, 116, N'G', 24, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (874, 116, N'G', 25, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (875, 116, N'G', 26, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (876, 116, N'G', 27, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (877, 116, N'G', 28, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (878, 116, N'H', 1, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (879, 116, N'H', 2, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (880, 116, N'H', 3, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (881, 116, N'H', 4, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (882, 116, N'H', 5, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (883, 116, N'H', 6, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (884, 116, N'H', 7, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (885, 116, N'H', 8, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (886, 116, N'H', 9, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (887, 116, N'H', 10, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (888, 116, N'H', 11, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (889, 116, N'H', 12, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (890, 116, N'H', 13, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (891, 116, N'H', 14, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (892, 116, N'H', 15, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (893, 116, N'H', 16, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (894, 116, N'H', 17, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (895, 116, N'H', 18, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (896, 116, N'H', 19, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (897, 116, N'H', 20, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (898, 116, N'H', 21, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (899, 116, N'H', 22, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (900, 116, N'H', 23, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (901, 116, N'H', 24, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (902, 116, N'H', 25, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (903, 116, N'H', 26, 110, 1, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (904, 116, N'H', 27, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (905, 116, N'H', 28, 110, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (906, 116, N'A', 1, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (907, 116, N'A', 2, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (908, 116, N'A', 3, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (909, 116, N'A', 4, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (910, 116, N'A', 5, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (911, 116, N'A', 6, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (912, 116, N'A', 7, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (913, 116, N'A', 8, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (914, 116, N'A', 9, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (915, 116, N'A', 10, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (916, 116, N'A', 11, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (917, 116, N'A', 12, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (918, 116, N'A', 13, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (919, 116, N'A', 14, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (920, 116, N'A', 15, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (921, 116, N'A', 16, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (922, 116, N'A', 17, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (923, 116, N'A', 18, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (924, 116, N'A', 19, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (925, 116, N'A', 20, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (926, 116, N'A', 21, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (927, 116, N'A', 22, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (928, 116, N'A', 23, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (929, 116, N'A', 24, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (930, 116, N'A', 25, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (931, 116, N'A', 26, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (932, 116, N'B', 1, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (933, 116, N'B', 2, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (934, 116, N'B', 3, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (935, 116, N'B', 4, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (936, 116, N'B', 5, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (937, 116, N'B', 6, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (938, 116, N'B', 7, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (939, 116, N'B', 8, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (940, 116, N'B', 9, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (941, 116, N'B', 10, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (942, 116, N'B', 11, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (943, 116, N'B', 12, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (944, 116, N'B', 13, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (945, 116, N'B', 14, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (946, 116, N'B', 15, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (947, 116, N'B', 16, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (948, 116, N'B', 17, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (949, 116, N'B', 18, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (950, 116, N'B', 19, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (951, 116, N'B', 20, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (952, 116, N'B', 21, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (953, 116, N'B', 22, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (954, 116, N'B', 23, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (955, 116, N'B', 24, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (956, 116, N'B', 25, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (957, 116, N'B', 26, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (958, 116, N'C', 1, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (959, 116, N'C', 2, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (960, 116, N'C', 3, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (961, 116, N'C', 4, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (962, 116, N'C', 5, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (963, 116, N'C', 6, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (964, 116, N'C', 7, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (965, 116, N'C', 8, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (966, 116, N'C', 9, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (967, 116, N'C', 10, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (968, 116, N'C', 11, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (969, 116, N'C', 12, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (970, 116, N'C', 13, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (971, 116, N'C', 14, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (972, 116, N'C', 15, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (973, 116, N'C', 16, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (974, 116, N'C', 17, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (975, 116, N'C', 18, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (976, 116, N'C', 19, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (977, 116, N'C', 20, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (978, 116, N'C', 21, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (979, 116, N'C', 22, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (980, 116, N'C', 23, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (981, 116, N'C', 24, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (982, 116, N'C', 25, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (983, 116, N'C', 26, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (984, 116, N'D', 1, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (985, 116, N'D', 2, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (986, 116, N'D', 3, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (987, 116, N'D', 4, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (988, 116, N'D', 5, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (989, 116, N'D', 6, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (990, 116, N'D', 7, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (991, 116, N'D', 8, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (992, 116, N'D', 9, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (993, 116, N'D', 10, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (994, 116, N'D', 11, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (995, 116, N'D', 12, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (996, 116, N'D', 13, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (997, 116, N'D', 14, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (998, 116, N'D', 15, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (999, 116, N'D', 16, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1000, 116, N'D', 17, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1001, 116, N'D', 18, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1002, 116, N'D', 19, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1003, 116, N'D', 20, 110, 2, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1004, 116, N'D', 21, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1005, 116, N'D', 22, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1006, 116, N'D', 23, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1007, 116, N'D', 24, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1008, 116, N'D', 25, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1009, 116, N'D', 26, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1010, 116, N'E', 1, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1011, 116, N'E', 2, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1012, 116, N'E', 3, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1013, 116, N'E', 4, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1014, 116, N'E', 5, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1015, 116, N'E', 6, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1016, 116, N'E', 7, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1017, 116, N'E', 8, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1018, 116, N'E', 9, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1019, 116, N'E', 10, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1020, 116, N'E', 11, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1021, 116, N'E', 12, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1022, 116, N'E', 13, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1023, 116, N'E', 14, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1024, 116, N'E', 15, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1025, 116, N'E', 16, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1026, 116, N'E', 17, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1027, 116, N'E', 18, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1028, 116, N'E', 19, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1029, 116, N'E', 20, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1030, 116, N'E', 21, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1031, 116, N'E', 22, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1032, 116, N'E', 23, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1033, 116, N'E', 24, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1034, 116, N'E', 25, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1035, 116, N'E', 26, 110, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1036, 116, N'A', 1, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1037, 116, N'A', 2, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1038, 116, N'A', 3, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1039, 116, N'A', 4, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1040, 116, N'A', 5, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1041, 116, N'A', 6, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1042, 116, N'A', 7, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1043, 116, N'A', 8, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1044, 116, N'A', 9, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1045, 116, N'A', 10, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1046, 116, N'A', 11, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1047, 116, N'A', 12, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1048, 116, N'A', 13, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1049, 116, N'A', 14, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1050, 116, N'A', 15, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1051, 116, N'A', 16, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1052, 116, N'B', 1, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1053, 116, N'B', 2, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1054, 116, N'B', 3, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1055, 116, N'B', 4, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1056, 116, N'B', 5, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1057, 116, N'B', 6, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1058, 116, N'B', 7, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1059, 116, N'B', 8, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1060, 116, N'B', 9, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1061, 116, N'B', 10, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1062, 116, N'B', 11, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1063, 116, N'B', 12, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1064, 116, N'B', 13, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1065, 116, N'B', 14, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1066, 116, N'B', 15, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1067, 116, N'B', 16, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1068, 116, N'C', 1, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1069, 116, N'C', 2, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1070, 116, N'C', 3, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1071, 116, N'C', 4, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1072, 116, N'C', 5, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1073, 116, N'C', 6, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1074, 116, N'C', 7, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1075, 116, N'C', 8, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1076, 116, N'C', 9, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1077, 116, N'C', 10, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1078, 116, N'C', 11, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1079, 116, N'C', 12, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1080, 116, N'C', 13, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1081, 116, N'C', 14, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1082, 116, N'C', 15, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1083, 116, N'C', 16, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1084, 116, N'D', 1, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1085, 116, N'D', 2, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1086, 116, N'D', 3, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1087, 116, N'D', 4, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1088, 116, N'D', 5, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1089, 116, N'D', 6, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1090, 116, N'D', 7, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1091, 116, N'D', 8, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1092, 116, N'D', 9, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1093, 116, N'D', 10, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1094, 116, N'D', 11, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1095, 116, N'D', 12, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1096, 116, N'D', 13, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1097, 116, N'D', 14, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1098, 116, N'D', 15, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1099, 116, N'D', 16, 130, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1100, 116, N'A', 1, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1101, 116, N'A', 2, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1102, 116, N'A', 3, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1103, 116, N'A', 4, 150, 4, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1104, 116, N'A', 5, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1105, 116, N'A', 6, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1106, 116, N'A', 7, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1107, 116, N'A', 8, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1108, 116, N'B', 1, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1109, 116, N'B', 2, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1110, 116, N'B', 3, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1111, 116, N'B', 4, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1112, 116, N'B', 5, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1113, 116, N'B', 6, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1114, 116, N'B', 7, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1115, 116, N'B', 8, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1116, 116, N'C', 1, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1117, 116, N'C', 2, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1118, 116, N'C', 3, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1119, 116, N'C', 4, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1120, 116, N'C', 5, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1121, 116, N'C', 6, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1122, 116, N'C', 7, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1123, 116, N'C', 8, 150, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1124, 111, N'A', 1, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1125, 111, N'A', 2, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1126, 111, N'A', 3, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1127, 111, N'A', 4, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1128, 111, N'A', 5, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1129, 111, N'A', 6, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1130, 111, N'A', 7, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1131, 111, N'A', 8, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1132, 111, N'A', 9, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1133, 111, N'A', 10, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1134, 111, N'A', 11, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1135, 111, N'A', 12, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1136, 111, N'A', 13, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1137, 111, N'A', 14, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1138, 111, N'A', 15, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1139, 111, N'A', 16, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1140, 111, N'A', 17, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1141, 111, N'A', 18, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1142, 111, N'A', 19, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1143, 111, N'A', 20, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1144, 111, N'A', 21, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1145, 111, N'A', 22, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1146, 111, N'A', 23, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1147, 111, N'A', 24, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1148, 111, N'B', 1, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1149, 111, N'B', 2, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1150, 111, N'B', 3, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1151, 111, N'B', 4, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1152, 111, N'B', 5, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1153, 111, N'B', 6, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1154, 111, N'B', 7, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1155, 111, N'B', 8, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1156, 111, N'B', 9, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1157, 111, N'B', 10, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1158, 111, N'B', 11, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1159, 111, N'B', 12, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1160, 111, N'B', 13, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1161, 111, N'B', 14, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1162, 111, N'B', 15, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1163, 111, N'B', 16, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1164, 111, N'B', 17, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1165, 111, N'B', 18, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1166, 111, N'B', 19, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1167, 111, N'B', 20, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1168, 111, N'B', 21, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1169, 111, N'B', 22, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1170, 111, N'B', 23, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1171, 111, N'B', 24, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1172, 111, N'C', 1, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1173, 111, N'C', 2, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1174, 111, N'C', 3, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1175, 111, N'C', 4, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1176, 111, N'C', 5, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1177, 111, N'C', 6, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1178, 111, N'C', 7, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1179, 111, N'C', 8, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1180, 111, N'C', 9, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1181, 111, N'C', 10, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1182, 111, N'C', 11, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1183, 111, N'C', 12, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1184, 111, N'C', 13, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1185, 111, N'C', 14, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1186, 111, N'C', 15, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1187, 111, N'C', 16, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1188, 111, N'C', 17, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1189, 111, N'C', 18, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1190, 111, N'C', 19, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1191, 111, N'C', 20, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1192, 111, N'C', 21, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1193, 111, N'C', 22, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1194, 111, N'C', 23, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1195, 111, N'C', 24, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1196, 111, N'D', 1, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1197, 111, N'D', 2, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1198, 111, N'D', 3, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1199, 111, N'D', 4, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1200, 111, N'D', 5, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1201, 111, N'D', 6, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1202, 111, N'D', 7, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1203, 111, N'D', 8, 210, 1, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1204, 111, N'D', 9, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1205, 111, N'D', 10, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1206, 111, N'D', 11, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1207, 111, N'D', 12, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1208, 111, N'D', 13, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1209, 111, N'D', 14, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1210, 111, N'D', 15, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1211, 111, N'D', 16, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1212, 111, N'D', 17, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1213, 111, N'D', 18, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1214, 111, N'D', 19, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1215, 111, N'D', 20, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1216, 111, N'D', 21, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1217, 111, N'D', 22, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1218, 111, N'D', 23, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1219, 111, N'D', 24, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1220, 111, N'E', 1, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1221, 111, N'E', 2, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1222, 111, N'E', 3, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1223, 111, N'E', 4, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1224, 111, N'E', 5, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1225, 111, N'E', 6, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1226, 111, N'E', 7, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1227, 111, N'E', 8, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1228, 111, N'E', 9, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1229, 111, N'E', 10, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1230, 111, N'E', 11, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1231, 111, N'E', 12, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1232, 111, N'E', 13, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1233, 111, N'E', 14, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1234, 111, N'E', 15, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1235, 111, N'E', 16, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1236, 111, N'E', 17, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1237, 111, N'E', 18, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1238, 111, N'E', 19, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1239, 111, N'E', 20, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1240, 111, N'E', 21, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1241, 111, N'E', 22, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1242, 111, N'E', 23, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1243, 111, N'E', 24, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1244, 111, N'F', 1, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1245, 111, N'F', 2, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1246, 111, N'F', 3, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1247, 111, N'F', 4, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1248, 111, N'F', 5, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1249, 111, N'F', 6, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1250, 111, N'F', 7, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1251, 111, N'F', 8, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1252, 111, N'F', 9, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1253, 111, N'F', 10, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1254, 111, N'F', 11, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1255, 111, N'F', 12, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1256, 111, N'F', 13, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1257, 111, N'F', 14, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1258, 111, N'F', 15, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1259, 111, N'F', 16, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1260, 111, N'F', 17, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1261, 111, N'F', 18, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1262, 111, N'F', 19, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1263, 111, N'F', 20, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1264, 111, N'F', 21, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1265, 111, N'F', 22, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1266, 111, N'F', 23, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1267, 111, N'F', 24, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1268, 111, N'G', 1, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1269, 111, N'G', 2, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1270, 111, N'G', 3, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1271, 111, N'G', 4, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1272, 111, N'G', 5, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1273, 111, N'G', 6, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1274, 111, N'G', 7, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1275, 111, N'G', 8, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1276, 111, N'G', 9, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1277, 111, N'G', 10, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1278, 111, N'G', 11, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1279, 111, N'G', 12, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1280, 111, N'G', 13, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1281, 111, N'G', 14, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1282, 111, N'G', 15, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1283, 111, N'G', 16, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1284, 111, N'G', 17, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1285, 111, N'G', 18, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1286, 111, N'G', 19, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1287, 111, N'G', 20, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1288, 111, N'G', 21, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1289, 111, N'G', 22, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1290, 111, N'G', 23, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1291, 111, N'G', 24, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1292, 111, N'H', 1, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1293, 111, N'H', 2, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1294, 111, N'H', 3, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1295, 111, N'H', 4, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1296, 111, N'H', 5, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1297, 111, N'H', 6, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1298, 111, N'H', 7, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1299, 111, N'H', 8, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1300, 111, N'H', 9, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1301, 111, N'H', 10, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1302, 111, N'H', 11, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1303, 111, N'H', 12, 210, 1, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1304, 111, N'H', 13, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1305, 111, N'H', 14, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1306, 111, N'H', 15, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1307, 111, N'H', 16, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1308, 111, N'H', 17, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1309, 111, N'H', 18, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1310, 111, N'H', 19, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1311, 111, N'H', 20, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1312, 111, N'H', 21, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1313, 111, N'H', 22, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1314, 111, N'H', 23, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1315, 111, N'H', 24, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1316, 111, N'I', 1, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1317, 111, N'I', 2, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1318, 111, N'I', 3, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1319, 111, N'I', 4, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1320, 111, N'I', 5, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1321, 111, N'I', 6, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1322, 111, N'I', 7, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1323, 111, N'I', 8, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1324, 111, N'I', 9, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1325, 111, N'I', 10, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1326, 111, N'I', 11, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1327, 111, N'I', 12, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1328, 111, N'I', 13, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1329, 111, N'I', 14, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1330, 111, N'I', 15, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1331, 111, N'I', 16, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1332, 111, N'I', 17, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1333, 111, N'I', 18, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1334, 111, N'I', 19, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1335, 111, N'I', 20, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1336, 111, N'I', 21, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1337, 111, N'I', 22, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1338, 111, N'I', 23, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1339, 111, N'I', 24, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1340, 111, N'J', 1, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1341, 111, N'J', 2, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1342, 111, N'J', 3, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1343, 111, N'J', 4, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1344, 111, N'J', 5, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1345, 111, N'J', 6, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1346, 111, N'J', 7, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1347, 111, N'J', 8, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1348, 111, N'J', 9, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1349, 111, N'J', 10, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1350, 111, N'J', 11, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1351, 111, N'J', 12, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1352, 111, N'J', 13, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1353, 111, N'J', 14, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1354, 111, N'J', 15, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1355, 111, N'J', 16, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1356, 111, N'J', 17, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1357, 111, N'J', 18, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1358, 111, N'J', 19, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1359, 111, N'J', 20, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1360, 111, N'J', 21, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1361, 111, N'J', 22, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1362, 111, N'J', 23, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1363, 111, N'J', 24, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1364, 111, N'K', 1, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1365, 111, N'K', 2, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1366, 111, N'K', 3, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1367, 111, N'K', 4, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1368, 111, N'K', 5, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1369, 111, N'K', 6, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1370, 111, N'K', 7, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1371, 111, N'K', 8, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1372, 111, N'K', 9, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1373, 111, N'K', 10, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1374, 111, N'K', 11, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1375, 111, N'K', 12, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1376, 111, N'K', 13, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1377, 111, N'K', 14, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1378, 111, N'K', 15, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1379, 111, N'K', 16, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1380, 111, N'K', 17, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1381, 111, N'K', 18, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1382, 111, N'K', 19, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1383, 111, N'K', 20, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1384, 111, N'K', 21, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1385, 111, N'K', 22, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1386, 111, N'K', 23, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1387, 111, N'K', 24, 210, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1388, 111, N'A', 1, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1389, 111, N'A', 2, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1390, 111, N'A', 3, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1391, 111, N'A', 4, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1392, 111, N'A', 5, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1393, 111, N'A', 6, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1394, 111, N'A', 7, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1395, 111, N'A', 8, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1396, 111, N'A', 9, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1397, 111, N'A', 10, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1398, 111, N'A', 11, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1399, 111, N'A', 12, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1400, 111, N'A', 13, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1401, 111, N'A', 14, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1402, 111, N'A', 15, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1403, 111, N'A', 16, 220, 2, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1404, 111, N'A', 17, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1405, 111, N'A', 18, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1406, 111, N'A', 19, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1407, 111, N'A', 20, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1408, 111, N'A', 21, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1409, 111, N'A', 22, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1410, 111, N'A', 23, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1411, 111, N'A', 24, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1412, 111, N'A', 25, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1413, 111, N'B', 1, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1414, 111, N'B', 2, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1415, 111, N'B', 3, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1416, 111, N'B', 4, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1417, 111, N'B', 5, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1418, 111, N'B', 6, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1419, 111, N'B', 7, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1420, 111, N'B', 8, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1421, 111, N'B', 9, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1422, 111, N'B', 10, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1423, 111, N'B', 11, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1424, 111, N'B', 12, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1425, 111, N'B', 13, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1426, 111, N'B', 14, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1427, 111, N'B', 15, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1428, 111, N'B', 16, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1429, 111, N'B', 17, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1430, 111, N'B', 18, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1431, 111, N'B', 19, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1432, 111, N'B', 20, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1433, 111, N'B', 21, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1434, 111, N'B', 22, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1435, 111, N'B', 23, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1436, 111, N'B', 24, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1437, 111, N'B', 25, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1438, 111, N'C', 1, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1439, 111, N'C', 2, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1440, 111, N'C', 3, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1441, 111, N'C', 4, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1442, 111, N'C', 5, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1443, 111, N'C', 6, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1444, 111, N'C', 7, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1445, 111, N'C', 8, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1446, 111, N'C', 9, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1447, 111, N'C', 10, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1448, 111, N'C', 11, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1449, 111, N'C', 12, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1450, 111, N'C', 13, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1451, 111, N'C', 14, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1452, 111, N'C', 15, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1453, 111, N'C', 16, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1454, 111, N'C', 17, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1455, 111, N'C', 18, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1456, 111, N'C', 19, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1457, 111, N'C', 20, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1458, 111, N'C', 21, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1459, 111, N'C', 22, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1460, 111, N'C', 23, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1461, 111, N'C', 24, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1462, 111, N'C', 25, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1463, 111, N'D', 1, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1464, 111, N'D', 2, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1465, 111, N'D', 3, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1466, 111, N'D', 4, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1467, 111, N'D', 5, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1468, 111, N'D', 6, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1469, 111, N'D', 7, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1470, 111, N'D', 8, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1471, 111, N'D', 9, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1472, 111, N'D', 10, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1473, 111, N'D', 11, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1474, 111, N'D', 12, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1475, 111, N'D', 13, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1476, 111, N'D', 14, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1477, 111, N'D', 15, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1478, 111, N'D', 16, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1479, 111, N'D', 17, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1480, 111, N'D', 18, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1481, 111, N'D', 19, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1482, 111, N'D', 20, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1483, 111, N'D', 21, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1484, 111, N'D', 22, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1485, 111, N'D', 23, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1486, 111, N'D', 24, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1487, 111, N'D', 25, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1488, 111, N'E', 1, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1489, 111, N'E', 2, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1490, 111, N'E', 3, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1491, 111, N'E', 4, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1492, 111, N'E', 5, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1493, 111, N'E', 6, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1494, 111, N'E', 7, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1495, 111, N'E', 8, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1496, 111, N'E', 9, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1497, 111, N'E', 10, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1498, 111, N'E', 11, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1499, 111, N'E', 12, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1500, 111, N'E', 13, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1501, 111, N'E', 14, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1502, 111, N'E', 15, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1503, 111, N'E', 16, 220, 2, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1504, 111, N'E', 17, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1505, 111, N'E', 18, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1506, 111, N'E', 19, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1507, 111, N'E', 20, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1508, 111, N'E', 21, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1509, 111, N'E', 22, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1510, 111, N'E', 23, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1511, 111, N'E', 24, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1512, 111, N'E', 25, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1513, 111, N'F', 1, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1514, 111, N'F', 2, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1515, 111, N'F', 3, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1516, 111, N'F', 4, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1517, 111, N'F', 5, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1518, 111, N'F', 6, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1519, 111, N'F', 7, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1520, 111, N'F', 8, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1521, 111, N'F', 9, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1522, 111, N'F', 10, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1523, 111, N'F', 11, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1524, 111, N'F', 12, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1525, 111, N'F', 13, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1526, 111, N'F', 14, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1527, 111, N'F', 15, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1528, 111, N'F', 16, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1529, 111, N'F', 17, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1530, 111, N'F', 18, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1531, 111, N'F', 19, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1532, 111, N'F', 20, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1533, 111, N'F', 21, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1534, 111, N'F', 22, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1535, 111, N'F', 23, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1536, 111, N'F', 24, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1537, 111, N'F', 25, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1538, 111, N'G', 1, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1539, 111, N'G', 2, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1540, 111, N'G', 3, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1541, 111, N'G', 4, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1542, 111, N'G', 5, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1543, 111, N'G', 6, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1544, 111, N'G', 7, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1545, 111, N'G', 8, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1546, 111, N'G', 9, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1547, 111, N'G', 10, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1548, 111, N'G', 11, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1549, 111, N'G', 12, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1550, 111, N'G', 13, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1551, 111, N'G', 14, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1552, 111, N'G', 15, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1553, 111, N'G', 16, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1554, 111, N'G', 17, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1555, 111, N'G', 18, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1556, 111, N'G', 19, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1557, 111, N'G', 20, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1558, 111, N'G', 21, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1559, 111, N'G', 22, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1560, 111, N'G', 23, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1561, 111, N'G', 24, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1562, 111, N'G', 25, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1563, 111, N'H', 1, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1564, 111, N'H', 2, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1565, 111, N'H', 3, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1566, 111, N'H', 4, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1567, 111, N'H', 5, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1568, 111, N'H', 6, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1569, 111, N'H', 7, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1570, 111, N'H', 8, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1571, 111, N'H', 9, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1572, 111, N'H', 10, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1573, 111, N'H', 11, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1574, 111, N'H', 12, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1575, 111, N'H', 13, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1576, 111, N'H', 14, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1577, 111, N'H', 15, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1578, 111, N'H', 16, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1579, 111, N'H', 17, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1580, 111, N'H', 18, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1581, 111, N'H', 19, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1582, 111, N'H', 20, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1583, 111, N'H', 21, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1584, 111, N'H', 22, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1585, 111, N'H', 23, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1586, 111, N'H', 24, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1587, 111, N'H', 25, 220, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1588, 111, N'A', 1, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1589, 111, N'A', 2, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1590, 111, N'A', 3, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1591, 111, N'A', 4, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1592, 111, N'A', 5, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1593, 111, N'A', 6, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1594, 111, N'A', 7, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1595, 111, N'A', 8, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1596, 111, N'A', 9, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1597, 111, N'A', 10, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1598, 111, N'A', 11, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1599, 111, N'A', 12, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1600, 111, N'A', 13, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1601, 111, N'A', 14, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1602, 111, N'A', 15, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1603, 111, N'A', 16, 240, 3, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1604, 111, N'A', 17, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1605, 111, N'A', 18, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1606, 111, N'B', 1, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1607, 111, N'B', 2, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1608, 111, N'B', 3, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1609, 111, N'B', 4, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1610, 111, N'B', 5, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1611, 111, N'B', 6, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1612, 111, N'B', 7, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1613, 111, N'B', 8, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1614, 111, N'B', 9, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1615, 111, N'B', 10, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1616, 111, N'B', 11, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1617, 111, N'B', 12, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1618, 111, N'B', 13, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1619, 111, N'B', 14, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1620, 111, N'B', 15, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1621, 111, N'B', 16, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1622, 111, N'B', 17, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1623, 111, N'B', 18, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1624, 111, N'C', 1, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1625, 111, N'C', 2, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1626, 111, N'C', 3, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1627, 111, N'C', 4, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1628, 111, N'C', 5, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1629, 111, N'C', 6, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1630, 111, N'C', 7, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1631, 111, N'C', 8, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1632, 111, N'C', 9, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1633, 111, N'C', 10, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1634, 111, N'C', 11, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1635, 111, N'C', 12, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1636, 111, N'C', 13, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1637, 111, N'C', 14, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1638, 111, N'C', 15, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1639, 111, N'C', 16, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1640, 111, N'C', 17, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1641, 111, N'C', 18, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1642, 111, N'D', 1, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1643, 111, N'D', 2, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1644, 111, N'D', 3, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1645, 111, N'D', 4, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1646, 111, N'D', 5, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1647, 111, N'D', 6, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1648, 111, N'D', 7, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1649, 111, N'D', 8, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1650, 111, N'D', 9, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1651, 111, N'D', 10, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1652, 111, N'D', 11, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1653, 111, N'D', 12, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1654, 111, N'D', 13, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1655, 111, N'D', 14, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1656, 111, N'D', 15, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1657, 111, N'D', 16, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1658, 111, N'D', 17, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1659, 111, N'D', 18, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1660, 111, N'E', 1, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1661, 111, N'E', 2, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1662, 111, N'E', 3, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1663, 111, N'E', 4, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1664, 111, N'E', 5, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1665, 111, N'E', 6, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1666, 111, N'E', 7, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1667, 111, N'E', 8, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1668, 111, N'E', 9, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1669, 111, N'E', 10, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1670, 111, N'E', 11, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1671, 111, N'E', 12, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1672, 111, N'E', 13, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1673, 111, N'E', 14, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1674, 111, N'E', 15, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1675, 111, N'E', 16, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1676, 111, N'E', 17, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1677, 111, N'E', 18, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1678, 111, N'F', 1, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1679, 111, N'F', 2, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1680, 111, N'F', 3, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1681, 111, N'F', 4, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1682, 111, N'F', 5, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1683, 111, N'F', 6, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1684, 111, N'F', 7, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1685, 111, N'F', 8, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1686, 111, N'F', 9, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1687, 111, N'F', 10, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1688, 111, N'F', 11, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1689, 111, N'F', 12, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1690, 111, N'F', 13, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1691, 111, N'F', 14, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1692, 111, N'F', 15, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1693, 111, N'F', 16, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1694, 111, N'F', 17, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1695, 111, N'F', 18, 240, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1696, 112, N'A', 1, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1697, 112, N'A', 2, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1698, 112, N'A', 3, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1699, 112, N'A', 4, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1700, 112, N'A', 5, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1701, 112, N'A', 6, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1702, 112, N'A', 7, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1703, 112, N'A', 8, 130, 1, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1704, 112, N'A', 9, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1705, 112, N'A', 10, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1706, 112, N'A', 11, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1707, 112, N'A', 12, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1708, 112, N'A', 13, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1709, 112, N'A', 14, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1710, 112, N'A', 15, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1711, 112, N'A', 16, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1712, 112, N'B', 1, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1713, 112, N'B', 2, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1714, 112, N'B', 3, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1715, 112, N'B', 4, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1716, 112, N'B', 5, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1717, 112, N'B', 6, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1718, 112, N'B', 7, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1719, 112, N'B', 8, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1720, 112, N'B', 9, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1721, 112, N'B', 10, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1722, 112, N'B', 11, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1723, 112, N'B', 12, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1724, 112, N'B', 13, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1725, 112, N'B', 14, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1726, 112, N'B', 15, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1727, 112, N'B', 16, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1728, 112, N'C', 1, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1729, 112, N'C', 2, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1730, 112, N'C', 3, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1731, 112, N'C', 4, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1732, 112, N'C', 5, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1733, 112, N'C', 6, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1734, 112, N'C', 7, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1735, 112, N'C', 8, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1736, 112, N'C', 9, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1737, 112, N'C', 10, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1738, 112, N'C', 11, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1739, 112, N'C', 12, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1740, 112, N'C', 13, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1741, 112, N'C', 14, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1742, 112, N'C', 15, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1743, 112, N'C', 16, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1744, 112, N'D', 1, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1745, 112, N'D', 2, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1746, 112, N'D', 3, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1747, 112, N'D', 4, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1748, 112, N'D', 5, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1749, 112, N'D', 6, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1750, 112, N'D', 7, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1751, 112, N'D', 8, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1752, 112, N'D', 9, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1753, 112, N'D', 10, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1754, 112, N'D', 11, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1755, 112, N'D', 12, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1756, 112, N'D', 13, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1757, 112, N'D', 14, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1758, 112, N'D', 15, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1759, 112, N'D', 16, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1760, 112, N'E', 1, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1761, 112, N'E', 2, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1762, 112, N'E', 3, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1763, 112, N'E', 4, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1764, 112, N'E', 5, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1765, 112, N'E', 6, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1766, 112, N'E', 7, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1767, 112, N'E', 8, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1768, 112, N'E', 9, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1769, 112, N'E', 10, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1770, 112, N'E', 11, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1771, 112, N'E', 12, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1772, 112, N'E', 13, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1773, 112, N'E', 14, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1774, 112, N'E', 15, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1775, 112, N'E', 16, 130, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1776, 112, N'A', 1, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1777, 112, N'A', 2, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1778, 112, N'A', 3, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1779, 112, N'A', 4, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1780, 112, N'A', 5, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1781, 112, N'A', 6, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1782, 112, N'A', 7, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1783, 112, N'A', 8, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1784, 112, N'A', 9, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1785, 112, N'A', 10, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1786, 112, N'A', 11, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1787, 112, N'A', 12, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1788, 112, N'A', 13, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1789, 112, N'A', 14, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1790, 112, N'A', 15, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1791, 112, N'A', 16, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1792, 112, N'A', 17, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1793, 112, N'A', 18, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1794, 112, N'B', 1, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1795, 112, N'B', 2, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1796, 112, N'B', 3, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1797, 112, N'B', 4, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1798, 112, N'B', 5, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1799, 112, N'B', 6, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1800, 112, N'B', 7, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1801, 112, N'B', 8, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1802, 112, N'B', 9, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1803, 112, N'B', 10, 140, 2, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1804, 112, N'B', 11, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1805, 112, N'B', 12, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1806, 112, N'B', 13, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1807, 112, N'B', 14, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1808, 112, N'B', 15, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1809, 112, N'B', 16, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1810, 112, N'B', 17, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1811, 112, N'B', 18, 140, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1812, 106, N'A', 1, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1813, 106, N'A', 2, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1814, 106, N'A', 3, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1815, 106, N'A', 4, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1816, 106, N'A', 5, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1817, 106, N'A', 6, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1818, 106, N'A', 7, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1819, 106, N'A', 8, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1820, 106, N'A', 9, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1821, 106, N'A', 10, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1822, 106, N'A', 11, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1823, 106, N'A', 12, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1824, 106, N'A', 13, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1825, 106, N'A', 14, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1826, 106, N'A', 15, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1827, 106, N'A', 16, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1828, 106, N'A', 17, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1829, 106, N'A', 18, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1830, 106, N'A', 19, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1831, 106, N'A', 20, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1832, 106, N'A', 21, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1833, 106, N'B', 1, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1834, 106, N'B', 2, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1835, 106, N'B', 3, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1836, 106, N'B', 4, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1837, 106, N'B', 5, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1838, 106, N'B', 6, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1839, 106, N'B', 7, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1840, 106, N'B', 8, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1841, 106, N'B', 9, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1842, 106, N'B', 10, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1843, 106, N'B', 11, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1844, 106, N'B', 12, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1845, 106, N'B', 13, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1846, 106, N'B', 14, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1847, 106, N'B', 15, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1848, 106, N'B', 16, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1849, 106, N'B', 17, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1850, 106, N'B', 18, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1851, 106, N'B', 19, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1852, 106, N'B', 20, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1853, 106, N'B', 21, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1854, 106, N'C', 1, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1855, 106, N'C', 2, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1856, 106, N'C', 3, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1857, 106, N'C', 4, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1858, 106, N'C', 5, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1859, 106, N'C', 6, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1860, 106, N'C', 7, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1861, 106, N'C', 8, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1862, 106, N'C', 9, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1863, 106, N'C', 10, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1864, 106, N'C', 11, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1865, 106, N'C', 12, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1866, 106, N'C', 13, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1867, 106, N'C', 14, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1868, 106, N'C', 15, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1869, 106, N'C', 16, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1870, 106, N'C', 17, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1871, 106, N'C', 18, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1872, 106, N'C', 19, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1873, 106, N'C', 20, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1874, 106, N'C', 21, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1875, 106, N'D', 1, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1876, 106, N'D', 2, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1877, 106, N'D', 3, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1878, 106, N'D', 4, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1879, 106, N'D', 5, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1880, 106, N'D', 6, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1881, 106, N'D', 7, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1882, 106, N'D', 8, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1883, 106, N'D', 9, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1884, 106, N'D', 10, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1885, 106, N'D', 11, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1886, 106, N'D', 12, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1887, 106, N'D', 13, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1888, 106, N'D', 14, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1889, 106, N'D', 15, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1890, 106, N'D', 16, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1891, 106, N'D', 17, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1892, 106, N'D', 18, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1893, 106, N'D', 19, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1894, 106, N'D', 20, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1895, 106, N'D', 21, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1896, 106, N'E', 1, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1897, 106, N'E', 2, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1898, 106, N'E', 3, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1899, 106, N'E', 4, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1900, 106, N'E', 5, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1901, 106, N'E', 6, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1902, 106, N'E', 7, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1903, 106, N'E', 8, 150, 2, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1904, 106, N'E', 9, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1905, 106, N'E', 10, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1906, 106, N'E', 11, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1907, 106, N'E', 12, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1908, 106, N'E', 13, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1909, 106, N'E', 14, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1910, 106, N'E', 15, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1911, 106, N'E', 16, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1912, 106, N'E', 17, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1913, 106, N'E', 18, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1914, 106, N'E', 19, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1915, 106, N'E', 20, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1916, 106, N'E', 21, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1917, 106, N'F', 1, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1918, 106, N'F', 2, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1919, 106, N'F', 3, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1920, 106, N'F', 4, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1921, 106, N'F', 5, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1922, 106, N'F', 6, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1923, 106, N'F', 7, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1924, 106, N'F', 8, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1925, 106, N'F', 9, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1926, 106, N'F', 10, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1927, 106, N'F', 11, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1928, 106, N'F', 12, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1929, 106, N'F', 13, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1930, 106, N'F', 14, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1931, 106, N'F', 15, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1932, 106, N'F', 16, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1933, 106, N'F', 17, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1934, 106, N'F', 18, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1935, 106, N'F', 19, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1936, 106, N'F', 20, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1937, 106, N'F', 21, 150, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1938, 106, N'A', 1, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1939, 106, N'A', 2, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1940, 106, N'A', 3, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1941, 106, N'A', 4, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1942, 106, N'A', 5, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1943, 106, N'A', 6, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1944, 106, N'A', 7, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1945, 106, N'A', 8, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1946, 106, N'A', 9, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1947, 106, N'A', 10, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1948, 106, N'A', 11, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1949, 106, N'B', 1, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1950, 106, N'B', 2, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1951, 106, N'B', 3, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1952, 106, N'B', 4, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1953, 106, N'B', 5, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1954, 106, N'B', 6, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1955, 106, N'B', 7, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1956, 106, N'B', 8, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1957, 106, N'B', 9, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1958, 106, N'B', 10, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1959, 106, N'B', 11, 200, 4, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1960, 107, N'A', 1, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1961, 107, N'A', 2, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1962, 107, N'A', 3, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1963, 107, N'A', 4, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1964, 107, N'A', 5, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1965, 107, N'A', 6, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1966, 107, N'A', 7, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1967, 107, N'A', 8, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1968, 107, N'A', 9, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1969, 107, N'A', 10, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1970, 107, N'B', 1, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1971, 107, N'B', 2, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1972, 107, N'B', 3, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1973, 107, N'B', 4, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1974, 107, N'B', 5, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1975, 107, N'B', 6, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1976, 107, N'B', 7, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1977, 107, N'B', 8, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1978, 107, N'B', 9, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1979, 107, N'B', 10, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1980, 107, N'C', 1, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1981, 107, N'C', 2, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1982, 107, N'C', 3, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1983, 107, N'C', 4, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1984, 107, N'C', 5, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1985, 107, N'C', 6, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1986, 107, N'C', 7, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1987, 107, N'C', 8, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1988, 107, N'C', 9, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1989, 107, N'C', 10, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1990, 107, N'D', 1, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1991, 107, N'D', 2, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1992, 107, N'D', 3, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1993, 107, N'D', 4, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1994, 107, N'D', 5, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1995, 107, N'D', 6, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1996, 107, N'D', 7, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1997, 107, N'D', 8, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1998, 107, N'D', 9, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (1999, 107, N'D', 10, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2000, 107, N'E', 1, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2001, 107, N'E', 2, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2002, 107, N'E', 3, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2003, 107, N'E', 4, 190, 1, 1)
GO
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2004, 107, N'E', 5, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2005, 107, N'E', 6, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2006, 107, N'E', 7, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2007, 107, N'E', 8, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2008, 107, N'E', 9, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2009, 107, N'E', 10, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2010, 107, N'F', 1, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2011, 107, N'F', 2, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2012, 107, N'F', 3, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2013, 107, N'F', 4, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2014, 107, N'F', 5, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2015, 107, N'F', 6, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2016, 107, N'F', 7, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2017, 107, N'F', 8, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2018, 107, N'F', 9, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2019, 107, N'F', 10, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2020, 107, N'G', 1, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2021, 107, N'G', 2, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2022, 107, N'G', 3, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2023, 107, N'G', 4, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2024, 107, N'G', 5, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2025, 107, N'G', 6, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2026, 107, N'G', 7, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2027, 107, N'G', 8, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2028, 107, N'G', 9, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2029, 107, N'G', 10, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2030, 107, N'H', 1, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2031, 107, N'H', 2, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2032, 107, N'H', 3, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2033, 107, N'H', 4, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2034, 107, N'H', 5, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2035, 107, N'H', 6, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2036, 107, N'H', 7, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2037, 107, N'H', 8, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2038, 107, N'H', 9, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2039, 107, N'H', 10, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2040, 107, N'I', 1, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2041, 107, N'I', 2, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2042, 107, N'I', 3, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2043, 107, N'I', 4, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2044, 107, N'I', 5, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2045, 107, N'I', 6, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2046, 107, N'I', 7, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2047, 107, N'I', 8, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2048, 107, N'I', 9, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2049, 107, N'I', 10, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2050, 107, N'J', 1, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2051, 107, N'J', 2, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2052, 107, N'J', 3, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2053, 107, N'J', 4, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2054, 107, N'J', 5, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2055, 107, N'J', 6, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2056, 107, N'J', 7, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2057, 107, N'J', 8, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2058, 107, N'J', 9, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2059, 107, N'J', 10, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2060, 107, N'K', 1, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2061, 107, N'K', 2, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2062, 107, N'K', 3, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2063, 107, N'K', 4, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2064, 107, N'K', 5, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2065, 107, N'K', 6, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2066, 107, N'K', 7, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2067, 107, N'K', 8, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2068, 107, N'K', 9, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2069, 107, N'K', 10, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2070, 107, N'L', 1, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2071, 107, N'L', 2, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2072, 107, N'L', 3, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2073, 107, N'L', 4, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2074, 107, N'L', 5, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2075, 107, N'L', 6, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2076, 107, N'L', 7, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2077, 107, N'L', 8, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2078, 107, N'L', 9, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2079, 107, N'L', 10, 190, 1, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2080, 107, N'A', 1, 200, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2081, 107, N'A', 2, 200, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2082, 107, N'A', 3, 200, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2083, 107, N'B', 1, 200, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2084, 107, N'B', 2, 200, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2085, 107, N'B', 3, 200, 2, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2086, 107, N'A', 1, 220, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2087, 107, N'A', 2, 220, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2088, 107, N'A', 3, 220, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2089, 107, N'A', 4, 220, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2090, 107, N'A', 5, 220, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2091, 107, N'A', 6, 220, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2092, 107, N'A', 7, 220, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2093, 107, N'A', 8, 220, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2094, 107, N'A', 9, 220, 3, 1)
INSERT [dbo].[LAYOUT] ([ID], [ScreenID], [ROW], [COL], [BasePrice], [SeatTypeID], [Status]) VALUES (2095, 107, N'A', 10, 220, 3, 1)
SET IDENTITY_INSERT [dbo].[LAYOUT] OFF
GO
SET IDENTITY_INSERT [dbo].[MOVIE] ON 

INSERT [dbo].[MOVIE] ([ID], [Name], [Description], [Duration], [IMDB_Rating], [ReleaseDate], [PosterLink], [TrailerLink], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [Status]) VALUES (101, N'Bholaa', N'Bholaa is a 2023 Indian Hindi-language action-adventure film directed by Ajay Devgn and jointly produced by Ajay Devgn FFilms, Reliance Entertainment, T-Series Films and Dream Warrior Pictures. It is a remake of the 2019 Tamil film Kaithi and stars Devgn in the titular role alongside Tabu, Deepak Dobriyal, Sanjay Mishra, Gajraj Rao and Vineet Kumar while Amala Paul, Abhishek Bachchan and Raai Laxmi make special appearances. The film follows an ex-convict who battles criminals while transporting a truck full of poisoned cops to the hospital in exchange for meeting his daughter after ten years of imprisonment.', N'2 hr 24 min', CAST(7.0 AS Decimal(4, 1)), CAST(N'2023-06-09' AS Date), N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685613362/movie/posters/bholaa.jpg1685613362642.jpg', N'https://res.cloudinary.com/movie-booking-site/video/upload/v1685613360/movie/trailers/bholaa_trailer.mp41685613354104.mp4', CAST(N'2023-06-01T15:26:04.017' AS DateTime), CAST(N'2023-06-01T15:26:04.017' AS DateTime), 1002, 1002, 1)
INSERT [dbo].[MOVIE] ([ID], [Name], [Description], [Duration], [IMDB_Rating], [ReleaseDate], [PosterLink], [TrailerLink], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [Status]) VALUES (102, N'Adipurush', N'In Hinduism, Lord Ram is also addressed as Adi Purusha.Prabhas will be seen playing the role of Lord Rama and Saif Ali Khan will play the role of Lankesh, the demon King Ravan, in the film.', N'3 hr 36 min', CAST(6.3 AS Decimal(4, 1)), CAST(N'2023-06-16' AS Date), N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685615574/movie/posters/adipurush.jfif1685615574763.jpg', N'https://res.cloudinary.com/movie-booking-site/video/upload/v1685615573/movie/trailers/adipurush_trailer.mp41685615565185.mp4', CAST(N'2023-06-01T16:02:55.680' AS DateTime), CAST(N'2023-06-01T16:02:55.680' AS DateTime), 1002, 1002, 1)
INSERT [dbo].[MOVIE] ([ID], [Name], [Description], [Duration], [IMDB_Rating], [ReleaseDate], [PosterLink], [TrailerLink], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [Status]) VALUES (103, N'Bushirt T-shirt', N'In the world of the Pandyas, chaos is the norm and laughter is the solution to every problem! Just as the name suggests, `Bushirt T-shirt` highlights two diverse ideologies between parents and their children along with the drama and emotions that follow! In an unexpected series of events, the Pandyas navigate their way through comic twists and entertaining turns in their quest to overcome their differences.', N'2 hr 24 min', CAST(8.2 AS Decimal(4, 1)), CAST(N'2023-05-05' AS Date), N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685961840/movie/posters/bushirtTshirt.png1685961840686.png', N'https://res.cloudinary.com/movie-booking-site/video/upload/v1685961839/movie/trailers/Trailer_%20Bushirt%20T-shirt%20_%20Siddharth%20Randeria%20_%20Kamlesh%20Ozza%20_%20Vandana%20Pathak%20_%20In%20Cinemas%20Now.mp41685961823604.mp4', CAST(N'2023-06-05T16:14:01.530' AS DateTime), CAST(N'2023-06-05T16:14:01.530' AS DateTime), 1002, 1002, 1)
INSERT [dbo].[MOVIE] ([ID], [Name], [Description], [Duration], [IMDB_Rating], [ReleaseDate], [PosterLink], [TrailerLink], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [Status]) VALUES (104, N'Shubh Yatra', N'Shubh Yatra is a Gujarati movie starring Malhar Thakar, Monal Gajjar and Darshan Jariwala in the lead.', N'2 hr 12 min', CAST(7.7 AS Decimal(4, 1)), CAST(N'2023-04-28' AS Date), N'https://res.cloudinary.com/movie-booking-site/image/upload/v1685966580/movie/posters/shubh-yatra.webp1685966579959.webp', N'https://res.cloudinary.com/movie-booking-site/video/upload/v1685966578/movie/trailers/Shubh%20Yatra%20-%20%E0%AA%B6%E0%AB%81%E0%AA%AD%20%E0%AA%AF%E0%AA%BE%E0%AA%A4%E0%AB%8D%E0%AA%B0%E0%AA%BE%20_%20Trailer%20_%20Gujarati%20Movie%20_%20Malhar%20Thakar%20_%20Monal%20Gajjar%20_%20Manish%20Saini.mp41685966568970.mp4', CAST(N'2023-06-05T17:33:00.650' AS DateTime), CAST(N'2023-06-05T17:33:00.650' AS DateTime), 1002, 1002, 1)
INSERT [dbo].[MOVIE] ([ID], [Name], [Description], [Duration], [IMDB_Rating], [ReleaseDate], [PosterLink], [TrailerLink], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [Status]) VALUES (1102, N'I Wish', N'Two very distinct individuals, Isha and Vismay, fall head over heels for one other, but once they begin living together, they find it challenging to keep the passion alive while still dealing with the responsibilities of a relationship. Isha and Vismay both refuse to give up on their love and pursue very distinct and unique roads to save it. For each of them, the voyage leads to self-discovery, but will they be able to live with each other again? This musical story reveals this.', N'2 hr 9 min', CAST(7.2 AS Decimal(4, 1)), CAST(N'2023-06-02' AS Date), N'https://res.cloudinary.com/movie-booking-site/image/upload/v1686207704/movie/posters/IWish.jpg1686207704599.jpg', N'https://res.cloudinary.com/movie-booking-site/video/upload/v1686207703/movie/trailers/I%20Wish%20_%20Gujarati%20Film%20Trailer%20_%20Teeshay%20_%20M%20Monal%20Gajjar%20_%20Aarjav%20Trivedi%20_%20In%20Cinemas%202%20June%202023%20%281%29.mp41686207694048.mp4', CAST(N'2023-06-08T12:31:45.510' AS DateTime), CAST(N'2023-06-08T12:31:45.510' AS DateTime), 1002, 1002, 1)
INSERT [dbo].[MOVIE] ([ID], [Name], [Description], [Duration], [IMDB_Rating], [ReleaseDate], [PosterLink], [TrailerLink], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [Status]) VALUES (1103, N'The Flash', N'Worlds collide when Barry uses his superpowers to travel back in time in order to change the events of the past. But when his attempt to save his family inadvertently alters the future, Barry becomes trapped in a reality where General Zod has returned and there are no Super Heroes to turn to.', N'2 hr 24 min', CAST(9.3 AS Decimal(4, 1)), CAST(N'2023-06-15' AS Date), N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Posters/-8585144242570762106TheFlash.jpg', N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Trailers/-8585144242525641942The Flash – Official Trailer.mp4', CAST(N'2023-06-19T19:20:40.290' AS DateTime), CAST(N'2023-06-19T19:20:40.290' AS DateTime), 1002, 1002, 1)
INSERT [dbo].[MOVIE] ([ID], [Name], [Description], [Duration], [IMDB_Rating], [ReleaseDate], [PosterLink], [TrailerLink], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [Status]) VALUES (1105, N'Satyaprem Ki Katha', N'A young dreamer Satyaprem gets married to the woman he loves, Katha, but she`s holding on to a secret that`s not easy to let go of. What will happen when Sattu uncovers the truth?', N'2 hr 26 min', CAST(8.1 AS Decimal(4, 1)), CAST(N'2023-06-29' AS Date), N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Posters/-8585134978325931399satyaprem-ki-katha.jpg', N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Trailers/-8585134978293550966SatyaPrem Ki Katha_Official Trailer_Kartik_Kiara_Sameer V_Sajid Nadiadwala_ Namah Pictures_29th June.mp4', CAST(N'2023-06-30T12:42:40.470' AS DateTime), CAST(N'2023-06-30T12:42:40.470' AS DateTime), 1002, 1002, 1)
INSERT [dbo].[MOVIE] ([ID], [Name], [Description], [Duration], [IMDB_Rating], [ReleaseDate], [PosterLink], [TrailerLink], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [Status]) VALUES (1106, N'Indiana Jones and the Dial of Destiny', N'Daredevil archaeologist Indiana Jones races against time to retrieve a legendary dial that can change the course of history.', N'2 hr 36 min', CAST(8.6 AS Decimal(4, 1)), CAST(N'2023-06-29' AS Date), N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Posters/-8585134970290574791indiana-jones-and-the-dial-of-destiny.jpg', N'https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/Trailers/-8585134970263816153Indiana Jones and the Dial of Destiny _ Official Hindi Trailer _ In Cinemas June 30.mp4', CAST(N'2023-06-30T12:54:21.303' AS DateTime), CAST(N'2023-06-30T12:54:21.303' AS DateTime), 1002, 1002, 1)
SET IDENTITY_INSERT [dbo].[MOVIE] OFF
GO
SET IDENTITY_INSERT [dbo].[MOVIE_ROLE] ON 

INSERT [dbo].[MOVIE_ROLE] ([ID], [Name], [Status]) VALUES (1, N'Actor', 1)
INSERT [dbo].[MOVIE_ROLE] ([ID], [Name], [Status]) VALUES (2, N'Director', 1)
INSERT [dbo].[MOVIE_ROLE] ([ID], [Name], [Status]) VALUES (3, N'Producer', 1)
INSERT [dbo].[MOVIE_ROLE] ([ID], [Name], [Status]) VALUES (4, N'Writer', 1)
INSERT [dbo].[MOVIE_ROLE] ([ID], [Name], [Status]) VALUES (5, N'Voice Actor', 1)
INSERT [dbo].[MOVIE_ROLE] ([ID], [Name], [Status]) VALUES (6, N'Editor', 1)
INSERT [dbo].[MOVIE_ROLE] ([ID], [Name], [Status]) VALUES (7, N'Casting Director', 1)
INSERT [dbo].[MOVIE_ROLE] ([ID], [Name], [Status]) VALUES (8, N'Co Producer', 1)
INSERT [dbo].[MOVIE_ROLE] ([ID], [Name], [Status]) VALUES (9, N'Creative Director', 1)
INSERT [dbo].[MOVIE_ROLE] ([ID], [Name], [Status]) VALUES (10, N'Musician', 1)
INSERT [dbo].[MOVIE_ROLE] ([ID], [Name], [Status]) VALUES (11, N'Singer', 1)
INSERT [dbo].[MOVIE_ROLE] ([ID], [Name], [Status]) VALUES (12, N'Cinematographer', 1)
SET IDENTITY_INSERT [dbo].[MOVIE_ROLE] OFF
GO
SET IDENTITY_INSERT [dbo].[MOVIECAST] ON 

INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1, 101, 101, 2)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (2, 101, 101, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (3, 101, 111, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (4, 102, 116, 3)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (5, 102, 109, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (6, 102, 108, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (7, 102, 107, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (8, 103, 128, 2)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (9, 103, 125, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (10, 103, 127, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (11, 104, 132, 2)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (12, 104, 132, 3)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (13, 104, 133, 3)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (14, 104, 130, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (15, 104, 131, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1002, 1102, 131, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1003, 1102, 1116, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1004, 1102, 129, 10)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1005, 1102, 119, 2)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1006, 1103, 1117, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1007, 1103, 1122, 2)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1008, 1103, 1123, 6)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1009, 1103, 1120, 3)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1010, 1103, 1118, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1012, 1105, 1129, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1013, 1105, 1124, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1014, 1105, 1125, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1015, 1105, 1126, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1016, 1105, 125, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1017, 1105, 1127, 3)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1018, 1105, 1128, 3)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1019, 1106, 1130, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1020, 1106, 1131, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1021, 1106, 1132, 1)
INSERT [dbo].[MOVIECAST] ([ID], [MovieID], [CastID], [RoleID]) VALUES (1022, 1106, 1133, 2)
SET IDENTITY_INSERT [dbo].[MOVIECAST] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieObjects] ON 

INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1, 101, 1, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (2, 101, 2, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (3, 101, 18, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (4, 102, 1, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (5, 102, 2, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (6, 102, 12, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (7, 102, 18, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (8, 102, 22, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (9, 102, 21, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (10, 103, 3, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (11, 103, 12, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (12, 103, 23, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (13, 104, 3, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (14, 104, 12, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (15, 104, 25, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (16, 104, 23, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1002, 1102, 12, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1003, 1102, 8, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1004, 1102, 23, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1005, 1103, 1, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1006, 1103, 2, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1007, 1103, 5, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1008, 1103, 14, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1009, 1103, 18, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1010, 1103, 22, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1011, 1103, 21, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1014, 1105, 8, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1015, 1105, 12, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1016, 1105, 1025, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1017, 1105, 18, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1018, 1106, 2, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1019, 1106, 1, 1, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1020, 1106, 14, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1021, 1106, 18, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1022, 1106, 21, 2, 1)
INSERT [dbo].[MovieObjects] ([ID], [MovieID], [ObjectID], [ObjectTypeID], [Status]) VALUES (1023, 1106, 22, 2, 1)
SET IDENTITY_INSERT [dbo].[MovieObjects] OFF
GO
SET IDENTITY_INSERT [dbo].[ObjectName] ON 

INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (1, N'Action', 1, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (2, N'Adventure', 1, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (3, N'Comedy', 1, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (4, N'Crime', 1, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (5, N'Fantasy', 1, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (6, N'Historical', 1, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (7, N'Horror', 1, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (8, N'Romance', 1, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (9, N'Science fiction', 1, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (10, N'Thriller', 1, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (11, N'Animation', 1, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (12, N'Drama', 1, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (13, N'Documentary', 1, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (14, N'English', 2, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (15, N'French', 2, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (16, N'Japanese', 2, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (17, N'Spanish', 2, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (18, N'Hindi', 2, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (19, N'Russian', 2, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (20, N'Portuguese', 2, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (21, N'Telugu', 2, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (22, N'Tamil', 2, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (23, N'Gujarati', 2, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (24, N'Malayalam', 2, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (25, N'Family', 1, 1)
INSERT [dbo].[ObjectName] ([ID], [TypeName], [TypeID], [Status]) VALUES (1025, N'Musical', 1, 1)
SET IDENTITY_INSERT [dbo].[ObjectName] OFF
GO
SET IDENTITY_INSERT [dbo].[ObjectType] ON 

INSERT [dbo].[ObjectType] ([ID], [TypeName], [Status]) VALUES (1, N'Genre', 1)
INSERT [dbo].[ObjectType] ([ID], [TypeName], [Status]) VALUES (2, N'Language', 1)
SET IDENTITY_INSERT [dbo].[ObjectType] OFF
GO
SET IDENTITY_INSERT [dbo].[ROLE] ON 

INSERT [dbo].[ROLE] ([RoleID], [Role], [Status]) VALUES (1, N'Admin', 1)
INSERT [dbo].[ROLE] ([RoleID], [Role], [Status]) VALUES (2, N'User', 1)
INSERT [dbo].[ROLE] ([RoleID], [Role], [Status]) VALUES (4, N'TheatreAdmin', 1)
SET IDENTITY_INSERT [dbo].[ROLE] OFF
GO
SET IDENTITY_INSERT [dbo].[SCREEN] ON 

INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (101, N'SCR-1', 13, 3, 2014, 2014, CAST(N'2023-06-22T20:12:45.740' AS DateTime), CAST(N'2023-06-22T20:12:45.740' AS DateTime), CAST(120.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (102, N'SCR-2', 13, 4, 2014, 2014, CAST(N'2023-06-22T20:37:58.147' AS DateTime), CAST(N'2023-06-22T20:37:58.147' AS DateTime), CAST(160.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (103, N'S-1', 12, 3, 2013, 2013, CAST(N'2023-06-22T20:39:19.270' AS DateTime), CAST(N'2023-06-22T20:39:19.270' AS DateTime), CAST(108.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (104, N'S-2', 12, 3, 2013, 2013, CAST(N'2023-06-22T20:39:29.287' AS DateTime), CAST(N'2023-06-22T20:39:29.287' AS DateTime), CAST(108.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (105, N'S-3', 12, 4, 2013, 2013, CAST(N'2023-06-22T20:39:38.137' AS DateTime), CAST(N'2023-06-22T20:39:38.137' AS DateTime), CAST(144.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (106, N'SCR-1', 11, 3, 2013, 2013, CAST(N'2023-06-22T20:41:06.970' AS DateTime), CAST(N'2023-06-22T20:41:06.970' AS DateTime), CAST(132.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (107, N'SCR-2', 11, 4, 2013, 2013, CAST(N'2023-06-22T20:42:58.930' AS DateTime), CAST(N'2023-06-22T20:42:58.930' AS DateTime), CAST(176.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (108, N'SCR-3', 11, 4, 2013, 2013, CAST(N'2023-06-22T20:44:11.980' AS DateTime), CAST(N'2023-06-22T20:44:11.980' AS DateTime), CAST(176.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (109, N'S-4', 12, 4, 2013, 2013, CAST(N'2023-06-23T09:38:16.930' AS DateTime), CAST(N'2023-06-23T09:38:16.930' AS DateTime), CAST(144.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (111, N'SCR-1', 15, 4, 2014, 2014, CAST(N'2023-06-23T12:17:34.753' AS DateTime), CAST(N'2023-06-23T12:17:34.753' AS DateTime), CAST(192.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (112, N'SCR-2', 15, 3, 2014, 2014, CAST(N'2023-06-23T12:18:39.450' AS DateTime), CAST(N'2023-06-23T12:18:39.450' AS DateTime), CAST(120.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (113, N'SCR-3', 15, 4, 2014, 2014, CAST(N'2023-06-23T12:22:07.190' AS DateTime), CAST(N'2023-06-23T12:22:07.190' AS DateTime), CAST(192.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (114, N'SCR-4', 15, 3, 2014, 2014, CAST(N'2023-06-23T12:22:13.593' AS DateTime), CAST(N'2023-06-23T12:22:13.593' AS DateTime), CAST(120.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (115, N'SCR-3', 13, 4, 2014, 2014, CAST(N'2023-06-23T12:22:36.580' AS DateTime), CAST(N'2023-06-23T12:22:36.580' AS DateTime), CAST(160.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (116, N'SCR-4', 13, 3, 2014, 2014, CAST(N'2023-06-23T12:22:44.860' AS DateTime), CAST(N'2023-06-23T12:22:44.860' AS DateTime), CAST(100.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (117, N'SCR-1', 16, 3, 2014, 2014, CAST(N'2023-06-23T12:33:09.513' AS DateTime), CAST(N'2023-06-23T12:33:09.513' AS DateTime), CAST(90.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (118, N'SCR-2', 16, 3, 2014, 2014, CAST(N'2023-06-23T12:33:22.587' AS DateTime), CAST(N'2023-06-23T12:33:22.587' AS DateTime), CAST(90.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (119, N'SCR-3', 16, 4, 2014, 2014, CAST(N'2023-06-23T12:33:36.120' AS DateTime), CAST(N'2023-06-23T12:33:36.120' AS DateTime), CAST(144.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[SCREEN] ([ID], [Name], [TheaterID], [ScreenTypeID], [CreatedByID], [UpdateByID], [CreateDate], [UpdateDate], [ScreenBasePrice], [Status]) VALUES (120, N'S-1', 18, 3, 2014, 2014, CAST(N'2023-06-23T12:48:33.350' AS DateTime), CAST(N'2023-06-23T12:48:33.350' AS DateTime), CAST(85.00 AS Decimal(10, 2)), 1)
SET IDENTITY_INSERT [dbo].[SCREEN] OFF
GO
SET IDENTITY_INSERT [dbo].[SCREEN_TYPE] ON 

INSERT [dbo].[SCREEN_TYPE] ([ID], [NAME], [FACTOR], [Status]) VALUES (3, N'2D', CAST(1.0 AS Decimal(3, 1)), 1)
INSERT [dbo].[SCREEN_TYPE] ([ID], [NAME], [FACTOR], [Status]) VALUES (4, N'3D', CAST(1.6 AS Decimal(3, 1)), 1)
SET IDENTITY_INSERT [dbo].[SCREEN_TYPE] OFF
GO
SET IDENTITY_INSERT [dbo].[SEAT_TYPE] ON 

INSERT [dbo].[SEAT_TYPE] ([ID], [NAME], [Factor], [Status]) VALUES (1, N'Normal', CAST(1.05 AS Decimal(5, 2)), 1)
INSERT [dbo].[SEAT_TYPE] ([ID], [NAME], [Factor], [Status]) VALUES (2, N'Executive', CAST(1.10 AS Decimal(5, 2)), 1)
INSERT [dbo].[SEAT_TYPE] ([ID], [NAME], [Factor], [Status]) VALUES (3, N'Balcony', CAST(1.25 AS Decimal(5, 2)), 1)
INSERT [dbo].[SEAT_TYPE] ([ID], [NAME], [Factor], [Status]) VALUES (4, N'Recliner', CAST(1.50 AS Decimal(5, 2)), 1)
SET IDENTITY_INSERT [dbo].[SEAT_TYPE] OFF
GO
SET IDENTITY_INSERT [dbo].[THEATRE] ON 

INSERT [dbo].[THEATRE] ([ID], [Name], [Street], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [MinTicketPrice], [Status]) VALUES (11, N'PVR MOTERA', N'Motera', N'Ahmedabad', N'Gujarat', N'India', CAST(N'2023-06-20T19:40:23.270' AS DateTime), CAST(N'2023-06-20T19:40:23.270' AS DateTime), 2013, 2013, CAST(110.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[THEATRE] ([ID], [Name], [Street], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [MinTicketPrice], [Status]) VALUES (12, N'PVR ICON', N'The Pavillion Pune', N'Pune', N'Maharashtra', N'India', CAST(N'2023-06-20T19:42:01.263' AS DateTime), CAST(N'2023-06-20T19:42:01.263' AS DateTime), 2013, 2013, CAST(90.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[THEATRE] ([ID], [Name], [Street], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [MinTicketPrice], [Status]) VALUES (13, N'Cinepolis Nexus', N'WESTEND Mall Aundh', N'Pune', N'Maharashtra', N'India', CAST(N'2023-06-22T16:44:40.300' AS DateTime), CAST(N'2023-06-22T16:44:40.300' AS DateTime), 2014, 2014, CAST(100.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[THEATRE] ([ID], [Name], [Street], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [MinTicketPrice], [Status]) VALUES (15, N'Cinepolis Nexus', N'SeaWoods', N'Mumbai', N'Maharashtra', N'India', CAST(N'2023-06-23T12:15:58.013' AS DateTime), CAST(N'2023-06-23T12:15:58.013' AS DateTime), 2014, 2014, CAST(120.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[THEATRE] ([ID], [Name], [Street], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [MinTicketPrice], [Status]) VALUES (16, N'Cinepolis Nexus', N'Ahmedabad One Mall, Vastrapur Lake', N'Ahmedabad', N'Gujarat', N'India', CAST(N'2023-06-23T12:25:19.683' AS DateTime), CAST(N'2023-06-23T12:25:19.683' AS DateTime), 2014, 2014, CAST(90.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[THEATRE] ([ID], [Name], [Street], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [MinTicketPrice], [Status]) VALUES (17, N'Cinepolis Nexus', N'Shantiniketan', N'Bengaluru', N'Karnataka', N'India', CAST(N'2023-06-23T12:27:52.143' AS DateTime), CAST(N'2023-06-23T12:27:52.143' AS DateTime), 2014, 2014, CAST(130.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[THEATRE] ([ID], [Name], [Street], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [MinTicketPrice], [Status]) VALUES (18, N'Cinepolis Nexus', N'Inorbit Mall', N'Vadodara', N'Gujarat', N'India', CAST(N'2023-06-23T12:32:32.417' AS DateTime), CAST(N'2023-06-23T12:32:32.417' AS DateTime), 2014, 2014, CAST(85.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[THEATRE] ([ID], [Name], [Street], [City], [State], [Country], [CreateDate], [UpdateDate], [CreatedByID], [UpdateByID], [MinTicketPrice], [Status]) VALUES (19, N'PVR Surat', N'Dumas Road', N'Surat', N'Gujarat', N'India', CAST(N'2023-06-23T14:09:46.137' AS DateTime), CAST(N'2023-06-23T14:09:46.137' AS DateTime), 2013, 2013, CAST(100.00 AS Decimal(10, 2)), 1)
SET IDENTITY_INSERT [dbo].[THEATRE] OFF
GO
SET IDENTITY_INSERT [dbo].[THEATRE FACILITY] ON 

INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (1, 12, 1, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (2, 12, 2, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (3, 11, 1, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (4, 11, 2, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (5, 11, 4, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (6, 13, 1, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (7, 13, 3, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (15, 15, 2, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (16, 15, 3, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (17, 15, 4, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (18, 15, 5, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (19, 15, 6, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (20, 16, 1, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (21, 16, 3, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (22, 16, 2, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (23, 16, 7, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (24, 17, 1, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (25, 17, 3, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (26, 17, 8, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (27, 17, 2, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (28, 18, 1, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (29, 18, 3, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (30, 19, 1, 1)
INSERT [dbo].[THEATRE FACILITY] ([ID], [TheatureID], [FacilityID], [Status]) VALUES (31, 19, 3, 1)
SET IDENTITY_INSERT [dbo].[THEATRE FACILITY] OFF
GO
SET IDENTITY_INSERT [dbo].[USER] ON 

INSERT [dbo].[USER] ([UserID], [FirstName], [LastName], [DOB], [Email], [PhoneNo], [PasswordHash], [PasswordSalt], [CreateDate], [UpdateDate], [RoleID], [LastOTP], [Status]) VALUES (1001, N'Vishal', N'Chaudhary', CAST(N'2001-08-16' AS Date), N'vishalchaudhary@gmail.com', N'9357412588', 0x6742A306E93A5E46CAE2106E2294AA77AB36536203725F1E82D3FF423E1EC63B, 0xF89C2A6896048C4A4A03D96DAF4171412B271A19CDCE3847EA8D7AF85530507F16990E44E7EA00702C37B41DE321AC6BDFCF6A1980A5929E01756D40C21AD897, CAST(N'2023-05-27T15:33:14.133' AS DateTime), CAST(N'2023-05-27T15:33:14.133' AS DateTime), 2, NULL, 1)
INSERT [dbo].[USER] ([UserID], [FirstName], [LastName], [DOB], [Email], [PhoneNo], [PasswordHash], [PasswordSalt], [CreateDate], [UpdateDate], [RoleID], [LastOTP], [Status]) VALUES (1002, N'Nirmal', N'Shah', CAST(N'2001-12-13' AS Date), N'ndshah1122@gmail.com', N'9374627351', 0xFA97D7E2608B1EED59562647017A953A14463F90CC73FE9077E8CDB602DB0828, 0xF23E9B259C253B9492ACCF4562C3556FCFE08857A50B489ABD92B32743D46F03D538420DB132563CEBF08185A82523649905317E5399BE194F479912835F1FE1, CAST(N'2023-05-30T19:08:58.043' AS DateTime), CAST(N'2023-06-17T12:15:01.537' AS DateTime), 1, N'555521', 1)
INSERT [dbo].[USER] ([UserID], [FirstName], [LastName], [DOB], [Email], [PhoneNo], [PasswordHash], [PasswordSalt], [CreateDate], [UpdateDate], [RoleID], [LastOTP], [Status]) VALUES (1003, N'Dharmik', N'Gajjar', CAST(N'2001-06-05' AS Date), N'dharmik@gmail.com', N'9825456987', 0x11ED52B3B9B9306C0F24A15751A2BE5CE163F504C3677A920D8B3ED4166B9156, 0xA65ACE6756E9E8BE6C79BA28C5F617AF4C63AE0322986DD411D274A38F8A2245A9235BC3840DDC51EC0C4899D9B901CA2D8DFC0F7CA1A838D2E051282E888BAC, CAST(N'2023-06-05T10:51:51.523' AS DateTime), CAST(N'2023-06-05T10:51:51.523' AS DateTime), 2, NULL, 1)
INSERT [dbo].[USER] ([UserID], [FirstName], [LastName], [DOB], [Email], [PhoneNo], [PasswordHash], [PasswordSalt], [CreateDate], [UpdateDate], [RoleID], [LastOTP], [Status]) VALUES (2013, N'Hitesh', N'Ahir', CAST(N'2000-04-03' AS Date), N'ndshah351@gmail.com', N'9374627351', 0xD3234477D3AA9F5BFA97323CE8673BB249DF41A633DB63302CE6DF4C36D9A2C6, 0x794A88A8F9D0E60A526C21364A15B4B2C99068B76722FA18A21D846B2C89E2D27B9EBDCF6BA9CF2A9D3D76803420E65EF0CE1D098FD5BF25CA3C6ECFF89F7B46, CAST(N'2023-06-20T14:09:03.747' AS DateTime), CAST(N'2023-06-20T14:09:03.747' AS DateTime), 4, NULL, 1)
INSERT [dbo].[USER] ([UserID], [FirstName], [LastName], [DOB], [Email], [PhoneNo], [PasswordHash], [PasswordSalt], [CreateDate], [UpdateDate], [RoleID], [LastOTP], [Status]) VALUES (2014, N'Aman', N'Rajput', CAST(N'2001-05-01' AS Date), N'georgeresio@gmail.com', N'8140241127', 0xBC531A977A9972871047614DDBA7FE05FF3DFE0352EF09680CFDC38CA9E1138A, 0x156F9E00DEBDED714D8D92E3074D8C1D7C1108C3485DCF572EBB9557B4FF9F68D63524777D5FE62836920610F74BC9A5A6F0D4F2009E011820846F5A4E673B84, CAST(N'2023-06-22T16:38:19.047' AS DateTime), CAST(N'2023-06-22T16:38:19.047' AS DateTime), 4, NULL, 1)
SET IDENTITY_INSERT [dbo].[USER] OFF
GO
/****** Object:  Index [UC_MovieAccess_UserId_MovieId]    Script Date: 13-07-2023 12:00:42 ******/
ALTER TABLE [dbo].[MovieAccess] ADD  CONSTRAINT [UC_MovieAccess_UserId_MovieId] UNIQUE NONCLUSTERED 
(
	[UserId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BATCH] ADD  DEFAULT ((1)) FOR [FACTOR]
GO
ALTER TABLE [dbo].[BATCH] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BATCH] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[BATCH] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[BATCH_STATUS] ADD  DEFAULT ((0)) FOR [IsBooked]
GO
ALTER TABLE [dbo].[BATCH_STATUS] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[BOOKED_TICKETS] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BOOKED_TICKETS] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[BOOKED_TICKETS] ADD  DEFAULT ((1)) FOR [Row_Status]
GO
ALTER TABLE [dbo].[BookedSeat] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[CAST] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[CAST] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[CAST] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[FACILITY] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[LAYOUT] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[MOVIE] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[MOVIE] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[MOVIE] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[MOVIE_ROLE] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[MovieAccess] ADD  DEFAULT ((0)) FOR [isApproved]
GO
ALTER TABLE [dbo].[MovieAccess] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[MovieAccess] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[MovieObjects] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ObjectName] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ObjectType] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ROLE] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SCREEN] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[SCREEN] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[SCREEN] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SCREEN_TYPE] ADD  DEFAULT ((1)) FOR [FACTOR]
GO
ALTER TABLE [dbo].[SCREEN_TYPE] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SEAT_TYPE] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[THEATRE] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[THEATRE] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[THEATRE] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[THEATRE FACILITY] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[USER] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[USER] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[USER] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[BATCH]  WITH CHECK ADD FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[BATCH]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[MOVIE] ([ID])
GO
ALTER TABLE [dbo].[BATCH]  WITH CHECK ADD FOREIGN KEY([ScreenID])
REFERENCES [dbo].[SCREEN] ([ID])
GO
ALTER TABLE [dbo].[BATCH]  WITH CHECK ADD FOREIGN KEY([UpdateByID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[BATCH_STATUS]  WITH CHECK ADD FOREIGN KEY([BatchID])
REFERENCES [dbo].[BATCH] ([ID])
GO
ALTER TABLE [dbo].[BOOKED_TICKETS]  WITH CHECK ADD FOREIGN KEY([BatchID])
REFERENCES [dbo].[BATCH] ([ID])
GO
ALTER TABLE [dbo].[BOOKED_TICKETS]  WITH CHECK ADD FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[BOOKED_TICKETS]  WITH CHECK ADD FOREIGN KEY([UpdateByID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[BOOKED_TICKETS]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[BookedSeat]  WITH CHECK ADD FOREIGN KEY([TicketID])
REFERENCES [dbo].[BOOKED_TICKETS] ([ID])
GO
ALTER TABLE [dbo].[CAST]  WITH CHECK ADD FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[CAST]  WITH CHECK ADD FOREIGN KEY([UpdateByID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[LAYOUT]  WITH CHECK ADD FOREIGN KEY([ScreenID])
REFERENCES [dbo].[SCREEN] ([ID])
GO
ALTER TABLE [dbo].[LAYOUT]  WITH CHECK ADD FOREIGN KEY([SeatTypeID])
REFERENCES [dbo].[SEAT_TYPE] ([ID])
GO
ALTER TABLE [dbo].[MOVIE]  WITH CHECK ADD FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[MOVIE]  WITH CHECK ADD FOREIGN KEY([UpdateByID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[MovieAccess]  WITH CHECK ADD FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[MovieAccess]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[MOVIE] ([ID])
GO
ALTER TABLE [dbo].[MovieAccess]  WITH CHECK ADD FOREIGN KEY([UpdateByID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[MovieAccess]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[MOVIECAST]  WITH CHECK ADD FOREIGN KEY([CastID])
REFERENCES [dbo].[CAST] ([ID])
GO
ALTER TABLE [dbo].[MOVIECAST]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[MOVIE] ([ID])
GO
ALTER TABLE [dbo].[MOVIECAST]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[MOVIE_ROLE] ([ID])
GO
ALTER TABLE [dbo].[MovieObjects]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[MOVIE] ([ID])
GO
ALTER TABLE [dbo].[MovieObjects]  WITH CHECK ADD FOREIGN KEY([ObjectTypeID])
REFERENCES [dbo].[ObjectType] ([ID])
GO
ALTER TABLE [dbo].[MovieObjects]  WITH CHECK ADD FOREIGN KEY([ObjectID])
REFERENCES [dbo].[ObjectName] ([ID])
GO
ALTER TABLE [dbo].[ObjectName]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [dbo].[ObjectType] ([ID])
GO
ALTER TABLE [dbo].[SCREEN]  WITH CHECK ADD FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[SCREEN]  WITH CHECK ADD FOREIGN KEY([ScreenTypeID])
REFERENCES [dbo].[SCREEN_TYPE] ([ID])
GO
ALTER TABLE [dbo].[SCREEN]  WITH CHECK ADD FOREIGN KEY([TheaterID])
REFERENCES [dbo].[THEATRE] ([ID])
GO
ALTER TABLE [dbo].[SCREEN]  WITH CHECK ADD FOREIGN KEY([UpdateByID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[THEATRE]  WITH CHECK ADD FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[THEATRE]  WITH CHECK ADD FOREIGN KEY([UpdateByID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[THEATRE FACILITY]  WITH CHECK ADD FOREIGN KEY([FacilityID])
REFERENCES [dbo].[FACILITY] ([ID])
GO
ALTER TABLE [dbo].[THEATRE FACILITY]  WITH CHECK ADD FOREIGN KEY([TheatureID])
REFERENCES [dbo].[THEATRE] ([ID])
GO
ALTER TABLE [dbo].[USER]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[ROLE] ([RoleID])
GO
ALTER TABLE [dbo].[CAST]  WITH CHECK ADD CHECK  (([Gender]='Female' OR [Gender]='Male'))
GO
/****** Object:  StoredProcedure [dbo].[GetGenres]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetGenres]
AS
BEGIN
	SELECT *
	FROM [ObjectName]
	WHERE [TypeID] = 1
	ORDER BY [TypeName];
END
GO
/****** Object:  StoredProcedure [dbo].[GetLanguages]    Script Date: 13-07-2023 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetLanguages]
AS
BEGIN
	SELECT *
	FROM [ObjectName]
	WHERE [TypeID] = 2
	ORDER BY [TypeName];
END
GO
USE [master]
GO
ALTER DATABASE [BookMyShow] SET  READ_WRITE 
GO
