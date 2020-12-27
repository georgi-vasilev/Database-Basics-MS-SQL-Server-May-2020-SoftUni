USE SoftUni

GO

CREATE OR ALTER FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18, 4))
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @salaryLevel VARCHAR(7);

	IF (@salary < 30000)
		BEGIN
			SET @salaryLevel = 'Low';
		END
	ELSE IF (@salary >= 30000 AND @salary <= 50000)
		BEGIN
			SET @salaryLevel = 'Average';
		END
	ELSE
		BEGIN
			SET @salaryLevel = 'High';
		END

	RETURN @salaryLevel
END

GO

SELECT [FirstName],
	   [LastName],
	   dbo.ufn_GetSalaryLevel([Salary]) AS [SalaryLevel]
FROM Employees