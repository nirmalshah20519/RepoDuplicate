﻿USE BookMyShow;

CREATE TABLE [ROLE](
	[RoleID] INT PRIMARY KEY IDENTITY(1,1),
	[Role] VARCHAR(255) NOT NULL,
);

CREATE TABLE [USER](
	[UserID] INT PRIMARY KEY IDENTITY(1001,1),
	[FirstName] VARCHAR(255) NOT NULL,
	[LastName] VARCHAR(255) NOT NULL,
	[DOB] DATE NOT NULL,
	[Email] VARCHAR(255),
	[PhoneNo] VARCHAR(10),
	[PasswordHash] VARBINARY(MAX),
	[PasswordSalt] VARBINARY(MAX),
	[RoleID] INT FOREIGN KEY REFERENCES [Role]([RoleID]),
	[CreateDate] DATETIME DEFAULT GETDATE(),
	[UpdateDate] DATETIME DEFAULT GETDATE()
);

--ALTER TABLE [USER]
--ADD [RoleID] INT FOREIGN KEY REFERENCES [Role]([RoleID])

 --#################   MOVIES

CREATE TABLE [MOVIE](
	[ID] INT PRIMARY KEY IDENTITY(101,1),
	[Name] VARCHAR(255) NOT NULL,
	[Description] VARCHAR(MAX) NOT NULL,
	[Duration] VARCHAR(255) NOT NULL,
	[IMDB_Rating] DECIMAL(2,1),
	[ReleaseDate] DATE,
	[PosterLink] NVARCHAR(MAX),
	[TrailerLink] NVARCHAR(MAX),
	[CreateDate] DATETIME DEFAULT GETDATE(),
	[UpdateDate] DATETIME DEFAULT GETDATE(),
	[CreatedByID] INT FOREIGN KEY REFERENCES [USER]([UserID]),
	[UpdateByID] INT FOREIGN KEY REFERENCES [USER]([UserID])
);

CREATE TABLE [ObjectType](
	[ID] INT PRIMARY KEY IDENTITY(1,1),
	[TypeName] VARCHAR(255) NOT NULL
);

CREATE TABLE [ObjectName](
	[ID] INT PRIMARY KEY IDENTITY(1,1),
	[TypeName] VARCHAR(255) NOT NULL,
	[TypeID] INT FOREIGN KEY REFERENCES [ObjectType]([ID]),
);

CREATE TABLE MovieObjects(
	[ID] INT PRIMARY KEY IDENTITY(1,1),
	[MovieID] INT FOREIGN KEY REFERENCES [MOVIE]([ID]),
	[ObjectID] INT FOREIGN KEY REFERENCES [ObjectName]([ID]),
	[ObjectTypeID] INT FOREIGN KEY REFERENCES [ObjectType]([ID])

);

--ALTER TABLE MovieObjects
--ADD [ObjectTypeID] INT FOREIGN KEY REFERENCES [ObjectType]([ID]);

--CREATE TABLE [GENRE](
--	[ID] INT PRIMARY KEY IDENTITY(1,1),
--	[Name] VARCHAR(255) NOT NULL
--);

--CREATE TABLE [LANGUAGE](
--	[ID] INT PRIMARY KEY IDENTITY(1,1),
--	[Name] VARCHAR(255) NOT NULL
--);

--CREATE TABLE [MOVIE_GENRE](
--	[ID] INT PRIMARY KEY IDENTITY(1,1),
--	[MovieID] INT FOREIGN KEY REFERENCES [MOVIE]([ID]),
--	[GenreID] INT FOREIGN KEY REFERENCES [GENRE]([ID])
--);

--CREATE TABLE [MOVIE_LANGUAGE](
--	[ID] INT PRIMARY KEY IDENTITY(1,1),
--	[MovieID] INT FOREIGN KEY REFERENCES [MOVIE]([ID]),
--	[LanguageID] INT FOREIGN KEY REFERENCES [LANGUAGE]([ID])
--);

CREATE TABLE [CAST](
	[ID] INT PRIMARY KEY IDENTITY(101,1),
	[Name] VARCHAR(255) NOT NULL,
	[Gender] VARCHAR(255) NOT NULL CHECK([Gender] IN ('Male','Female')),
	[DOB] DATE NOT NULL,
	[Description] VARCHAR(MAX) NOT NULL,
	[City] VARCHAR(255) NOT NULL,
	[State] VARCHAR(255) NOT NULL,
	[Country] VARCHAR(255) NOT NULL,
	[CreateDate] DATETIME DEFAULT GETDATE(),
	[UpdateDate] DATETIME DEFAULT GETDATE(),
	[CreatedByID] INT FOREIGN KEY REFERENCES [USER]([UserID]),
	[UpdateByID] INT FOREIGN KEY REFERENCES [USER]([UserID])
);


 --#################  THEATRES

 CREATE TABLE [THEATRE](
	[ID] INT PRIMARY KEY IDENTITY(11,1),
	[Name] VARCHAR(255) NOT NULL,
	[Street] VARCHAR(255) NOT NULL,
	[City] VARCHAR(255) NOT NULL,
	[State] VARCHAR(255) NOT NULL,
	[Country] VARCHAR(255) NOT NULL,
	[CreateDate] DATETIME DEFAULT GETDATE(),
	[UpdateDate] DATETIME DEFAULT GETDATE(),
	[CreatedByID] INT FOREIGN KEY REFERENCES [USER]([UserID]),
	[UpdateByID] INT FOREIGN KEY REFERENCES [USER]([UserID])
);

 CREATE TABLE [FACILITY](
	[ID] INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(255) NOT NULL,
	[Icon] NVARCHAR(MAX) NOT NULL,
);

 CREATE TABLE [THEATRE FACILITY](
	[ID] INT PRIMARY KEY IDENTITY(1,1),
	[TheatureID] INT FOREIGN KEY REFERENCES [THEATRE]([ID]),
	[FacilityID] INT FOREIGN KEY REFERENCES [FACILITY]([ID])
);

 --#################  SCREENS
 CREATE TABLE [SCREEN_TYPE](
	[ID] INT PRIMARY KEY IDENTITY(1,1),
	[NAME] VARCHAR(255) NOT NULL,
	[FACTOR] DECIMAL(1,1) DEFAULT 1,
);

  CREATE TABLE [SCREEN](
	[ID] INT PRIMARY KEY IDENTITY(101,1),
	[Name] VARCHAR(255) NOT NULL,
	[TheaterID] INT FOREIGN KEY REFERENCES [THEATRE]([ID]),
	[ScreenTypeID] INT FOREIGN KEY REFERENCES [SCREEN_TYPE]([ID]),
	[CreatedByID] INT FOREIGN KEY REFERENCES [USER]([UserID]),
	[UpdateByID] INT FOREIGN KEY REFERENCES [USER]([UserID]),
	[CreateDate] DATETIME DEFAULT GETDATE(),
	[UpdateDate] DATETIME DEFAULT GETDATE()
);



CREATE TABLE [SEAT_TYPE](
	[ID] INT PRIMARY KEY IDENTITY(1,1),
	[NAME] VARCHAR(255) NOT NULL,
);

CREATE TABLE [LAYOUT](
	[ID] INT PRIMARY KEY IDENTITY(1,1),
	[ScreenID] INT FOREIGN KEY REFERENCES [SCREEN]([ID]),
	[ROW] VARCHAR(2) NOT NULL,
	[COL] INT NOT NULL,
	[BasePrice] INT NOT NULL,
	[SeatTypeID] INT FOREIGN KEY REFERENCES [SEAT_TYPE]([ID])
);


 --#################  BATCHES

 CREATE TABLE [BATCH](
	[ID] INT PRIMARY KEY IDENTITY(101,1),
	[ScreenID] INT FOREIGN KEY REFERENCES [SCREEN]([ID]),
	[MovieID] INT FOREIGN KEY REFERENCES [MOVIE]([ID]),
	[ShowTime] DATETIME NOT NULL,
	[FACTOR] DECIMAL(1,1) DEFAULT 1,
	[CreateDate] DATETIME DEFAULT GETDATE(),
	[UpdateDate] DATETIME DEFAULT GETDATE(),
	[CreatedByID] INT FOREIGN KEY REFERENCES [USER]([UserID]),
	[UpdateByID] INT FOREIGN KEY REFERENCES [USER]([UserID])
 );

 CREATE TABLE [BATCH_STATUS](
	[ID] INT PRIMARY KEY IDENTITY(1,1),
	[BatchID] INT FOREIGN KEY REFERENCES [BATCH]([ID]),
	[ROW] VARCHAR(2) NOT NULL,
	[COL] INT NOT NULL,
	[BatchPrice] INT NOT NULL,
	[IsBooked] BIT NOT NULL DEFAULT 0,
 );

 CREATE TABLE [BOOKED_TICKETS](
	[ID] INT PRIMARY KEY IDENTITY(1,1),
	[BatchID] INT FOREIGN KEY REFERENCES [BATCH]([ID]),
	[UserID] INT FOREIGN KEY REFERENCES [USER]([UserID]),
	[Amount] DECIMAL(5,2),
	[CreateDate] DATETIME DEFAULT GETDATE(),
	[UpdateDate] DATETIME DEFAULT GETDATE(),
	[CreatedByID] INT FOREIGN KEY REFERENCES [USER]([UserID]),
	[UpdateByID] INT FOREIGN KEY REFERENCES [USER]([UserID]),
	[Status] VARCHAR(MAX)
 );

 CREATE TABLE [BookedSeat](
	[ID] INT PRIMARY KEY IDENTITY(101,1),
	[TicketID] INT FOREIGN KEY REFERENCES [BOOKED_TICKETS]([ID]),
	[ROW] VARCHAR(2) NOT NULL,
	[COL] INT NOT NULL,
	[Rate] DECIMAL(5,2)
 );