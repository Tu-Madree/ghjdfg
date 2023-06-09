USE [master]
GO
/****** Object:  Database [fahrutdinova_imp]    Script Date: 25.04.2023 15:54:24 ******/
CREATE DATABASE [fahrutdinova_imp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'fahrutdinova_imp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\fahrutdinova_imp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'fahrutdinova_imp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\fahrutdinova_imp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [fahrutdinova_imp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [fahrutdinova_imp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [fahrutdinova_imp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET ARITHABORT OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [fahrutdinova_imp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [fahrutdinova_imp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [fahrutdinova_imp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [fahrutdinova_imp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [fahrutdinova_imp] SET  MULTI_USER 
GO
ALTER DATABASE [fahrutdinova_imp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [fahrutdinova_imp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [fahrutdinova_imp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [fahrutdinova_imp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [fahrutdinova_imp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [fahrutdinova_imp] SET QUERY_STORE = OFF
GO
USE [fahrutdinova_imp]
GO
/****** Object:  Table [dbo].[client]    Script Date: 25.04.2023 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[ID_Client] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nchar](15) NOT NULL,
	[Name] [nchar](15) NOT NULL,
	[Patronymic] [nchar](15) NOT NULL,
	[Sex] [nchar](1) NOT NULL,
	[PhoneNumber] [nchar](11) NOT NULL,
	[ClientPhoto] [nvarchar](max) NOT NULL,
	[BirthdayDate] [date] NOT NULL,
	[Email] [nchar](20) NOT NULL,
	[RegestrationDate] [date] NOT NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[ID_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 25.04.2023 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderClientFIO] [nvarchar](max) NULL,
	[OrderNumber] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAF65E686DB] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 25.04.2023 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK__OrderPro__817A26620D91A7D4] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Point]    Script Date: 25.04.2023 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point](
	[Point_id] [int] IDENTITY(1,1) NOT NULL,
	[adress] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Point] PRIMARY KEY CLUSTERED 
(
	[Point_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25.04.2023 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](max) NULL,
	[ProductPrivider] [nvarchar](max) NULL,
	[ProductDiscount] [int] NULL,
 CONSTRAINT [PK__Product__2EA7DCD504E177B1] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 25.04.2023 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25.04.2023 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[client] ON 

INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (1, N'Голубев        ', N'Иосиф          ', N'Тимофеевич     ', N' ', N' 7(78)972-7', N' Клиенты\m18.jpg', CAST(N'1982-05-06' AS Date), N' smcnabb@att.net    ', CAST(N'2018-08-18' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (2, N'Ермакова       ', N'Алла           ', N'Мироновна      ', N' ', N' 7(06)437-1', N' Клиенты\48.jpg', CAST(N'1976-01-22' AS Date), N' whimsy@aol.com     ', CAST(N'2017-02-09' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (3, N'Селиверстов    ', N'Глеб           ', N'Максимович     ', N' ', N' 7(20)554-2', N' Клиенты\m37.jpg', CAST(N'1999-06-20' AS Date), N' jigsaw@sbcglobal.ne', CAST(N'2016-01-07' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (4, N'Агафонов       ', N'Юстиниан       ', N'Олегович       ', N' ', N' 7(303)810-', N' Клиенты\m1.jpg', CAST(N'1997-02-02' AS Date), N' staffelb@sbcglobal.', CAST(N'2016-06-08' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (5, N'Колобова       ', N'Злата          ', N'Романовна      ', N' ', N' 7(50)884-0', N' Клиенты\18.jpg', CAST(N'1994-08-25' AS Date), N' sinkou@aol.com     ', CAST(N'2016-12-03' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (6, N'Сысоева        ', N'Дарина         ', N'Ярославовна    ', N' ', N' 7(0698)387', N' Клиенты\32.jpg', CAST(N'1982-02-03' AS Date), N' treit@verizon.net  ', CAST(N'2016-05-13' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (7, N'Некрасов       ', N'Варлам         ', N'Михайлович     ', N' ', N' 7(019)258-', N' Клиенты\m42.jpg', CAST(N'2000-11-12' AS Date), N' dogdude@verizon.net', CAST(N'2017-12-03' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (8, N'Крюков         ', N'Наум           ', N'Ильяович       ', N' ', N' 7(81)657-8', N' Клиенты\m30.jpg', CAST(N'1993-11-17' AS Date), N' floxy@hotmail.com  ', CAST(N'2017-02-01' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (9, N'Сидорова       ', N'Татьяна        ', N'Михайловна     ', N' ', N' 7(51)732-9', N' Клиенты\42.jpg', CAST(N'1974-04-24' AS Date), N' tbeck@mac.com      ', CAST(N'2018-10-03' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (10, N'Трофимова      ', N'Альжбета       ', N'Якововна       ', N' ', N' 7(1084)658', N' Клиенты\25.jpg', CAST(N'1988-10-22' AS Date), N' gbacon@mac.com     ', CAST(N'2017-09-21' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (11, N'Новиков        ', N'Адриан         ', N'Аркадьевич     ', N' ', N' 7(70)572-3', N' Клиенты\m40.jpg', CAST(N'1974-01-15' AS Date), N' multiplx@verizon.ne', CAST(N'2018-11-23' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (12, N'Мишина         ', N'Иветта         ', N'Андреевна      ', N' ', N' 7(3926)244', N' Клиенты\30.jpg', CAST(N'2002-10-05' AS Date), N' aukjan@yahoo.com   ', CAST(N'2016-01-24' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (13, N'Шестаков       ', N'Геннадий       ', N'Рубенович      ', N' ', N' 7(2066)037', N' Клиенты\m41.jpg', CAST(N'2001-07-01' AS Date), N' tokuhirom@live.com ', CAST(N'2018-12-08' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (14, N'Зуев           ', N'Матвей         ', N'Иванович       ', N' ', N' 7(5383)893', N' Клиенты\m38.jpg', CAST(N'1981-03-28' AS Date), N' brickbat@verizon.ne', CAST(N'2018-12-18' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (15, N'Турова         ', N'Георгина       ', N'Семёновна      ', N' ', N' 7(555)321-', N' Клиенты\27.jpg', CAST(N'1974-05-28' AS Date), N' yruan@optonline.net', CAST(N'2018-02-22' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (16, N'Анисимов       ', N'Валентин       ', N'Пантелеймонович', N' ', N' 7(700)326-', N' Клиенты\m99.jpg', CAST(N'2000-12-10' AS Date), N' aaribaud@hotmail.co', CAST(N'2018-01-20' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (17, N'Анисимова      ', N'Тамара         ', N'Витальевна     ', N' ', N' 7(66)128-0', N' Клиенты\2.jpg', CAST(N'1988-06-16' AS Date), N' schwaang@mac.com   ', CAST(N'2016-02-25' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (18, N'Колобов        ', N'Орест          ', N'Юлианович      ', N' ', N' 7(1680)508', N' Клиенты\m27.jpg', CAST(N'2001-07-14' AS Date), N' parkes@verizon.net ', CAST(N'2017-01-01' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (19, N'Филатов        ', N'Аристарх       ', N'Дмитриевич     ', N' ', N' 7(696)235-', N' Клиенты\m43.jpg', CAST(N'1989-05-29' AS Date), N' hampton@att.net    ', CAST(N'2017-01-11' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (20, N'Орлова         ', N'Влада          ', N'Мартыновна     ', N' ', N' 7(2506)433', N' Клиенты\22.jpg', CAST(N'1990-06-26' AS Date), N' rnelson@yahoo.ca   ', CAST(N'2016-03-21' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (21, N'Алексеева      ', N'Элина          ', N'Матвеевна      ', N' ', N' 7(8086)245', N' Клиенты\1.jpg', CAST(N'2002-05-07' AS Date), N' pthomsen@verizon.ne', CAST(N'2018-03-28' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (22, N'Бобров         ', N'Агафон         ', N'Лаврентьевич   ', N' ', N' 7(2159)507', N' Клиенты\m35.jpg', CAST(N'1995-07-29' AS Date), N' petersen@comcast.ne', CAST(N'2017-05-09' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (23, N'Бирюкова       ', N'Инара          ', N'Улебовна       ', N' ', N' 7(098)346-', N' Клиенты\5.jpg', CAST(N'1978-07-21' AS Date), N' smpeters@hotmail.co', CAST(N'2017-10-01' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (24, N'Панфилов       ', N'Марк           ', N'Рудольфович    ', N' ', N' 7(764)282-', N' Клиенты\m45.jpg', CAST(N'1991-04-13' AS Date), N' cremonini@optonline', CAST(N'2016-02-23' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (25, N'Колесникова    ', N'Алина          ', N'Еремеевна      ', N' ', N' 7(74)977-3', N' Клиенты\40.jpg', CAST(N'2001-04-19' AS Date), N' gfxguy@outlook.com ', CAST(N'2017-01-18' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (26, N'Морозов        ', N'Наум           ', N'Валерьянович   ', N' ', N' 7(636)050-', N' Клиенты\m49.jpg', CAST(N'1985-07-04' AS Date), N' salesgeek@mac.com  ', CAST(N'2016-05-02' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (27, N'Горбачёв       ', N'Давид          ', N'Тимурович      ', N' ', N' 7(53)602-8', N' Клиенты\m36.jpg', CAST(N'1983-05-22' AS Date), N' hedwig@att.net     ', CAST(N'2018-12-17' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (28, N'Васильев       ', N'Оскар          ', N'Богданович     ', N' ', N' 7(585)801-', N' Клиенты\m15.jpg', CAST(N'1971-01-30' AS Date), N' miturria@verizon.ne', CAST(N'2017-05-28' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (29, N'Ершова         ', N'Номи           ', N'Андреевна      ', N' ', N' 7(7757)315', N' Клиенты\14.jpg', CAST(N'2001-09-13' AS Date), N' miltchev@mac.com   ', CAST(N'2016-06-30' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (30, N'Медведев       ', N'Святослав      ', N'Юлианович      ', N' ', N' 7(3520)435', N' Клиенты\m13.jpg', CAST(N'1972-10-04' AS Date), N' hllam@comcast.net  ', CAST(N'2018-10-13' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (31, N'Баранова       ', N'Эльмира        ', N'Дмитриевна     ', N' ', N' 7(9240)643', N' Клиенты\4.jpg', CAST(N'1977-01-15' AS Date), N' jgmyers@comcast.net', CAST(N'2016-07-08' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (32, N'Попова         ', N'Харита         ', N'Якуновна       ', N' ', N' 7(335)386-', N' Клиенты\36.jpg', CAST(N'1997-12-16' AS Date), N' firstpr@verizon.net', CAST(N'2016-07-05' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (33, N'Кудряшов       ', N'Аверкий        ', N'Константинович ', N' ', N' 7(88)732-9', N' Клиенты\m33.jpg', CAST(N'1991-07-26' AS Date), N' nanop@msn.com      ', CAST(N'2018-03-08' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (34, N'Горшкова       ', N'Марта          ', N'Иосифовна      ', N' ', N' 7(544)650-', N' Клиенты\9.jpg', CAST(N'2001-02-13' AS Date), N' gbacon@mac.com     ', CAST(N'2016-08-04' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (35, N'Кудрявцев      ', N'Богдан         ', N'Христофорович  ', N' ', N' 7(20)131-8', N' Клиенты\m31.jpg', CAST(N'1988-02-27' AS Date), N' lukka@hotmail.com  ', CAST(N'2016-10-07' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (36, N'Гусев          ', N'Яков           ', N'Авксентьевич   ', N' ', N' 7(0972)781', N' Клиенты\m20.jpg', CAST(N'1995-12-10' AS Date), N' jdhedden@icloud.com', CAST(N'2017-11-20' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (37, N'Крюкова        ', N'Авигея         ', N'Святославовна  ', N' ', N' 7(499)318-', N' Клиенты\19.jpg', CAST(N'2000-08-10' AS Date), N' simone@gmail.com   ', CAST(N'2018-01-03' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (38, N'Степанова      ', N'Амелия         ', N'Робертовна     ', N' ', N' 7(1217)441', N' Клиенты\15.jpg', CAST(N'1970-06-06' AS Date), N' rasca@hotmail.com  ', CAST(N'2017-09-27' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (39, N'Суворова       ', N'Божена         ', N'Анатольевна    ', N' ', N' 7(347)895-', N' Клиенты\34.jpg', CAST(N'1981-03-09' AS Date), N' attwood@aol.com    ', CAST(N'2016-01-28' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (40, N'Борисов        ', N'Аввакум        ', N'Артемович      ', N' ', N' 7(2296)930', N' Клиенты\m12.jpg', CAST(N'1974-04-25' AS Date), N' chlim@live.com     ', CAST(N'2017-03-11' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (41, N'Бобылёв        ', N'Георгий        ', N'Витальевич     ', N' ', N' 7(88)685-1', N' Клиенты\m11.jpg', CAST(N'1983-12-19' AS Date), N' csilvers@mac.com   ', CAST(N'2018-04-06' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (42, N'Дроздов        ', N'Вольдемар      ', N'Артемович      ', N' ', N' 7(307)456-', N' Клиенты\m21.jpg', CAST(N'1976-02-07' AS Date), N' smpeters@me.com    ', CAST(N'2017-07-18' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (43, N'Беляева        ', N'Сабрина        ', N'Федосеевна     ', N' ', N' 7(6580)534', N' Клиенты\47.jpg', CAST(N'1972-07-26' AS Date), N' agapow@gmail.com   ', CAST(N'2017-06-14' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (44, N'Блохин         ', N'Пантелеймон    ', N'Феликсович     ', N' ', N' 7(9524)556', N' Клиенты\m8.jpg', CAST(N'1978-03-06' AS Date), N' balchen@comcast.net', CAST(N'2018-02-14' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (45, N'Шашкова        ', N'Гелла          ', N'Эдуардовна     ', N' ', N' 7(57)446-2', N' Клиенты\43.jpg', CAST(N'1979-02-24' AS Date), N' jadavis@mac.com    ', CAST(N'2016-11-16' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (46, N'Калашников     ', N'Артур          ', N'Юрьевич        ', N' ', N' 7(147)947-', N' Клиенты\m10.jpg', CAST(N'1972-12-13' AS Date), N' oevans@aol.com     ', CAST(N'2017-08-20' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (47, N'Корнилова      ', N'Анэля          ', N'Михайловна     ', N' ', N' 7(20)980-0', N' Клиенты\26.jpg', CAST(N'1973-04-02' AS Date), N' jonathan@aol.com   ', CAST(N'2016-05-22' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (48, N'Гущина         ', N'Янита          ', N'Федоровна      ', N' ', N' 7(4544)716', N' Клиенты\11.jpg', CAST(N'1999-03-02' AS Date), N' lishoy@att.net     ', CAST(N'2018-02-01' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (49, N'Волков         ', N'Людвиг         ', N'Витальевич     ', N' ', N' 7(8459)592', N' Клиенты\m50.jpg', CAST(N'1977-12-27' AS Date), N' jrkorson@msn.com   ', CAST(N'2016-04-27' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (50, N'Князев         ', N'Терентий       ', N'Валерьевич     ', N' ', N' 7(98)397-2', N' Клиенты\m26.jpg', CAST(N'1991-06-19' AS Date), N' rjones@aol.com     ', CAST(N'2018-06-25' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (51, N'Силин          ', N'Гаянэ          ', N'Анатольевич    ', N' ', N' 7(4547)615', N' Клиенты\m46.jpg', CAST(N'1976-05-27' AS Date), N' multiplx@comcast.ne', CAST(N'2017-05-05' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (52, N'Казаков        ', N'Дмитрий        ', N'Русланович     ', N' ', N' 7(51)682-1', N' Клиенты\m44.jpg', CAST(N'1978-12-15' AS Date), N' ozawa@verizon.net  ', CAST(N'2016-05-21' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (53, N'Гусева         ', N'Роза           ', N'Дмитриевна     ', N' ', N' 7(23)064-5', N' Клиенты\10.jpg', CAST(N'1999-02-13' AS Date), N' martyloo@live.com  ', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (54, N'Мамонтова      ', N'Марфа          ', N'Мироновна      ', N' ', N' 7(38)095-6', N' Клиенты\29.jpg', CAST(N'1984-10-19' AS Date), N' rfoley@verizon.net ', CAST(N'2018-02-27' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (55, N'Галкин         ', N'Эрик           ', N'Онисимович     ', N' ', N' 7(759)873-', N' Клиенты\m16.jpg', CAST(N'1975-01-18' AS Date), N' snunez@verizon.net ', CAST(N'2016-07-19' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (56, N'Архипова       ', N'Прасковья      ', N'Валерьевна     ', N' ', N' 7(86)540-1', N' Клиенты\33.jpg', CAST(N'1979-01-09' AS Date), N' cgcra@live.com     ', CAST(N'2018-07-23' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (57, N'Овчинникова    ', N'Лаура          ', N'Еремеевна      ', N' ', N' 7(85)829-3', N' Клиенты\35.jpg', CAST(N'1992-04-03' AS Date), N' carcus@yahoo.ca    ', CAST(N'2018-11-24' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (58, N'Андреева       ', N'Патрисия       ', N'Валерьевна     ', N' ', N' 7(9648)953', N' Клиенты\37.jpg', CAST(N'1993-11-18' AS Date), N' jigsaw@aol.com     ', CAST(N'2016-07-17' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (59, N'Авдеев         ', N'Самуил         ', N'Улебович       ', N' ', N' 7(3168)043', N' Клиенты\m96.jpg', CAST(N'1996-07-04' AS Date), N' cliffordj@mac.com  ', CAST(N'2016-02-11' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (60, N'Бурова         ', N'Светлана       ', N'Лукьевна       ', N' ', N' 7(358)173-', N' Клиенты\39.jpg', CAST(N'1979-01-04' AS Date), N' wsnyder@aol.com    ', CAST(N'2016-10-13' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (61, N'Ершов          ', N'Глеб           ', N'Федорович      ', N' ', N' 7(2608)298', N' Клиенты\m23.jpg', CAST(N'1970-06-14' AS Date), N' sjava@aol.com      ', CAST(N'2016-09-14' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (62, N'Игнатов        ', N'Захар          ', N'Павлович       ', N' ', N' 7(578)574-', N' Клиенты\m98.jpg', CAST(N'1998-10-07' AS Date), N' dieman@icloud.com  ', CAST(N'2017-11-10' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (63, N'Комиссарова    ', N'Амалия         ', N'Робертовна     ', N' ', N' 7(22)647-4', N' Клиенты\17.jpg', CAST(N'1971-08-18' AS Date), N' jorgb@msn.com      ', CAST(N'2017-08-04' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (64, N'Быков          ', N'Трофим         ', N'Константинович ', N' ', N' 7(3414)460', N' Клиенты\m14.jpg', CAST(N'1994-12-20' AS Date), N' jguyer@aol.com     ', CAST(N'2016-04-17' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (65, N'Кузьмин        ', N'Леонтий        ', N'Валерьянович   ', N' ', N' 7(1340)148', N' Клиенты\m17.jpg', CAST(N'2000-05-05' AS Date), N' msloan@hotmail.com ', CAST(N'2017-10-12' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (66, N'Белозёрова     ', N'Диана          ', N'Антоновна      ', N' ', N' 7(9900)174', N' Клиенты\7.jpg', CAST(N'1989-02-27' AS Date), N' dialworld@aol.com  ', CAST(N'2017-01-30' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (67, N'Блинов         ', N'Евгений        ', N'Мэлсович       ', N' ', N' 7(0852)321', N' Клиенты\m7.jpg', CAST(N'1994-01-05' AS Date), N' moxfulder@outlook.c', CAST(N'2017-05-07' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (68, N'Лазарев        ', N'Алексей        ', N'Богданович     ', N' ', N' 7(0055)737', N' Клиенты\m48.jpg', CAST(N'1977-03-10' AS Date), N' claesjac@me.com    ', CAST(N'2017-01-02' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (69, N'Афанасьева     ', N'Розалия        ', N'Макаровна      ', N' ', N' 7(0661)413', N' Клиенты\31.jpg', CAST(N'1977-05-01' AS Date), N' malattia@hotmail.co', CAST(N'2017-09-06' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (70, N'Дементьева     ', N'Эдита          ', N'Онисимовна     ', N' ', N' 7(198)922-', N' Клиенты\38.jpg', CAST(N'1975-09-17' AS Date), N' frosal@hotmail.com ', CAST(N'2018-11-24' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (71, N'Калинин        ', N'Петр           ', N'Иванович       ', N' ', N' 7(90)316-0', N' Клиенты\m47.jpg', CAST(N'1993-09-08' AS Date), N' aschmitz@hotmail.co', CAST(N'2016-05-26' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (72, N'Андреев        ', N'Станислав      ', N'Максович       ', N' ', N' 7(02)993-9', N' Клиенты\m3.jpg', CAST(N'1975-10-10' AS Date), N' budinger@mac.com   ', CAST(N'2017-12-26' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (73, N'Киселёв        ', N'Устин          ', N'Яковлевич      ', N' ', N' 7(83)334-5', N' Клиенты\m25.jpg', CAST(N'1985-01-08' AS Date), N' dalamb@verizon.net ', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (74, N'Гордеев        ', N'Павел          ', N'Семенович      ', N' ', N' 7(5243)599', N' Клиенты\m19.jpg', CAST(N'1984-09-06' AS Date), N' dawnsong@verizon.ne', CAST(N'2016-07-19' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (75, N'Горбачёва      ', N'Никки          ', N'Еремеевна      ', N' ', N' 7(94)789-6', N' Клиенты\8.jpg', CAST(N'1987-04-21' AS Date), N' chinthaka@att.net  ', CAST(N'2018-08-16' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (76, N'Копылов        ', N'Касьян         ', N'Робертович     ', N' ', N' 7(5774)679', N' Клиенты\m29.jpg', CAST(N'1983-08-04' AS Date), N' crobles@sbcglobal.n', CAST(N'2018-03-18' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (77, N'Ефремов        ', N'Витольд        ', N'Авксентьевич   ', N' ', N' 7(93)922-1', N' Клиенты\m28.jpg', CAST(N'1975-12-02' AS Date), N' kwilliams@yahoo.ca ', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (78, N'Баранов        ', N'Михаил         ', N'Романович      ', N' ', N' 7(750)985-', N' Клиенты\m5.jpg', CAST(N'1997-07-12' AS Date), N' bigmauler@outlook.c', CAST(N'2018-10-07' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (79, N'Дмитриева      ', N'Элина          ', N'Даниловна      ', N' ', N' 7(787)140-', N' Клиенты\12.jpg', CAST(N'1988-12-10' AS Date), N' vmalik@live.com    ', CAST(N'2017-02-11' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (80, N'Федотов        ', N'Осип           ', N'Анатольевич    ', N' ', N' 7(590)702-', N' Клиенты\m9.jpg', CAST(N'1971-04-13' AS Date), N' breegster@hotmail.c', CAST(N'2018-07-23' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (81, N'Быкова         ', N'Тала           ', N'Георгьевна     ', N' ', N' 7(13)915-5', N' Клиенты\6.jpg', CAST(N'2000-02-22' AS Date), N' ganter@optonline.ne', CAST(N'2016-08-13' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (82, N'Дементьев      ', N'Вадим          ', N'Ростиславович  ', N' ', N' 7(79)330-4', N' Клиенты\m39.jpg', CAST(N'1993-07-10' AS Date), N' jacks@aol.com      ', CAST(N'2018-03-05' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (83, N'Евсеев         ', N'Макар          ', N'Васильевич     ', N' ', N' 7(2141)077', N' Клиенты\m22.jpg', CAST(N'1977-09-13' AS Date), N' parsimony@sbcglobal', CAST(N'2018-12-05' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (84, N'Абрамов        ', N'Станислав      ', N'Филатович      ', N' ', N' 7(6545)478', N' Клиенты\m32.jpg', CAST(N'1989-05-18' AS Date), N' solomon@att.net    ', CAST(N'2016-12-08' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (85, N'Артемьева      ', N'Лиза           ', N'Максимовна     ', N' ', N' 7(696)972-', N' Клиенты\3.jpg', CAST(N'1996-05-17' AS Date), N' snunez@yahoo.ca    ', CAST(N'2018-10-07' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (86, N'Кузьмина       ', N'Дэнна          ', N'Витальевна     ', N' ', N' 7(9940)977', N' Клиенты\20.jpg', CAST(N'1993-08-24' AS Date), N' nichoj@mac.com     ', CAST(N'2016-03-27' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (87, N'Ефимова        ', N'Магда          ', N'Платоновна     ', N' ', N' 7(9261)386', N' Клиенты\16.jpg', CAST(N'1995-08-16' AS Date), N' rbarreira@me.com   ', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (88, N'Ефимов         ', N'Альберт        ', N'Проклович      ', N' ', N' 7(416)375-', N' Клиенты\m6.jpg', CAST(N'1997-10-29' AS Date), N' houle@live.com     ', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (89, N'Лазарева       ', N'Эльвина        ', N'Робертовна     ', N' ', N' 7(5564)609', N' Клиенты\28.jpg', CAST(N'1996-02-16' AS Date), N' ahuillet@comcast.ne', CAST(N'2018-04-11' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (90, N'Воронова       ', N'Изабелла       ', N'Вячеславовна   ', N' ', N' 7(17)433-4', N' Клиенты\21.jpg', CAST(N'1999-09-24' AS Date), N' kildjean@sbcglobal.', CAST(N'2017-12-21' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (91, N'Куликова       ', N'Эвелина        ', N'Вячеславовна   ', N' ', N' 7(0236)682', N' Клиенты\23.jpg', CAST(N'1997-11-14' AS Date), N' ilikered@hotmail.co', CAST(N'2018-02-01' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (92, N'Егорова        ', N'Амалия         ', N'Дамировна      ', N' ', N' 7(7486)408', N' Клиенты\13.jpg', CAST(N'1999-09-28' AS Date), N' drezet@yahoo.com   ', CAST(N'2016-06-30' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (93, N'Александров    ', N'Станислав      ', N'Эдуардович     ', N' ', N' 7(18)164-0', N' Клиенты\m2.jpg', CAST(N'1981-07-04' AS Date), N' bigmauler@aol.com  ', CAST(N'2018-11-08' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (94, N'Цветков        ', N'Демьян         ', N'Львович        ', N' ', N' 7(93)546-4', N' Клиенты\m4.jpg', CAST(N'1996-03-29' AS Date), N' hauma@icloud.com   ', CAST(N'2016-02-12' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (95, N'Устинова       ', N'Юнона          ', N'Валентиновна   ', N' ', N' 7(33)367-1', N' Клиенты\44.jpg', CAST(N'1982-08-08' AS Date), N' kempsonc@live.com  ', CAST(N'2017-05-28' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (96, N'Костина        ', N'Любава         ', N'Авксентьевна   ', N' ', N' 7(6419)959', N' Клиенты\41.jpg', CAST(N'1972-07-13' AS Date), N' gordonjcp@hotmail.c', CAST(N'2016-02-26' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (97, N'Смирнов        ', N'Мартын         ', N'Арсеньевич     ', N' ', N' 7(6251)589', N' Клиенты\m34.jpg', CAST(N'1996-06-25' AS Date), N' haddawy@live.com   ', CAST(N'2017-02-07' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (98, N'Федотова       ', N'Сандра         ', N'Владленовна    ', N' ', N' 7(126)195-', N' Клиенты\24.jpg', CAST(N'1985-03-29' AS Date), N' penna@verizon.net  ', CAST(N'2016-11-08' AS Date))
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (99, N'Журавлёв       ', N'Леонтий        ', N'Яковлевич      ', N' ', N' 7(4403)308', N' Клиенты\m24.jpg', CAST(N'2000-03-02' AS Date), N' cmdrgravy@me.com   ', CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[client] ([ID_Client], [Surname], [Name], [Patronymic], [Sex], [PhoneNumber], [ClientPhoto], [BirthdayDate], [Email], [RegestrationDate]) VALUES (100, N'Большаков      ', N'Вадим          ', N'Данилович      ', N' ', N' 7(386)641-', N' Клиенты\m97.jpg', CAST(N'1970-05-15' AS Date), N' uncle@gmail.com    ', CAST(N'2018-08-04' AS Date))
SET IDENTITY_INSERT [dbo].[client] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFIO], [OrderNumber], [OrderDate]) VALUES (1, N'Завершен', CAST(N'2022-05-20T00:00:00.000' AS DateTime), 1, NULL, 901, CAST(N'2022-05-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFIO], [OrderNumber], [OrderDate]) VALUES (2, N'Новый ', CAST(N'2022-05-22T00:00:00.000' AS DateTime), 11, N'Николаев Даниил Денисович', 902, CAST(N'2022-05-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFIO], [OrderNumber], [OrderDate]) VALUES (3, N'Новый ', CAST(N'2022-05-22T00:00:00.000' AS DateTime), 2, N'Сазонов Руслан Германович', 903, CAST(N'2022-05-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFIO], [OrderNumber], [OrderDate]) VALUES (4, N'Новый ', CAST(N'2022-05-25T00:00:00.000' AS DateTime), 11, N'Одинцов Серафим Артёмович', 904, CAST(N'2022-05-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFIO], [OrderNumber], [OrderDate]) VALUES (5, N'Новый ', CAST(N'2022-05-25T00:00:00.000' AS DateTime), 2, N'Степанов Михаил Артёмович', 905, CAST(N'2022-05-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFIO], [OrderNumber], [OrderDate]) VALUES (6, N'Новый ', CAST(N'2022-05-26T00:00:00.000' AS DateTime), 15, NULL, 906, CAST(N'2022-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFIO], [OrderNumber], [OrderDate]) VALUES (7, N'Новый ', CAST(N'2022-05-28T00:00:00.000' AS DateTime), 3, NULL, 907, CAST(N'2022-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFIO], [OrderNumber], [OrderDate]) VALUES (8, N'Новый ', CAST(N'2022-05-28T00:00:00.000' AS DateTime), 19, NULL, 908, CAST(N'2022-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFIO], [OrderNumber], [OrderDate]) VALUES (9, N'Новый ', CAST(N'2022-05-30T00:00:00.000' AS DateTime), 5, NULL, 909, CAST(N'2022-05-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFIO], [OrderNumber], [OrderDate]) VALUES (10, N'Завершен', CAST(N'2022-05-30T00:00:00.000' AS DateTime), 19, NULL, 910, CAST(N'2022-05-30T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (1, N'G843H5', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (1, N'А112Т4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (2, N'D325D4', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (2, N'S432T5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (3, N'F325D4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (3, N'G432G6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (4, N'C346F5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (4, N'H542F5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (5, N'G643F4', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (5, N'J326V5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (6, N'G634F5', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (6, N'R635F5', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (7, N'G643F5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (7, N'G689G5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (8, N'A357H6', 10)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (8, N'K532T5', 10)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (9, N'C638J8', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (9, N'F537H7', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (10, N'H346F5', 20)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (10, N'L732G6', 20)
GO
SET IDENTITY_INSERT [dbo].[Point] ON 

INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (1, N'344288, г. Лесной, ул. Чехова, 1')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (2, N'614164, г.Лесной,  ул. Степная, 30')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (3, N'394242, г. Лесной, ул. Коммунистическая, 43')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (4, N'660540, г. Лесной, ул. Солнечная, 25')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (5, N'125837, г. Лесной, ул. Шоссейная, 40')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (6, N'125703, г. Лесной, ул. Партизанская, 49')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (7, N'625283, г. Лесной, ул. Победы, 46')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (8, N'614611, г. Лесной, ул. Молодежная, 50')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (9, N'454311, г.Лесной, ул. Новая, 19')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (10, N'660007, г.Лесной, ул. Октябрьская, 19')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (11, N'603036, г. Лесной, ул. Садовая, 4')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (12, N'450983, г.Лесной, ул. Комсомольская, 26')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (13, N'394782, г. Лесной, ул. Чехова, 3')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (14, N'603002, г. Лесной, ул. Дзержинского, 28')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (15, N'450558, г. Лесной, ул. Набережная, 30')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (16, N'394060, г.Лесной, ул. Фрунзе, 43')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (17, N'410661, г. Лесной, ул. Школьная, 50')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (18, N'625590, г. Лесной, ул. Коммунистическая, 20')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (19, N'625683, г. Лесной, ул. 8 Марта')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (20, N'400562, г. Лесной, ул. Зеленая, 32')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (21, N'614510, г. Лесной, ул. Маяковского, 47')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (22, N'410542, г. Лесной, ул. Светлая, 46')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (23, N'620839, г. Лесной, ул. Цветочная, 8')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (24, N'443890, г. Лесной, ул. Коммунистическая, 1')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (25, N'603379, г. Лесной, ул. Спортивная, 46')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (26, N'603721, г. Лесной, ул. Гоголя, 41')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (27, N'410172, г. Лесной, ул. Северная, 13')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (28, N'420151, г. Лесной, ул. Вишневая, 32')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (29, N'125061, г. Лесной, ул. Подгорная, 8')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (30, N'630370, г. Лесной, ул. Шоссейная, 24')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (31, N'614753, г. Лесной, ул. Полевая, 35')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (32, N'426030, г. Лесной, ул. Маяковского, 44')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (33, N'450375, г. Лесной ул. Клубная, 44')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (34, N'625560, г. Лесной, ул. Некрасова, 12')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (35, N'630201, г. Лесной, ул. Комсомольская, 17')
INSERT [dbo].[Point] ([Point_id], [adress]) VALUES (36, N'190949, г. Лесной, ул. Мичурина, 26')
SET IDENTITY_INSERT [dbo].[Point] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'A357H6', N'Цветок в горшке', N'Суккулент микс 5х15см', N'В горшке', N'InGreen', CAST(222.0000 AS Decimal(19, 4)), 15, 2, N'шт.', NULL, N'Цветовик', 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'B653G6', N'Цветок в горшке', N'Пуансеттия микс 13 см', N'В горшке', N'Цветочный сад', CAST(171.0000 AS Decimal(19, 4)), 30, 9, N'шт.', NULL, N'Мир цветов', 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'C346F5', N'Цветок в горшке', N'Хамедорея Бридбл 9х35 см', N'В горшке', N'Santino', CAST(177.0000 AS Decimal(19, 4)), 15, 4, N'шт.', N'C346F5.jpg', N'Цветовик', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'C638J8', N'Цветок в горшке', N'Многолетнее растение Пуансеттия микс', N'В горшке', N'Gloria Garden', CAST(222.0000 AS Decimal(19, 4)), 10, 15, N'шт.', NULL, N'Цветовик', 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'D325D4', N'Горшок', N'Горшок Santino с автополивом Arte-dea 14.7 x 17 см бледно-зеленый', N'Горшки', N'Santino', CAST(292.0000 AS Decimal(19, 4)), 10, 12, N'шт.', N'D325D4.jpg', N'Мир цветов', 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'F256G6', N'Цветок в горшке', N'Орхидея Фаленопсис промо ø12 h40 - 55 см', N'В горшке', N'InGreen', CAST(577.0000 AS Decimal(19, 4)), 30, 2, N'шт.', N'F256G6.jpg', N'Мир цветов', 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'F325D4', N'Горшок с поддоном', N'Gloria Garden Горшок с поддоном Гербера br59951 (Набор)', N'Горшки', N'Gloria Garden', CAST(984.0000 AS Decimal(19, 4)), 5, 3, N'шт.', N'F325D4.jpg', N'Цветовик', 4)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'F537H7', N'Цветок в горшке', N'Многолетнее растение Пуансеттия микс Айс Пунш h20см', N'В горшке', N'Цветочный сад', CAST(277.0000 AS Decimal(19, 4)), 5, 6, N'шт.', NULL, N'Мир цветов', 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'G432G6', N'Букет', N'Букет из 9 красных роз длиной 50 см в крафте', N'Букеты', N'Цветочный сад', CAST(910.0000 AS Decimal(19, 4)), 6, 3, N'шт.', N'G432G6.jpg', N'Цветовик', 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'G543F5', N'Цветок в горшке', N'Замиокулькас 12х30 см', N'В горшке', N'Gloria Garden', CAST(533.0000 AS Decimal(19, 4)), 15, 6, N'шт.', NULL, N'Мир цветов', 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'G632H6', N'Цветок в горшке', N'Цикламен 15х35 см', N'В горшке', N'Santino', CAST(390.0000 AS Decimal(19, 4)), 6, 8, N'шт.', NULL, N'Мир цветов', 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'G634F5', N'Цветок в горшке', N'Пуансеттия Промо красная 10х30 см', N'В горшке', N'Цветочный сад', CAST(111.0000 AS Decimal(19, 4)), 5, 15, N'шт.', NULL, N'Мир цветов', 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'G643F4', N'Цветок в горшке', N'Орхидея Фаленопсис микс 1 стебель ø12 h50 см', N'В горшке', N'Santino', CAST(455.0000 AS Decimal(19, 4)), 10, 24, N'шт.', NULL, N'Цветовик', 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'G643F5', N'Цветок в горшке', N'Фиттония микс 8х10 см', N'В горшке', N'GardenPlast', CAST(355.0000 AS Decimal(19, 4)), 10, 1, N'шт.', NULL, N'Мир цветов', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'G689G5', N'Цветок в горшке', N'Драцена маргината 11х50 см', N'В горшке', N'GardenPlast', CAST(145.0000 AS Decimal(19, 4)), 15, 3, N'шт.', NULL, N'Мир цветов', 4)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'G843H5', N'Кашпо', N'Кашпо «Орхидея», 1,6 л, 14 х 14 см', N'Горшки', N'GardenPlast', CAST(335.0000 AS Decimal(19, 4)), 15, 9, N'шт.', N'G843H5.jpg', N'Мир цветов', 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'H346F5', N'Цветок в горшке', N'Каланхое микс h11см', N'В горшке', N'InGreen', CAST(133.0000 AS Decimal(19, 4)), 6, 5, N'шт.', NULL, N'Цветовик', 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'H436H7', N'Цветок в горшке', N'Пуансеттия, 15х35см', N'В горшке', N'Цветочный сад', CAST(298.0000 AS Decimal(19, 4)), 10, 23, N'шт.', NULL, N'Цветовик', 4)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'H475R5', N'Цветок в горшке', N'Орхидея Фаленопсис микро h20см', N'В горшке', N'InGreen', CAST(398.0000 AS Decimal(19, 4)), 5, 12, N'шт.', NULL, N'Цветовик', 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'H542F5', N'Искусственные цветы', N'Искусственные цветы подсолнух/Искусственные цветы для декора', N'Букеты', N'Цветочный сад', CAST(400.0000 AS Decimal(19, 4)), 10, 5, N'шт.', N'H542F5.jpg', N'Мир цветов', 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'J326V5', N'Цветок в горшке', N'Плант микс 9х25 см', N'В горшке', N'GardenPlast', CAST(211.0000 AS Decimal(19, 4)), 5, 4, N'шт.', NULL, N'Цветовик', 4)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'J532V5', N'Цветок в горшке', N'Пуансеттия, 30х12 см', N'В горшке', N'Цветочный сад', CAST(185.0000 AS Decimal(19, 4)), 15, 6, N'шт.', N'J532V5.jpg', N'Мир цветов', 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'J632F6', N'Цветок в горшке', N'Спатифиллиум Чопин 9х35 см', N'В горшке', N'GardenPlast', CAST(288.0000 AS Decimal(19, 4)), 5, 6, N'шт.', NULL, N'Цветовик', 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'J735J7', N'Цветок в горшке', N'Пуансеттия микс 15 см', N'В горшке', N'Цветочный сад', CAST(262.0000 AS Decimal(19, 4)), 15, 4, N'шт.', NULL, N'Цветовик', 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'K532T5', N'Цветок в горшке', N'Кактус грузони шаровидный микс 5х8 см', N'В горшке', N'Santino', CAST(111.0000 AS Decimal(19, 4)), 30, 7, N'шт.', NULL, N'Цветовик', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'L732G6', N'Цветок в горшке', N'Каланхое "Каландива" микс', N'В горшке', N'Цветочный сад', CAST(150.0000 AS Decimal(19, 4)), 5, 9, N'шт.', NULL, N'Мир цветов', 4)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'M642E5', N'Цветок в горшке', N'Кактус микс 5х10 см', N'В горшке', N'InGreen', CAST(111.0000 AS Decimal(19, 4)), 10, 2, N'шт.', NULL, N'Цветовик', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'R635F5', N'Цветок в горшке', N'Кактус мамиллярия 5х14 см', N'В горшке', N'Цветочный сад', CAST(188.0000 AS Decimal(19, 4)), 6, 7, N'шт.', NULL, N'Цветовик', 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'S432T5', N'Кашпо', N'Кашпо InGreen Фиджи ING1555, 5 л, 23х20.8 см шоколадный', N'Горшки', N'InGreen', CAST(309.0000 AS Decimal(19, 4)), 5, 15, N'шт.', N'S432T5.jpg', N'Цветовик', 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductPhoto], [ProductPrivider], [ProductDiscount]) VALUES (N'А112Т4', N'Кашпо', N'Кашпо GardenPlast Лаванда 14 х 26 см фиолетовый', N'Горшки', N'GardenPlast', CAST(300.0000 AS Decimal(19, 4)), 30, 6, N'шт.', N'А112Т4.jpg', N'Цветовик', 5)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Калачева', N'Валерия', N'Даниловна', N'zpv1r94d5ous@gmail.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Макарова', N'Вероника', N'Евгеньевна', N'9eln76uth4iz@mail.com', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Михайлова', N'Василиса', N'Ярославовна', N'60f2ix5d4zbu@tutanota.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Горшков', N'Марк', N'Матвеевич', N'ridvnptec8ym@yahoo.com', N'YOyhfR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Смирнов', N'Данила', N'Артёмович', N'dt3ifc1qz4kw@mail.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Зимин', N'Михаил', N'Филиппович', N'co30fa4np6se@mail.com', N'rwVDh9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Николаев', N'Даниил', N'Денисович', N'arucwkyzls62@outlook.com', N'LdNyos', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Сазонов', N'Руслан', N'Германович', N'nmxos1diph5e@tutanota.com', N'gynQMT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Одинцов', N'Серафим', N'Артёмович', N'xbvi3ktjde7c@yahoo.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Степанов', N'Михаил', N'Артёмович', N'lqgbwpmrc3do@tutanota.com', N'JlFRCZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Point] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[Point] ([Point_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Point]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__5CD6CB2B] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__5CD6CB2B]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__5DCAEF64] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__5DCAEF64]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [fahrutdinova_imp] SET  READ_WRITE 
GO
