

USE [BooksServiceApi]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 01.11.2024 19:25:43 ******/
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
/****** Object:  Table [dbo].[BookExemplar]    Script Date: 01.11.2024 19:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookExemplar](
	[Exemplar_Id] [int] IDENTITY(1,1) NOT NULL,
	[Books_Count] [int] NOT NULL,
	[Book_Id] [int] NOT NULL,
	[Exemplar_Price] [int] NOT NULL,
 CONSTRAINT [PK_BookExemplar] PRIMARY KEY CLUSTERED 
(
	[Exemplar_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 01.11.2024 19:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id_Book] [int] IDENTITY(1,1) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[Id_Genre] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Year] [datetime2](7) NOT NULL,
	[Photo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id_Book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 01.11.2024 19:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[Id_Genre] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[Id_Genre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentHistory]    Script Date: 01.11.2024 19:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentHistory](
	[id_Rent] [int] IDENTITY(1,1) NOT NULL,
	[Rental_Start] [datetime2](7) NOT NULL,
	[Rental_Time] [int] NOT NULL,
	[Id_Reader] [int] NOT NULL,
	[Id_Book] [int] NOT NULL,
	[Rental_End] [datetime2](7) NOT NULL,
	[Rental_Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_RentHistory] PRIMARY KEY CLUSTERED 
(
	[id_Rent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241027164106_ddsdadsa', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241027173546_ddsda212', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241027195639_sdsd', N'8.0.10')
GO
SET IDENTITY_INSERT [dbo].[BookExemplar] ON 

INSERT [dbo].[BookExemplar] ([Exemplar_Id], [Books_Count], [Book_Id], [Exemplar_Price]) VALUES (1, 2, 5, 1200)
INSERT [dbo].[BookExemplar] ([Exemplar_Id], [Books_Count], [Book_Id], [Exemplar_Price]) VALUES (2, 1, 8, 1000)
INSERT [dbo].[BookExemplar] ([Exemplar_Id], [Books_Count], [Book_Id], [Exemplar_Price]) VALUES (3, 12, 6, 3100)
INSERT [dbo].[BookExemplar] ([Exemplar_Id], [Books_Count], [Book_Id], [Exemplar_Price]) VALUES (4, 6, 9, 1200)
SET IDENTITY_INSERT [dbo].[BookExemplar] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (1, N'Говоров', 3, N'Горе не в уме', N'повествует нам о сложной жизни', CAST(N'2024-10-03T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (2, N'Кронштейн', 2, N'подземелья и драконы', N'История о похождениях в подземельях и сражениях с драконами', CAST(N'2021-04-04T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (3, N'Толстой', 3, N'Война и мир', N'Эпопея, охватывающая события Наполеоновских войн, исследует жизнь и судьбы нескольких семей, а также философские и моральные вопросы', CAST(N'2024-09-27T14:26:40.4090000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (4, N'Бродский', 5, N'Хроники нарнии', N'антастический роман, в котором переплетаются несколько сюжетных линий, включая визит дьявола в Москву и историю любви Мастера и Маргариты. ', CAST(N'2024-05-01T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (5, N'Говоров', 1, N'Сумерки', N'История о студенте Родионе Раскольникове, который совершает убийство и переживает глубокий внутренний конфликт между моралью и амбициями.', CAST(N'2021-01-10T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (6, N'Пушкин', 1, N'Капитанская дочка', N'Классическая история о любви и предательстве.', CAST(N'2015-01-15T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (7, N'Толстой', 2, N'Воскресение', N'Роман о личной трансформации человека.', CAST(N'2016-02-20T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (8, N'Достоевский', 3, N'Преступление и наказание', N'Глубокое исследование человеческой души.', CAST(N'2016-03-05T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (9, N'Чехов', 4, N'Вишневый сад', N'Комедия о судьбах людей на фоне изменений.', CAST(N'2017-04-10T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (10, N'Булгаков', 5, N'Мастер и Маргарита', N'История о любви и борьбе со злом.', CAST(N'2018-05-25T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (11, N'Гоголь', 6, N'Мертвые души', N'Сатирическая повесть о российском обществе.', CAST(N'2019-06-30T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (12, N'Маяковский', 7, N'Облако в штанах', N'Стихи о любви и революции.', CAST(N'2019-07-18T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (13, N'Бродский', 8, N'Собрание сочинений', N'Лирика о жизни и смерти.', CAST(N'2020-08-12T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (14, N'Есенин', 9, N'Собрание стихотворений', N'Невероятная красота русской природы.', CAST(N'2021-09-05T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (15, N'Лермонтов', 1, N'Герой нашего времени', N'Роман о поисках смысла жизни.', CAST(N'2021-10-14T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (16, N'Акунин', 2, N'Азазель', N'Увлекательный детектив о преступлениях.', CAST(N'2022-11-20T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (17, N'Солженицын', 3, N'Архипелаг ГУЛАГ', N'История о человеческих страданиях.', CAST(N'2022-12-15T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (18, N'Твардовский', 4, N'Василий Тёркин', N'Поэма о правде и честности.', CAST(N'2023-01-17T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (19, N'Шолохов', 5, N'Тихий Дон', N'Эпопея о жизни казаков на фоне войны.', CAST(N'2023-02-28T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (20, N'Распутин', 6, N'Прощание с Матёрой', N'История о силе природы и человека.', CAST(N'2024-03-03T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (21, N'Сименон', 7, N'Жорж Сименон. На дне', N'Детектив о самых темных уголках общества.', CAST(N'2024-04-08T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (22, N'Платонов', 8, N'Чевенгур', N'Роман о народной вере и надежде.', CAST(N'2024-05-20T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (23, N'Генисарет', 1, N'Лето избы', N'Поэтическая проза о простых радостях.', CAST(N'2015-06-10T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (24, N'Драгункин', 2, N'Счастливый конец', N'Комическая история о поисках счастья.', CAST(N'2015-07-23T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (25, N'Набоков', 3, N'Лолита', N'Скандальный роман о запретной любви.', CAST(N'2015-08-15T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (26, N'Шендерович', 4, N'Книга о человеке', N'Сатирический взгляд на современное общество.', CAST(N'2016-09-22T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (27, N'Токарева', 5, N'Как я училась летать', N'История о преодолении и мечте.', CAST(N'2017-10-30T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (28, N'Носов', 6, N'Незнайка на Луне', N'Приключения знаменитого незнайки и его друзей.', CAST(N'2018-11-14T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (29, N'Короленко', 7, N'Слепой музыкант', N'Чувствительная проза о любви к музыке.', CAST(N'2019-12-01T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (30, N'Ремарк', 8, N'На Западном фронте без перемен', N'Повесть о ужасах первой мировой войны.', CAST(N'2020-05-09T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (31, N'Воннегут', 9, N'Сирены Титаника', N'Научная фантастика о путешествиях во времени.', CAST(N'2021-03-18T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (32, N'Андерсен', 1, N'Сказки', N'Классика детской литературы на все времена.', CAST(N'2021-12-25T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (33, N'Хармс', 2, N'Сказки', N'Абсурдные и занимательные истории для взрослых.', CAST(N'2022-08-16T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (34, N'Лобков', 3, N'Все на свете', N'Интроспективный роман о человеческой жизни.', CAST(N'2022-06-02T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (35, N'Караленко', 4, N'Мир без края', N'Фантастика о неизведанных горизонтах.', CAST(N'2023-09-14T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (36, N'Замятин', 5, N'Мы', N'Антиутопия о будущих обществах.', CAST(N'2023-07-21T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (37, N'Гаршин', 6, N'Рассказы', N'Проза о человеческой судьбе и страданиях.', CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (38, N'Лев Толстой', 7, N'Анна Каренина', N'Эта история о любви, страсти и трагедии рассказывает о жизни аристократки Анны Карениной, которая втягивается в роман с молодым офицером', CAST(N'2024-10-02T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (39, N'Иван Бунин', 7, N'Дети Исмэйл', N'Повесть о судьбах людей, стремящихся к счастью и свободе в условиях социальных и исторических изменений', CAST(N'2024-10-06T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (40, N'Анна Ахматова', 6, N'Творение', N'Поэтический футуристический спектакль, исследующий темы любви и времени через абсурд и игру слов.', CAST(N'2024-09-18T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (41, N'Велимир Хлебников', 5, N'Облако в штанах', N'Фантастический роман о визите дьявола в Москву 1930-х годов, затрагивающий темы любви, власти и конфликта добра и зла.', CAST(N'2024-10-08T00:00:00.0000000' AS DateTime2), N'')
INSERT [dbo].[Books] ([Id_Book], [Author], [Id_Genre], [Title], [Description], [Year], [Photo]) VALUES (42, N'string', 1, N'string', N'string', CAST(N'2024-10-25T12:34:56.4330000' AS DateTime2), N'')
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([Id_Genre], [Name]) VALUES (1, N'Фантастика')
INSERT [dbo].[Genre] ([Id_Genre], [Name]) VALUES (2, N'Дэтектив')
INSERT [dbo].[Genre] ([Id_Genre], [Name]) VALUES (3, N'Романтика')
INSERT [dbo].[Genre] ([Id_Genre], [Name]) VALUES (4, N'Научпоп')
INSERT [dbo].[Genre] ([Id_Genre], [Name]) VALUES (5, N'Ужасы')
INSERT [dbo].[Genre] ([Id_Genre], [Name]) VALUES (6, N'Приключения')
INSERT [dbo].[Genre] ([Id_Genre], [Name]) VALUES (7, N'Биография')
INSERT [dbo].[Genre] ([Id_Genre], [Name]) VALUES (8, N'История')
INSERT [dbo].[Genre] ([Id_Genre], [Name]) VALUES (9, N'Поэзия')
INSERT [dbo].[Genre] ([Id_Genre], [Name]) VALUES (10, N'manhwa')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[RentHistory] ON 

INSERT [dbo].[RentHistory] ([id_Rent], [Rental_Start], [Rental_Time], [Id_Reader], [Id_Book], [Rental_End], [Rental_Status]) VALUES (2, CAST(N'2024-10-27T20:36:23.5461811' AS DateTime2), 12, 1, 5, CAST(N'2024-11-08T20:36:23.5462778' AS DateTime2), N'да')
SET IDENTITY_INSERT [dbo].[RentHistory] OFF
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT (N'') FOR [Photo]
GO
ALTER TABLE [dbo].[BookExemplar]  WITH CHECK ADD  CONSTRAINT [FK_BookExemplar_Books_Book_Id] FOREIGN KEY([Book_Id])
REFERENCES [dbo].[Books] ([Id_Book])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookExemplar] CHECK CONSTRAINT [FK_BookExemplar_Books_Book_Id]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Genre_Id_Genre] FOREIGN KEY([Id_Genre])
REFERENCES [dbo].[Genre] ([Id_Genre])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Genre_Id_Genre]
GO
ALTER TABLE [dbo].[RentHistory]  WITH CHECK ADD  CONSTRAINT [FK_RentHistory_Books_Id_Book] FOREIGN KEY([Id_Book])
REFERENCES [dbo].[Books] ([Id_Book])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RentHistory] CHECK CONSTRAINT [FK_RentHistory_Books_Id_Book]
GO
