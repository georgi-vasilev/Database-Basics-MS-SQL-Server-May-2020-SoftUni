USE SoftUni

SELECT TOP(50) e1.[EmployeeID],
		CONCAT(e1.[FirstName], ' ', e1.[LastName]) AS [EmployeeName] ,
		CONCAT(e2.[FirstName], ' ', e2.[LastName]) AS [ManagerName],
		d.[Name] AS [DepartmentName]	
	FROM Employees AS e1
		LEFT JOIN Employees AS e2 ON e1.[ManagerID] = e2.[EmployeeID]
		JOIN Departments AS d ON e1.[DepartmentID] = d.[DepartmentID]
		ORDER BY e1.[EmployeeID]