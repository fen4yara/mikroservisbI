USE [PhotoServiceApi]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 01.11.2024 19:24:51 ******/
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
/****** Object:  Table [dbo].[Photos]    Script Date: 01.11.2024 19:24:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
	[UploadedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Photos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241026202552_third', N'8.0.10')
GO
SET IDENTITY_INSERT [dbo].[Photos] ON 

INSERT [dbo].[Photos] ([Id], [Name], [Url], [UploadedAt]) VALUES (4, N'photo.png', N'https://localhost:7270/photos/photo.png', CAST(N'2024-10-26T23:27:58.5931458' AS DateTime2))
INSERT [dbo].[Photos] ([Id], [Name], [Url], [UploadedAt]) VALUES (5, N'customer-support.png', N'https://localhost:7270/photos/customer-support.png', CAST(N'2024-10-26T23:28:59.0892076' AS DateTime2))
INSERT [dbo].[Photos] ([Id], [Name], [Url], [UploadedAt]) VALUES (1004, N'photo.png', N'https://localhost:7270/photos/photo.png', CAST(N'2024-10-27T22:38:07.2120026' AS DateTime2))
INSERT [dbo].[Photos] ([Id], [Name], [Url], [UploadedAt]) VALUES (2002, N'Logo.png', N'https://localhost:7270/photos/Logo.png', CAST(N'2024-10-29T09:22:30.3475588' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Photos] OFF
GO
