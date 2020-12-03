USE [SoftUni]

GO

CREATE VIEW V_EmployeeNameJobTitle
	AS
		(SELECT CONCAT([FirstName],' ',ISNULL([Middlename], ''),' ', [LastName]) AS [Full Name],
				[JobTitle] AS [Job Title]
					FROM Employees)