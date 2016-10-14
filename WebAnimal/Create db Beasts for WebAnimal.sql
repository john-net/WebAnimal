USE [master]
GO
/****** Object:  Database [Beasts]    Script Date: 14-Oct-16 16:26:43 ******/
CREATE DATABASE [Beasts]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Beasts', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Beasts.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Beasts_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Beasts_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Beasts] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Beasts].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Beasts] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Beasts] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Beasts] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Beasts] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Beasts] SET ARITHABORT OFF 
GO
ALTER DATABASE [Beasts] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Beasts] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Beasts] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Beasts] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Beasts] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Beasts] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Beasts] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Beasts] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Beasts] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Beasts] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Beasts] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Beasts] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Beasts] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Beasts] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Beasts] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Beasts] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Beasts] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Beasts] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Beasts] SET  MULTI_USER 
GO
ALTER DATABASE [Beasts] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Beasts] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Beasts] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Beasts] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Beasts] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Beasts]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 14-Oct-16 16:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[AnimalName] [nvarchar](128) NOT NULL,
	[ColorId] [int] NOT NULL,
	[SpeciesId] [int] NOT NULL,
	[ProvinceId] [int] NOT NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Color]    Script Date: 14-Oct-16 16:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[ColorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Province]    Script Date: 14-Oct-16 16:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[ProvinceName] [nvarchar](128) NOT NULL,
	[RegionId] [int] NOT NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Region]    Script Date: 14-Oct-16 16:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[RegionName] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Species]    Script Date: 14-Oct-16 16:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Species](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[SpeciesName] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Animal] ON 

GO
INSERT [dbo].[Animal] ([Id], [AnimalName], [ColorId], [SpeciesId], [ProvinceId]) VALUES (1, N'Шарик', 2, 0, 0)
GO
INSERT [dbo].[Animal] ([Id], [AnimalName], [ColorId], [SpeciesId], [ProvinceId]) VALUES (16, N'Лемур-Z', 0, 0, 17)
GO
INSERT [dbo].[Animal] ([Id], [AnimalName], [ColorId], [SpeciesId], [ProvinceId]) VALUES (27, N'Marushya', 3, 3, 61)
GO
INSERT [dbo].[Animal] ([Id], [AnimalName], [ColorId], [SpeciesId], [ProvinceId]) VALUES (28, N'Мурка', 3, 2, 77)
GO
SET IDENTITY_INSERT [dbo].[Animal] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

GO
INSERT [dbo].[Color] ([Id], [ColorName]) VALUES (0, N'Белый')
GO
INSERT [dbo].[Color] ([Id], [ColorName]) VALUES (1, N'Черный')
GO
INSERT [dbo].[Color] ([Id], [ColorName]) VALUES (2, N'Серый')
GO
INSERT [dbo].[Color] ([Id], [ColorName]) VALUES (3, N'Рыжий')
GO
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Province] ON 

GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (0, N'Белгородская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (1, N'Брянская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (2, N'Владимирская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (3, N'Воронежская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (4, N'Ивановская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (5, N'Калужская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (6, N'Костромская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (7, N'Курская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (8, N'Липецкая область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (9, N'Московская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (10, N'Орловская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (11, N'Рязанская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (12, N'Смоленская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (13, N'Тамбовская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (14, N'Тверская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (15, N'Тульская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (16, N'Ярославская область', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (17, N'Москва', 0)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (18, N'Республика Карелия', 1)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (19, N'Республика Коми', 1)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (20, N'Архангельская область', 1)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (21, N'Вологодская область', 1)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (22, N'Калининградская область', 1)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (23, N'Ленинградская область', 1)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (24, N'Мурманская область', 1)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (25, N'Новгородская область', 1)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (26, N'Псковская область', 1)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (27, N'Санкт-Петербург', 1)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (28, N'Ненецкий автономный округ', 1)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (29, N'Республика Адыгея', 2)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (30, N'Республика Калмыкия', 2)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (31, N'Краснодарский край', 2)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (32, N'Республика Крым', 2)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (33, N'Астраханская область', 2)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (34, N'Волгоградская область', 2)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (35, N'Ростовская область', 2)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (36, N'Севастополь', 2)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (37, N'Республика Дагестан', 3)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (38, N'Республика Ингушетия', 3)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (39, N'Кабардино-Балкарская Республика', 3)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (40, N'Карачаево-Черкесская Республика', 3)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (41, N'Республика Северная Осетия ', 3)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (42, N'Чеченская Республика', 3)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (43, N'Ставропольский край', 3)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (44, N'Республика Башкортостан', 4)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (45, N'Республика Марий Эл', 4)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (46, N'Республика Мордовия', 4)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (47, N'Республика Татарстан', 4)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (48, N'Удмуртская Республика', 4)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (49, N'Чувашская Республика', 4)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (50, N'Кировская область', 4)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (51, N'Нижегородская область', 4)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (52, N'Оренбургская область', 4)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (53, N'Пензенская область', 4)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (54, N'Самарская область', 4)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (55, N'Саратовская область', 4)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (56, N'Ульяновская область', 4)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (57, N'Пермский край', 4)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (58, N'Курганская область', 5)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (59, N'Свердловская область', 5)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (60, N'Тюменская область', 5)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (61, N'Челябинская область', 5)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (62, N'Ханты-Мансийский автономный округ — Югра', 5)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (63, N'Ямало-Ненецкий автономный округ', 5)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (64, N'Республика Алтай', 6)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (65, N'Республика Бурятия', 6)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (66, N'Республика Тыва', 6)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (67, N'Республика Хакасия', 6)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (68, N'Алтайский край', 6)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (69, N'Забайкальский край', 6)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (70, N'Красноярский край', 6)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (71, N'Иркутская область', 6)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (72, N'Кемеровская область', 6)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (73, N'Новосибирская область', 6)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (74, N'Омская область', 6)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (75, N'Томская область', 6)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (76, N'Республика Саха (Якутия)', 7)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (77, N'Камчатский край', 7)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (78, N'Приморский край', 7)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (79, N'Хабаровский край', 7)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (80, N'Амурская область', 7)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (81, N'Магаданская область', 7)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (82, N'Сахалинская область', 7)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (83, N'Еврейская автономная область', 7)
GO
INSERT [dbo].[Province] ([Id], [ProvinceName], [RegionId]) VALUES (84, N'Чукотский автономный округ', 7)
GO
SET IDENTITY_INSERT [dbo].[Province] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

GO
INSERT [dbo].[Region] ([Id], [RegionName]) VALUES (0, N'Центральный')
GO
INSERT [dbo].[Region] ([Id], [RegionName]) VALUES (1, N'Северо-Западный')
GO
INSERT [dbo].[Region] ([Id], [RegionName]) VALUES (2, N'Южный')
GO
INSERT [dbo].[Region] ([Id], [RegionName]) VALUES (3, N'Северо-Кавказский')
GO
INSERT [dbo].[Region] ([Id], [RegionName]) VALUES (4, N'Приволжский')
GO
INSERT [dbo].[Region] ([Id], [RegionName]) VALUES (5, N'Уральский')
GO
INSERT [dbo].[Region] ([Id], [RegionName]) VALUES (6, N'Сибирский')
GO
INSERT [dbo].[Region] ([Id], [RegionName]) VALUES (7, N'Дальневосточный')
GO
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Species] ON 

GO
INSERT [dbo].[Species] ([Id], [SpeciesName]) VALUES (0, N'Собака')
GO
INSERT [dbo].[Species] ([Id], [SpeciesName]) VALUES (1, N'Кошка')
GO
INSERT [dbo].[Species] ([Id], [SpeciesName]) VALUES (2, N'Корова')
GO
INSERT [dbo].[Species] ([Id], [SpeciesName]) VALUES (3, N'Медведь')
GO
INSERT [dbo].[Species] ([Id], [SpeciesName]) VALUES (4, N'Заяц')
GO
SET IDENTITY_INSERT [dbo].[Species] OFF
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Color] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Color] ([Id])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Color]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Province] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Province] ([Id])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Province]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Species] FOREIGN KEY([SpeciesId])
REFERENCES [dbo].[Species] ([Id])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Species]
GO
ALTER TABLE [dbo].[Province]  WITH CHECK ADD  CONSTRAINT [FK_Province_Region] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([Id])
GO
ALTER TABLE [dbo].[Province] CHECK CONSTRAINT [FK_Province_Region]
GO
USE [master]
GO
ALTER DATABASE [Beasts] SET  READ_WRITE 
GO
