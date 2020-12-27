USE SoftUni

GO

CREATE OR ALTER PROCEDURE usp_GetTownsStartingWith(@startingString VARCHAR(50))
AS
BEGIN
	SELECT [Name]
		FROM Towns
			WHERE SUBSTRING([Name], 1, LEN(@startingString)) = @startingString
END

EXEC usp_GetTownsStartingWith 'b'