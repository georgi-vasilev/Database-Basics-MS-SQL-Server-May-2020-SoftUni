CREATE DATABASE OnlineStoreDatabase

USE OnlinestoreDatabase

CREATE TABLE Cities(
	[CityID] INT IDENTITY(1, 1) PRIMARY KEY,
	[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Customers(
	[CustomerID] INT IDENTITY(1, 1) PRIMARY KEY,
	[Name] VARCHAR(50) NOT NULL,
	[Birthday] DATETIME2 NOT NULL,
	[CityID] INT NOT NULL FOREIGN KEY REFERENCES Cities(CityID)
)

CREATE TABLE ItemTypes(
	[ItemID] INT IDENTITY(1, 1) PRIMARY KEY,
	[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Items(
	[ItemID] INT IDENTITY(1, 1) PRIMARY KEY,
	[Name] VARCHAR(50) NOT NULL,
	[ItemTypeID] INT NOT NULL FOREIGN KEY REFERENCES ItemTypes(ItemID)
)

CREATE TABLE Orders(
	[OrderID] INT IDENTITY(1, 1) PRIMARY KEY,
	[CustomerID] INT NOT NULL FOREIGN KEY REFERENCES Customers(CustomerID)
)

CREATE TABLE OrderItems(
	[OrderID] INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderID),
	[ItemID] INT NOT NULL FOREIGN KEY REFERENCES Items(ItemID),
	PRIMARY KEY(OrderID, ItemID)
)
