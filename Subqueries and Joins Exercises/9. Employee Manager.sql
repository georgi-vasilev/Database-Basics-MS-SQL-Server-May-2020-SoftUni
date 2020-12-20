USE SoftUni

SELECT e2.[EmployeeID], e2.[FirstName], e2.[ManagerID], e1.[FirstName] AS [ManagerName]
FROM Employees AS e1
	JOIN Employees AS e2 ON e1.[EmployeeID] = e2.[ManagerID]
		WHERE e1.[EmployeeID] IN (3,7)
		ORDER BY e2.[EmployeeID] ASC