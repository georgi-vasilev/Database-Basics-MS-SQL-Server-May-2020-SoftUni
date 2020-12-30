USE [Service]

GO

CREATE OR ALTER PROCEDURE usp_AssignEmployeeToReport(@EmployeeId INT, @ReportId INT)
AS
BEGIN
	DECLARE @EmployeeDepartmentId INT = (
											SELECT DepartmentId FROM Employees
												WHERE [Id] = @EmployeeId
										);
	
	DECLARE @ReportDepartmentId INT = (
											SELECT c.[DepartmentId] FROM Reports AS r
												JOIN Categories AS c ON c.[Id] = r.[CategoryId]
												WHERE r.[Id] = @ReportId
									  );

	IF(@EmployeeDepartmentId != @ReportDepartmentId)
		THROW 50000, 'Employee doesn''t belong to the appropriate department!', 1;

	UPDATE Reports
		SET [EmployeeId] = @EmployeeId
			WHERE [Id] = @ReportId
END

GO

EXEC usp_AssignEmployeeToReport 30, 1

GO

EXEC usp_AssignEmployeeToReport 17, 2