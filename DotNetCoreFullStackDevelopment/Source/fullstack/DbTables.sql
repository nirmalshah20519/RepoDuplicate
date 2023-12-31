CREATE DATABASE [FullStackExam];

USE [FullStackExam];

CREATE TABLE [ROLE](
	[ID] INT PRIMARY KEY IDENTITY(1,1),
	[RoleName] VARCHAR(25)
);

INSERT INTO [ROLE] VALUES ('Admin'),('Devotee');

CREATE TABLE [USER](
	[ID] INT PRIMARY KEY IDENTITY(1001,1),
	[UserID] VARCHAR(10) NOT NULL,
	[PasswordHash] VARBINARY(MAX),
	[PasswordSalt] VARBINARY(MAX),
	[Email] VARCHAR(100),
	[RoleID] INT FOREIGN KEY REFERENCES [ROLE]([ID]),
	[FirstName] VARCHAR(50) NOT NULL,
	[MiddleName] VARCHAR(50) NOT NULL,
	[LastName] VARCHAR(50) NOT NULL,
	[ProfileURL] NVARCHAR(MAX) NOT NULL,
	[FlatNo] VARCHAR(50) NOT NULL,
	[Street] VARCHAR(50) NOT NULL,
	[City] VARCHAR(50) NOT NULL,
	[State] VARCHAR(50) NOT NULL,
	[Pincode] VARCHAR(6) NOT NULL,
	[InitDate] DATETIME NOT NULL,
	[LastOTP] VARCHAR(6) DEFAULT NULL
);
ALTER TABLE [USER]
ADD [InitDate] DATETIME NOT NULL;

CREATE TABLE [PAYMENTS](
	[ID] INT PRIMARY KEY IDENTITY(101,1),
	[DateOfPayment] DATETIME DEFAULT GETDATE(),
	[Month] INT NOT NULL,
	[Year] INT NOT NULL,
	[UserID] INT FOREIGN KEY REFERENCES [USER]([ID])
);