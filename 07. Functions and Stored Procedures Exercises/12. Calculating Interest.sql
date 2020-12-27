USE Bank

GO

CREATE OR ALTER PROCEDURE usp_CalculateFutureValueForAccount
AS
BEGIN
	SELECT ah.[Id] AS [Account Id],
		   ah.[FirstName], ah.[LastName],
	       a.[Balance] AS [Current Balance],
	       dbo.ufn_CalculateFutureValue(a.[Balance], 0.1, 5) AS [Balance in 5 years]
		FROM AccountHolders AS ah
			JOIN Accounts AS a ON a.[AccountHolderId] = ah.[Id]
END

EXEC usp_CalculateFutureValueForAccount