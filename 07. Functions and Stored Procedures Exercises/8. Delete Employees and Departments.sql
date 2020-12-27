USE SoftUni

GO

CREATE OR ALTER PROCEDURE usp_DeleteEmployeesFromDepartment(@departmentId INT)
AS
BEGIN
	--delete all projects from employeeprojects where employeeid match 
	DELETE FROM EmployeesProjects
		WHERE EmployeeID IN (
								SELECT [EmployeeID] FROM Employees
									WHERE [DepartmentID] = @departmentId
							)
	--set ManagerID where manager is an employee who is going to be deleted for employees
	UPDATE Employees
		SET ManagerID = NULL
			WHERE ManagerID IN (
									SELECT [EmployeeID] FROM Employees
										WHERE [DepartmentID] = @departmentId
							   )
	--alter column ManagerID in Departments table and make it NULLABLE
	ALTER TABLE Departments
	ALTER COLUMN ManagerID INT

	--Set ManagerID to NULL where Manager is Employee who is going to be deleted for deparments
	UPDATE Departments
		SET ManagerID = NULL
			WHERE ManagerID IN (
									SELECT [EmployeeID] FROM Employees
										WHERE [DepartmentID] = @departmentId
							   )
	DELETE FROM Employees
		WHERE [DepartmentID] = @departmentId

	DELETE FROM Departments
		WHERE [DepartmentID] = @departmentId

	SELECT COUNT(*) FROM Employees
		WHERE [DepartmentID] = @departmentId
END

EXEC usp_DeleteEmployeesFromDepartment 1