USE [master]
GO
/****** Object:  Database [BookingHotel]    Script Date: 4/26/2022 1:02:44 AM ******/
CREATE DATABASE [BookingHotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookingHotel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NGUYENSEVER\MSSQL\DATA\BookingHotel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookingHotel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NGUYENSEVER\MSSQL\DATA\BookingHotel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookingHotel] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookingHotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookingHotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookingHotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookingHotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookingHotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookingHotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookingHotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookingHotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookingHotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookingHotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookingHotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookingHotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookingHotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookingHotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookingHotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookingHotel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookingHotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookingHotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookingHotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookingHotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookingHotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookingHotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookingHotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookingHotel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookingHotel] SET  MULTI_USER 
GO
ALTER DATABASE [BookingHotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookingHotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookingHotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookingHotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookingHotel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookingHotel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookingHotel] SET QUERY_STORE = OFF
GO
USE [BookingHotel]
GO
/****** Object:  Table [dbo].[tblBooking]    Script Date: 4/26/2022 1:02:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBooking](
	[BookingID] [nvarchar](20) NOT NULL,
	[HotelName] [nvarchar](20) NOT NULL,
	[amount] [int] NOT NULL,
	[CheckInDate] [date] NOT NULL,
	[CheckOutDate] [date] NOT NULL,
	[roomID] [nvarchar](20) NOT NULL,
	[price] [int] NOT NULL,
	[email] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblBooking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHotels]    Script Date: 4/26/2022 1:02:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotels](
	[HotelID] [nvarchar](20) NOT NULL,
	[HotelName] [nvarchar](20) NOT NULL,
	[HotelArea] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblHotels] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblKinds]    Script Date: 4/26/2022 1:02:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKinds](
	[kindID] [nvarchar](20) NOT NULL,
	[kindName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblKind] PRIMARY KEY CLUSTERED 
(
	[kindID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRooms]    Script Date: 4/26/2022 1:02:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRooms](
	[RoomID] [nvarchar](20) NOT NULL,
	[RoomName] [nvarchar](20) NOT NULL,
	[price] [int] NOT NULL,
	[checkInDate] [date] NOT NULL,
	[checkOutDate] [date] NOT NULL,
	[amountOfRoom] [int] NOT NULL,
	[kindID] [nvarchar](20) NOT NULL,
	[HotelID] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblRooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 4/26/2022 1:02:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[email] [nvarchar](20) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[address] [nvarchar](20) NOT NULL,
	[createdate] [date] NOT NULL,
	[status] [bit] NOT NULL,
	[roleID] [nvarchar](20) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblBooking] ([BookingID], [HotelName], [amount], [CheckInDate], [CheckOutDate], [roomID], [price], [email]) VALUES (N'b01', N'FPT', 1, CAST(N'2022-04-22' AS Date), CAST(N'2022-04-25' AS Date), N'r1', 50, N'sa')
GO
INSERT [dbo].[tblHotels] ([HotelID], [HotelName], [HotelArea]) VALUES (N'h1', N'FPT', N'Q9')
INSERT [dbo].[tblHotels] ([HotelID], [HotelName], [HotelArea]) VALUES (N'h2', N'New World', N'Q1')
GO
INSERT [dbo].[tblKinds] ([kindID], [kindName]) VALUES (N'k1', N'single')
INSERT [dbo].[tblKinds] ([kindID], [kindName]) VALUES (N'k2', N'double')
INSERT [dbo].[tblKinds] ([kindID], [kindName]) VALUES (N'k3', N'family')
GO
INSERT [dbo].[tblRooms] ([RoomID], [RoomName], [price], [checkInDate], [checkOutDate], [amountOfRoom], [kindID], [HotelID]) VALUES (N'r1', N'viewbien', 500, CAST(N'2022-04-20' AS Date), CAST(N'2022-04-23' AS Date), 50, N'k1', N'h1')
INSERT [dbo].[tblRooms] ([RoomID], [RoomName], [price], [checkInDate], [checkOutDate], [amountOfRoom], [kindID], [HotelID]) VALUES (N'r2', N'viewNui', 250, CAST(N'2022-04-23' AS Date), CAST(N'2022-04-26' AS Date), 50, N'k2', N'h2')
INSERT [dbo].[tblRooms] ([RoomID], [RoomName], [price], [checkInDate], [checkOutDate], [amountOfRoom], [kindID], [HotelID]) VALUES (N'r3', N'viewbien', 1000, CAST(N'2022-04-23' AS Date), CAST(N'2022-04-26' AS Date), 100, N'k2', N'h1')
GO
INSERT [dbo].[tblUsers] ([email], [password], [name], [address], [createdate], [status], [roleID], [phone]) VALUES (N'nguyen', N'1', N'nguyen', N'tphcm', CAST(N'2022-04-23' AS Date), 1, N'US', N'111')
INSERT [dbo].[tblUsers] ([email], [password], [name], [address], [createdate], [status], [roleID], [phone]) VALUES (N'nhaanh712', N'1234567', N'nhaanhlimity', N'113', CAST(N'2022-04-27' AS Date), 1, N'US', N'113')
INSERT [dbo].[tblUsers] ([email], [password], [name], [address], [createdate], [status], [roleID], [phone]) VALUES (N'sa', N'1', N'admin', N'tphcm', CAST(N'2022-04-23' AS Date), 1, N'AD', N'111')
INSERT [dbo].[tblUsers] ([email], [password], [name], [address], [createdate], [status], [roleID], [phone]) VALUES (N'tanvm123', N'1234567', N'tanvm', N'123', CAST(N'2022-04-25' AS Date), 1, N'US', N'123')
GO
ALTER TABLE [dbo].[tblBooking] ADD  CONSTRAINT [DF_tblBooking_amount]  DEFAULT ((1)) FOR [amount]
GO
ALTER TABLE [dbo].[tblRooms] ADD  CONSTRAINT [DF_tblRooms_price]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_tblBooking_tblRooms] FOREIGN KEY([roomID])
REFERENCES [dbo].[tblRooms] ([RoomID])
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_tblBooking_tblRooms]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_tblBooking_tblUsers] FOREIGN KEY([email])
REFERENCES [dbo].[tblUsers] ([email])
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_tblBooking_tblUsers]
GO
ALTER TABLE [dbo].[tblRooms]  WITH CHECK ADD  CONSTRAINT [FK_tblRooms_tblHotels] FOREIGN KEY([HotelID])
REFERENCES [dbo].[tblHotels] ([HotelID])
GO
ALTER TABLE [dbo].[tblRooms] CHECK CONSTRAINT [FK_tblRooms_tblHotels]
GO
ALTER TABLE [dbo].[tblRooms]  WITH CHECK ADD  CONSTRAINT [FK_tblRooms_tblKinds] FOREIGN KEY([kindID])
REFERENCES [dbo].[tblKinds] ([kindID])
GO
ALTER TABLE [dbo].[tblRooms] CHECK CONSTRAINT [FK_tblRooms_tblKinds]
GO
USE [master]
GO
ALTER DATABASE [BookingHotel] SET  READ_WRITE 
GO
