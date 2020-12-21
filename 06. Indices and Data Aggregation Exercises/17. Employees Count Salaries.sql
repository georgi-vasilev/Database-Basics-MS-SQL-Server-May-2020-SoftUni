USE SoftUni

SELECT COUNT(*) AS [Count] 
	FROM Employees AS employee
		GROUP BY [ManagerID]
			HAVING [ManagerID] IS NULL