USE [master]
GO
/****** Object:  Database [CrudOperation_MvcCore]    Script Date: 25/5/2020 23:59:00 ******/
CREATE DATABASE [CrudOperation_MvcCore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CrudOperation_MvcCore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CrudOperation_MvcCore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CrudOperation_MvcCore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CrudOperation_MvcCore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CrudOperation_MvcCore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CrudOperation_MvcCore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CrudOperation_MvcCore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET ARITHABORT OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET  MULTI_USER 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CrudOperation_MvcCore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CrudOperation_MvcCore] SET QUERY_STORE = OFF
GO
USE [CrudOperation_MvcCore]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 25/5/2020 23:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](60) NOT NULL,
	[Gender] [varchar](60) NOT NULL,
	[Class] [varchar](60) NOT NULL,
	[Adress] [varchar](60) NOT NULL,
	[Note] [varchar](60) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateNewStudent]    Script Date: 25/5/2020 23:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		FacuAgustin
-- Description:	Create New Student
-- =============================================
CREATE PROCEDURE [dbo].[SP_CreateNewStudent]
(
   @Name varchar(60)='',
   @Gender varchar(60)='',
   @Class varchar(60)='',
   @Adress varchar(60)='',
   @Note varchar(60)=''

)
AS
BEGIN
	INSERT INTO Student (Name,Gender,Class,Adress,Note)
	VALUES (@Name,@Gender,@Class,@Adress,@Note)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteStudent]    Script Date: 25/5/2020 23:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		FacuAgustin
-- Description:	Delete Student
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteStudent]
(
   @Id int=0
)
AS
BEGIN
	DELETE FROM Student
	WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllStudent]    Script Date: 25/5/2020 23:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		FacuAgustin
-- Description:	Get All Student
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetAllStudent]
AS
BEGIN
	SELECT * FROM Student
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetByStudentId]    Script Date: 25/5/2020 23:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		FacuAgustin
-- Description:	Get All Student by Id
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetByStudentId]
(
   @Id int=0
)
AS
BEGIN
	SELECT * FROM Student
	WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateStudent]    Script Date: 25/5/2020 23:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		FacuAgustin
-- Description:	Update Student
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateStudent]
(
   @Id int=0,
   @Name varchar(60)='',
   @Gender varchar(60)='',
   @Class varchar(60)='',
   @Adress varchar(60)='',
   @Note varchar(60)=''

)
AS
BEGIN
	UPDATE Student SET Name=@Name,Gender=@Gender,Class=@Class,Adress=@Adress,Note=@Note
	WHERE Id=@Id
END
GO
USE [master]
GO
ALTER DATABASE [CrudOperation_MvcCore] SET  READ_WRITE 
GO
