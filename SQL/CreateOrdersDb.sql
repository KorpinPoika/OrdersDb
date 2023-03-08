/****** Object:  Database [OrdersDb]    Script Date: 3/2/2023 11:00:15 PM ******/
CREATE DATABASE [OrdersDb]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'OrdersDb', FILENAME = N'/var/opt/mssql/data/OrdersDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'OrdersDb_log', FILENAME = N'/var/opt/mssql/data/OrdersDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
-- WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
--GO
--ALTER DATABASE [OrdersDb] SET COMPATIBILITY_LEVEL = 160
--GO
--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
--begin
--EXEC [OrdersDb].[dbo].[sp_fulltext_database] @action = 'enable'
--end
--GO
ALTER DATABASE [OrdersDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrdersDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrdersDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrdersDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrdersDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrdersDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OrdersDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrdersDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrdersDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrdersDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrdersDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrdersDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrdersDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrdersDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrdersDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OrdersDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrdersDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrdersDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrdersDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrdersDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrdersDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OrdersDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrdersDb] SET RECOVERY FULL 
GO
ALTER DATABASE [OrdersDb] SET  MULTI_USER 
GO
ALTER DATABASE [OrdersDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrdersDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrdersDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrdersDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OrdersDb] SET DELAYED_DURABILITY = DISABLED 
GO
--ALTER DATABASE [OrdersDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
--GO
--EXEC sys.sp_db_vardecimal_storage_format N'OrdersDb', N'ON'
--GO
--ALTER DATABASE [OrdersDb] SET QUERY_STORE = ON
--GO
--ALTER DATABASE [OrdersDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OrdersDb]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 3/2/2023 11:00:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[c_id] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[c_fio] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_groups]    Script Date: 3/2/2023 11:00:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_groups](
	[a_id] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[a_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Articul] PRIMARY KEY CLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/2/2023 11:00:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[o_id] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[o_datetime] [datetime] NOT NULL,
	[o_client_id] [numeric](5, 0) NOT NULL,
	[o_group_id] [numeric](5, 0) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[o_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([c_id], [c_fio]) VALUES (CAST(1 AS Numeric(5, 0)), N'Ivanov Ivan Ivanovich')
INSERT [dbo].[Clients] ([c_id], [c_fio]) VALUES (CAST(2 AS Numeric(5, 0)), N'Sidorov Sidor Sidorovich')
INSERT [dbo].[Clients] ([c_id], [c_fio]) VALUES (CAST(3 AS Numeric(5, 0)), N'Petrov Petr Petrovich')
INSERT [dbo].[Clients] ([c_id], [c_fio]) VALUES (CAST(4 AS Numeric(5, 0)), N'Иванова Наталия Петровна')
INSERT [dbo].[Clients] ([c_id], [c_fio]) VALUES (CAST(5 AS Numeric(5, 0)), N'Демьянова Ольга Игоревна')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_groups] ON 

INSERT [dbo].[Order_groups] ([a_id], [a_name]) VALUES (CAST(1 AS Numeric(5, 0)), N'Самовар')
INSERT [dbo].[Order_groups] ([a_id], [a_name]) VALUES (CAST(2 AS Numeric(5, 0)), N'Пила')
INSERT [dbo].[Order_groups] ([a_id], [a_name]) VALUES (CAST(3 AS Numeric(5, 0)), N'Топор')
INSERT [dbo].[Order_groups] ([a_id], [a_name]) VALUES (CAST(4 AS Numeric(5, 0)), N'Тяпка')
INSERT [dbo].[Order_groups] ([a_id], [a_name]) VALUES (CAST(5 AS Numeric(5, 0)), N'Лопата')
SET IDENTITY_INSERT [dbo].[Order_groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([o_id], [o_datetime], [o_client_id], [o_group_id]) VALUES (CAST(1 AS Numeric(5, 0)), CAST(N'2023-03-02T14:48:27.593' AS DateTime), CAST(2 AS Numeric(5, 0)), CAST(5 AS Numeric(5, 0)))
INSERT [dbo].[Orders] ([o_id], [o_datetime], [o_client_id], [o_group_id]) VALUES (CAST(2 AS Numeric(5, 0)), CAST(N'2023-03-01T14:49:27.723' AS DateTime), CAST(2 AS Numeric(5, 0)), CAST(3 AS Numeric(5, 0)))
INSERT [dbo].[Orders] ([o_id], [o_datetime], [o_client_id], [o_group_id]) VALUES (CAST(3 AS Numeric(5, 0)), CAST(N'2023-02-27T14:50:17.013' AS DateTime), CAST(3 AS Numeric(5, 0)), CAST(1 AS Numeric(5, 0)))
INSERT [dbo].[Orders] ([o_id], [o_datetime], [o_client_id], [o_group_id]) VALUES (CAST(4 AS Numeric(5, 0)), CAST(N'2023-02-26T14:50:53.330' AS DateTime), CAST(1 AS Numeric(5, 0)), CAST(4 AS Numeric(5, 0)))
INSERT [dbo].[Orders] ([o_id], [o_datetime], [o_client_id], [o_group_id]) VALUES (CAST(5 AS Numeric(5, 0)), CAST(N'2023-03-02T14:48:27.000' AS DateTime), CAST(4 AS Numeric(5, 0)), CAST(1 AS Numeric(5, 0)))
INSERT [dbo].[Orders] ([o_id], [o_datetime], [o_client_id], [o_group_id]) VALUES (CAST(6 AS Numeric(5, 0)), CAST(N'2023-03-02T20:39:17.000' AS DateTime), CAST(5 AS Numeric(5, 0)), CAST(1 AS Numeric(5, 0)))
INSERT [dbo].[Orders] ([o_id], [o_datetime], [o_client_id], [o_group_id]) VALUES (CAST(8 AS Numeric(5, 0)), CAST(N'2023-03-01T21:27:10.000' AS DateTime), CAST(5 AS Numeric(5, 0)), CAST(3 AS Numeric(5, 0)))
INSERT [dbo].[Orders] ([o_id], [o_datetime], [o_client_id], [o_group_id]) VALUES (CAST(9 AS Numeric(5, 0)), CAST(N'2023-02-26T21:32:32.000' AS DateTime), CAST(5 AS Numeric(5, 0)), CAST(5 AS Numeric(5, 0)))
INSERT [dbo].[Orders] ([o_id], [o_datetime], [o_client_id], [o_group_id]) VALUES (CAST(10 AS Numeric(5, 0)), CAST(N'2023-03-01T21:34:00.000' AS DateTime), CAST(4 AS Numeric(5, 0)), CAST(5 AS Numeric(5, 0)))
INSERT [dbo].[Orders] ([o_id], [o_datetime], [o_client_id], [o_group_id]) VALUES (CAST(11 AS Numeric(5, 0)), CAST(N'2023-02-28T21:42:13.000' AS DateTime), CAST(4 AS Numeric(5, 0)), CAST(4 AS Numeric(5, 0)))
INSERT [dbo].[Orders] ([o_id], [o_datetime], [o_client_id], [o_group_id]) VALUES (CAST(12 AS Numeric(5, 0)), CAST(N'2023-03-02T21:50:50.000' AS DateTime), CAST(1 AS Numeric(5, 0)), CAST(1 AS Numeric(5, 0)))
INSERT [dbo].[Orders] ([o_id], [o_datetime], [o_client_id], [o_group_id]) VALUES (CAST(13 AS Numeric(5, 0)), CAST(N'2023-03-01T21:51:54.000' AS DateTime), CAST(2 AS Numeric(5, 0)), CAST(4 AS Numeric(5, 0)))
INSERT [dbo].[Orders] ([o_id], [o_datetime], [o_client_id], [o_group_id]) VALUES (CAST(14 AS Numeric(5, 0)), CAST(N'2023-03-01T22:00:09.000' AS DateTime), CAST(4 AS Numeric(5, 0)), CAST(1 AS Numeric(5, 0)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_ArticulId] FOREIGN KEY([o_group_id])
REFERENCES [dbo].[Order_groups] ([a_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_ArticulId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_ClientId] FOREIGN KEY([o_client_id])
REFERENCES [dbo].[Clients] ([c_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_ClientId]
GO
/****** Object:  StoredProcedure [dbo].[sp_Articul_Orders]    Script Date: 3/2/2023 11:00:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Articul_Orders]
AS 
select
	[Articul] = a.a_name,
	[Order quantity] = count(o.o_id)

from Order_groups a
	left join Orders o on o.o_group_id = a.a_id

group by a.a_id, a.a_name
GO
/****** Object:  StoredProcedure [dbo].[sp_Client_Orders]    Script Date: 3/2/2023 11:00:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Client_Orders]
AS 
select 
 [Client] = c.c_fio,
 [Order quantity] = count(o.o_id)
from Clients c
	left join Orders o on o.o_client_id = c.c_id 
group by c.c_id, c.c_fio 
GO
/****** Object:  StoredProcedure [dbo].[sp_Last_Month_Orders]    Script Date: 3/2/2023 11:00:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Last_Month_Orders]
AS 
select
	[Order date] = o.o_datetime,
	[Client] = c.c_fio,
	[Articul] = a.a_name

from Orders o
	inner join Clients c on c.c_id = o.o_client_id
	inner join Order_Groups a on a.a_id = o.o_group_id
	
where 
	MONTH(o.o_datetime) = MONTH(CURRENT_TIMESTAMP) AND YEAR(o.o_datetime) = YEAR(CURRENT_TIMESTAMP)

order by o.o_datetime
	
GO
USE [master]
GO
--ALTER DATABASE [OrdersDb] SET  READ_WRITE 
--GO
