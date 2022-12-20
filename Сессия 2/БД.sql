USE [master]
GO
/****** Object:  Database [Абоненты]    Script Date: 20.12.2022 9:53:59 ******/
CREATE DATABASE [Абоненты]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Абоненты', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\Абоненты.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Абоненты_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\Абоненты_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Абоненты] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Абоненты].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Абоненты] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Абоненты] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Абоненты] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Абоненты] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Абоненты] SET ARITHABORT OFF 
GO
ALTER DATABASE [Абоненты] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Абоненты] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Абоненты] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Абоненты] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Абоненты] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Абоненты] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Абоненты] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Абоненты] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Абоненты] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Абоненты] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Абоненты] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Абоненты] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Абоненты] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Абоненты] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Абоненты] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Абоненты] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Абоненты] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Абоненты] SET RECOVERY FULL 
GO
ALTER DATABASE [Абоненты] SET  MULTI_USER 
GO
ALTER DATABASE [Абоненты] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Абоненты] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Абоненты] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Абоненты] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Абоненты] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Абоненты', N'ON'
GO
ALTER DATABASE [Абоненты] SET QUERY_STORE = OFF
GO
USE [Абоненты]
GO
/****** Object:  Table [dbo].[Абоненты]    Script Date: 20.12.2022 9:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Абоненты](
	[IDАбонента] [int] NOT NULL,
	[Номер_Абонента] [int] NULL,
	[ФИО_абонента] [nvarchar](255) NULL,
	[Адрес] [nvarchar](255) NULL,
 CONSTRAINT [PK_Абоненты] PRIMARY KEY CLUSTERED 
(
	[IDАбонента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Разговоры]    Script Date: 20.12.2022 9:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Разговоры](
	[idРазговора] [int] NOT NULL,
	[Номер_Разговора] [int] NULL,
	[Дата_Разговора] [date] NULL,
	[Продолжительность] [int] NULL,
	[idТарифа] [int] NULL,
	[idТелефона] [int] NULL,
 CONSTRAINT [PK_Разговоры] PRIMARY KEY CLUSTERED 
(
	[idРазговора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Телефоны]    Script Date: 20.12.2022 9:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Телефоны](
	[IdТелефона] [int] IDENTITY(1,1) NOT NULL,
	[Номер_Телефона] [varchar](50) NULL,
	[Номер_договора] [nvarchar](255) NULL,
	[Дата_Установки_телефона] [date] NULL,
	[idАбонента] [int] NULL,
 CONSTRAINT [PK__Телефоны__335CABC8ACD34053] PRIMARY KEY CLUSTERED 
(
	[IdТелефона] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Статистика_Разговоров]    Script Date: 20.12.2022 9:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Статистика_Разговоров]

AS
SELECT        dbo.Телефоны.Номер_Телефона, dbo.Абоненты.ФИО_абонента, COUNT(dbo.Разговоры.Номер_Разговора) AS Кол_во_Разговоров
FROM           [dbo].[Телефоны]  INNER JOIN 
					[dbo].[Абоненты] on [dbo].[Телефоны].idАбонента = [dbo].[Абоненты].idАбонента inner join 
					[dbo].[Разговоры] on [dbo].[Телефоны].IdТелефона = [dbo].[Разговоры].IdТелефона
					Group by  dbo.Телефоны.Номер_Телефона, dbo.Абоненты.ФИО_абонента
                
					
GO
/****** Object:  Table [dbo].[Тарифы]    Script Date: 20.12.2022 9:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тарифы](
	[IdТарифа] [int] NOT NULL,
	[Код_Города] [int] NULL,
	[Название_Города] [nvarchar](50) NULL,
	[Тариф_Стоимость_1_мин] [int] NULL,
	[Признак_оплаты] [nvarchar](50) NULL,
 CONSTRAINT [PK_Тарифы] PRIMARY KEY CLUSTERED 
(
	[IdТарифа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Абоненты] ([IDАбонента], [Номер_Абонента], [ФИО_абонента], [Адрес]) VALUES (1, 4, N'Титова Александра Ивановна', N'г. Омск, ул. Ленина, 5, 24')
INSERT [dbo].[Абоненты] ([IDАбонента], [Номер_Абонента], [ФИО_абонента], [Адрес]) VALUES (2, 1, N'Орлов Сергей Борисович', N'г. Омск, ул. Мира, 54,4')
INSERT [dbo].[Абоненты] ([IDАбонента], [Номер_Абонента], [ФИО_абонента], [Адрес]) VALUES (3, 3, N'Вавилов Сергей Борисович', N'г. Омск, пр.Маркса, 34,23')
GO
INSERT [dbo].[Разговоры] ([idРазговора], [Номер_Разговора], [Дата_Разговора], [Продолжительность], [idТарифа], [idТелефона]) VALUES (1, 4, CAST(N'2021-03-08' AS Date), 5, 1, 1)
INSERT [dbo].[Разговоры] ([idРазговора], [Номер_Разговора], [Дата_Разговора], [Продолжительность], [idТарифа], [idТелефона]) VALUES (2, 7, CAST(N'2021-03-15' AS Date), 10, 2, 1)
INSERT [dbo].[Разговоры] ([idРазговора], [Номер_Разговора], [Дата_Разговора], [Продолжительность], [idТарифа], [idТелефона]) VALUES (3, 2, CAST(N'2021-03-02' AS Date), 2, 3, 2)
INSERT [dbo].[Разговоры] ([idРазговора], [Номер_Разговора], [Дата_Разговора], [Продолжительность], [idТарифа], [idТелефона]) VALUES (4, 8, CAST(N'2021-03-15' AS Date), 1, 4, NULL)
INSERT [dbo].[Разговоры] ([idРазговора], [Номер_Разговора], [Дата_Разговора], [Продолжительность], [idТарифа], [idТелефона]) VALUES (5, 11, CAST(N'2021-04-01' AS Date), 3, 5, NULL)
INSERT [dbo].[Разговоры] ([idРазговора], [Номер_Разговора], [Дата_Разговора], [Продолжительность], [idТарифа], [idТелефона]) VALUES (6, 3, CAST(N'2021-03-08' AS Date), 15, 6, 3)
INSERT [dbo].[Разговоры] ([idРазговора], [Номер_Разговора], [Дата_Разговора], [Продолжительность], [idТарифа], [idТелефона]) VALUES (7, 6, CAST(N'2021-03-15' AS Date), 1, 7, 3)
INSERT [dbo].[Разговоры] ([idРазговора], [Номер_Разговора], [Дата_Разговора], [Продолжительность], [idТарифа], [idТелефона]) VALUES (8, 1, CAST(N'2021-03-02' AS Date), 12, 8, 4)
INSERT [dbo].[Разговоры] ([idРазговора], [Номер_Разговора], [Дата_Разговора], [Продолжительность], [idТарифа], [idТелефона]) VALUES (9, 5, CAST(N'2021-03-15' AS Date), 10, 9, NULL)
INSERT [dbo].[Разговоры] ([idРазговора], [Номер_Разговора], [Дата_Разговора], [Продолжительность], [idТарифа], [idТелефона]) VALUES (10, 10, CAST(N'2021-04-01' AS Date), 3, 10, NULL)
INSERT [dbo].[Разговоры] ([idРазговора], [Номер_Разговора], [Дата_Разговора], [Продолжительность], [idТарифа], [idТелефона]) VALUES (11, 9, CAST(N'2021-03-23' AS Date), 6, 11, 5)
GO
INSERT [dbo].[Тарифы] ([IdТарифа], [Код_Города], [Название_Города], [Тариф_Стоимость_1_мин], [Признак_оплаты]) VALUES (1, 3, N'Воронеж', 20, N'оплачено')
INSERT [dbo].[Тарифы] ([IdТарифа], [Код_Города], [Название_Города], [Тариф_Стоимость_1_мин], [Признак_оплаты]) VALUES (2, 1, N'Омск', 10, N'не оплачено')
INSERT [dbo].[Тарифы] ([IdТарифа], [Код_Города], [Название_Города], [Тариф_Стоимость_1_мин], [Признак_оплаты]) VALUES (3, 4, N'Новосибирск', 10, N'оплачено')
INSERT [dbo].[Тарифы] ([IdТарифа], [Код_Города], [Название_Города], [Тариф_Стоимость_1_мин], [Признак_оплаты]) VALUES (4, 2, N'Москва', 30, N'оплачено')
INSERT [dbo].[Тарифы] ([IdТарифа], [Код_Города], [Название_Города], [Тариф_Стоимость_1_мин], [Признак_оплаты]) VALUES (5, 3, N'Воронеж', 20, N'оплачено')
INSERT [dbo].[Тарифы] ([IdТарифа], [Код_Города], [Название_Города], [Тариф_Стоимость_1_мин], [Признак_оплаты]) VALUES (6, 3, N'Воронеж', 20, N'оплачено')
INSERT [dbo].[Тарифы] ([IdТарифа], [Код_Города], [Название_Города], [Тариф_Стоимость_1_мин], [Признак_оплаты]) VALUES (7, 1, N'Омск', 10, N'не оплачено')
INSERT [dbo].[Тарифы] ([IdТарифа], [Код_Города], [Название_Города], [Тариф_Стоимость_1_мин], [Признак_оплаты]) VALUES (8, 1, N'Омск', 10, N'не оплачено')
INSERT [dbo].[Тарифы] ([IdТарифа], [Код_Города], [Название_Города], [Тариф_Стоимость_1_мин], [Признак_оплаты]) VALUES (9, 5, N'Санкт-Петербург', 30, N'оплачено')
INSERT [dbo].[Тарифы] ([IdТарифа], [Код_Города], [Название_Города], [Тариф_Стоимость_1_мин], [Признак_оплаты]) VALUES (10, 3, N'Воронеж', 20, N'не оплачено')
INSERT [dbo].[Тарифы] ([IdТарифа], [Код_Города], [Название_Города], [Тариф_Стоимость_1_мин], [Признак_оплаты]) VALUES (11, 3, N'Воронеж', 20, N'оплачено')
GO
SET IDENTITY_INSERT [dbo].[Телефоны] ON 

INSERT [dbo].[Телефоны] ([IdТелефона], [Номер_Телефона], [Номер_договора], [Дата_Установки_телефона], [idАбонента]) VALUES (1, N'(3812)333490', N'3465Ф', CAST(N'2012-10-09' AS Date), 1)
INSERT [dbo].[Телефоны] ([IdТелефона], [Номер_Телефона], [Номер_договора], [Дата_Установки_телефона], [idАбонента]) VALUES (2, N'(3812)951211', N'3466Ф', CAST(N'2012-10-09' AS Date), 1)
INSERT [dbo].[Телефоны] ([IdТелефона], [Номер_Телефона], [Номер_договора], [Дата_Установки_телефона], [idАбонента]) VALUES (3, N'(3812)531178', N'4523B', CAST(N'2004-08-04' AS Date), 2)
INSERT [dbo].[Телефоны] ([IdТелефона], [Номер_Телефона], [Номер_договора], [Дата_Установки_телефона], [idАбонента]) VALUES (4, N'(3812)326789', N'2378Ф', CAST(N'1996-01-01' AS Date), 2)
INSERT [dbo].[Телефоны] ([IdТелефона], [Номер_Телефона], [Номер_договора], [Дата_Установки_телефона], [idАбонента]) VALUES (5, N'(3812)953412', N'99345Р', CAST(N'2013-01-01' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Телефоны] OFF
GO
ALTER TABLE [dbo].[Разговоры]  WITH CHECK ADD  CONSTRAINT [FK_Разговоры_Тарифы] FOREIGN KEY([idТарифа])
REFERENCES [dbo].[Тарифы] ([IdТарифа])
GO
ALTER TABLE [dbo].[Разговоры] CHECK CONSTRAINT [FK_Разговоры_Тарифы]
GO
ALTER TABLE [dbo].[Разговоры]  WITH CHECK ADD  CONSTRAINT [FK_Разговоры_Телефоны] FOREIGN KEY([idТелефона])
REFERENCES [dbo].[Телефоны] ([IdТелефона])
GO
ALTER TABLE [dbo].[Разговоры] CHECK CONSTRAINT [FK_Разговоры_Телефоны]
GO
ALTER TABLE [dbo].[Телефоны]  WITH CHECK ADD  CONSTRAINT [FK_Телефоны_Абоненты] FOREIGN KEY([idАбонента])
REFERENCES [dbo].[Абоненты] ([IDАбонента])
GO
ALTER TABLE [dbo].[Телефоны] CHECK CONSTRAINT [FK_Телефоны_Абоненты]
GO
/****** Object:  StoredProcedure [dbo].[Процедура1]    Script Date: 20.12.2022 9:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Процедура1]

		@IdАбонента int,
		@Номер_Абонента int, 
		@ФИО_Абонента nvarchar(255),
		@Адрес nvarchar(255)
		
AS
BEGIN
	insert into [dbo].[Абоненты]([IDАбонента],[Номер_Абонента],[ФИО_абонента],[Адрес])
Values
(
		@IdАбонента ,
		@Номер_Абонента , 
		@ФИО_Абонента ,
		@Адрес 
)
END
GO
USE [master]
GO
ALTER DATABASE [Абоненты] SET  READ_WRITE 
GO
