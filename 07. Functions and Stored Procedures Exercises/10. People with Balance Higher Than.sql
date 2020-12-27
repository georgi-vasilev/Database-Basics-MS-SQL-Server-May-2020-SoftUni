USE Bank

GO

CREATE OR ALTER PROCEDURE usp_GetHoldersWithBalanceHigherThan(@minBalance DECIMAL(18, 4))
AS
BEGIN
	SELECT ah.[FirstName], ah.[LastName]
		FROM Accounts AS a
			JOIN AccountHolders AS ah ON a.[AccountHolderId] = ah.[Id]
				GROUP BY ah.[FirstName], ah.[LastName]
				HAVING SUM(a.[Balance]) > @minBalance
				ORDER BY ah.[FirstName] ,ah.[LastName]
END

EXEC usp_GetHoldersWithBalanceHigherThan 25000