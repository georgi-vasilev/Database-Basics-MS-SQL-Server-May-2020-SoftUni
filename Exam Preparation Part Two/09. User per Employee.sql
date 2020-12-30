USE [Service]

SELECT CONCAT([FirstName], ' ' ,[LastName]) AS [FullName],
	   COUNT(DISTINCT UserId) AS [UsersCount]
	FROM Reports AS r
		RIGHT JOIN Employees AS e ON  e.[Id] = r.[EmployeeId]
			GROUP BY r.[EmployeeId], e.[FirstName], e.[LastName]
			ORDER BY [UsersCount] DESC, [FullName] ASC