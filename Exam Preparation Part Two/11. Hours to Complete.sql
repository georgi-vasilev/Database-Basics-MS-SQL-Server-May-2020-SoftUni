USE [Service]

GO

CREATE OR ALTER FUNCTION udf_HoursToComplete(@StartDate DATETIME, @EndDate DATETIME)
RETURNS INT
AS
BEGIN
	IF(@StartDate IS NULL)
		RETURN 0;

	IF(@EndDate IS NULL)
		RETURN 0;

	DECLARE @result INT = DATEDIFF(HOUR, @StartDate, @EndDate);

	RETURN @result;
END

GO

SELECT dbo.udf_HoursToComplete(OpenDate, CloseDate)
	FROM Reports