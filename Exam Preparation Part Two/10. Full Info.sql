USE [Service]

SELECT ISNULL(e.[FirstName] + ' ' + e.[LastName], 'None') AS [Employee],
       ISNULL(d.[Name], 'None')  AS [Department],
	   ISNULL(c.[Name], 'None' )AS [Category],
	   r.[Description],
	   FORMAT(r.[OpenDate], 'dd.MM.yyyy') AS [OpenDate],
	   s.[Label] AS [Status],
	   ISNULL(u.[Name], 'None') AS [User]
FROM Reports AS r
	LEFT JOIN Employees AS e ON  e.[Id] = r.[EmployeeId]
		LEFT JOIN Categories AS c ON c.[Id] = r.[CategoryId]
			LEFT JOIN Departments AS d ON d.[Id] = e.[DepartmentId]
				LEFT JOIN [Status] AS s ON s.[Id] = r.[StatusId]
					LEFT JOIN Users AS u ON u.[Id] = r.[UserId]
						ORDER BY e.[FirstName] DESC,
								 e.[LastName] DESC,
								 d.[Name] ASC,
								 c.[Name] ASC,
								 r.[Description] ASC,
								 r.[OpenDate] ASC,
								 s.[Label] ASC,
								 u.[Name] ASC