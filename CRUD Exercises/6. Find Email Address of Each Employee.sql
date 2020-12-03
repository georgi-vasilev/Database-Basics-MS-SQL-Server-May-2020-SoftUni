USE [SoftUni]

SELECT ([FirstName] + '.' + [LastName] + '@softuni.bg') AS [Full Email Address]
	FROM Employees

--Second variation of solving the given problem with a built-in function
SELECT CONCAT([FirstName], '.', [LastName] ,'@','softuni.bg') AS [Full Email Address] 
	FROM Employees