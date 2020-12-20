USE SoftUni

SELECT MIN([AverageSalary]) AS [MinAverageSalary] 
		FROM (SELECT [DepartmentID], AVG([Salary]) AS [AverageSalary] 
					FROM Employees
						GROUP BY [DepartmentID]
			  ) AS [AverageSalaryQuery]

-- A way to solve the problem without subquery

SELECT TOP(1) AVG([Salary]) AS [MinAverageSalary]
	FROM Employees
		GROUP BY [DepartmentID]
			ORDER BY [MinAverageSalary] ASC