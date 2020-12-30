CREATE DATABASE [Service]

USE [Service]

CREATE TABLE Users (
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[Username] NVARCHAR(30) UNIQUE NOT NULL,
	[Password] NVARCHAR(30) NOT NULL,
	[Name] NVARCHAR(50),
	[Birthdate] DATETIME,
	[Age] INT CHECK([Age] >= 14 AND [Age] <= 110),
	[Email] NVARCHAR(50) NOT NULL
)

CREATE TABLE Departments (
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50) NOT NULL,
)

CREATE TABLE Employees (
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[FirstName] NVARCHAR(25),
	[LastName] NVARCHAR(25),
	[Birthdate] DATETIME,
	[Age] INT CHECK ([Age] >= 18 AND [Age] <= 110),
	[DepartmentId] INT REFERENCES Departments([Id])
)

CREATE TABLE Categories (
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50) NOT NULL,
	[DepartmentId] INT NOT NULL REFERENCES Departments([Id])
)

CREATE TABLE Status (
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[Label] NVARCHAR(30) NOT NULL,
)

CREATE TABLE Reports (
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[CategoryId] INT NOT NULL REFERENCES Categories([Id]),
	[StatusId] INT NOT NULL REFERENCES Status([Id]),
	[OpenDate] DATETIME NOT NULL,
	[CloseDate] DATETIME,
	[Description] NVARCHAR(200) NOT NULL,
	[UserId] INT NOT NULL REFERENCES Users([Id]),
	[EmployeeId] INT REFERENCES Employees([Id])
)