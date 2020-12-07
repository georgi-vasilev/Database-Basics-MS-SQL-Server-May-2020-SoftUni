USE TableRelationsExercise

CREATE TABLE Passports(
[PassportID] INT IDENTITY(101,1) PRIMARY KEY,
[PassportNumber] CHAR(8) NOT NULL
)

CREATE TABLE Persons(
[PersonID] INT IDENTITY(1,1) PRIMARY KEY,
[FirstName] NVARCHAR(50) NOT NULL,
[Salary] DECIMAL(7,2) NOT NULL,
[PassportID] INT NOT NULL FOREIGN KEY REFERENCES Passports(PassportID) UNIQUE
)

INSERT INTO Passports([PassportNumber])
	VALUES
		('N34FG21B'),
		('K65LO4R7'),
		('ZE657QP2')

INSERT INTO Persons([FirstName], [Salary],[PassportID])
	VALUES
		('Roberto', 43300, 102),
		('Tom', 56100, 103),
		('Yana', 60200, 101)