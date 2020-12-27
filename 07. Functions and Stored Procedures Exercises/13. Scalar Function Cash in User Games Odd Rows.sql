USE Diablo

GO

CREATE OR ALTER FUNCTION ufn_CashInUsersGames(@gameName NVARCHAR(50))
RETURNS TABLE
AS
RETURN SELECT (
				SELECT SUM([Cash]) AS [Cash] 
					FROM(
							SELECT g.[Name],
								   ug.[Cash],
								   ROW_NUMBER() OVER (PARTITION BY g.[Name] ORDER BY ug.[Cash] DESC) AS [RowNumber]
								FROM Games AS g
									JOIN UsersGames AS ug ON g.[Id] = ug.[GameId]
										WHERE g.[Name] = @gameName
						) AS [RowNumberQuery]
						WHERE [RowNumber]% 2 <> 0
			  ) AS [SumCash]

SELECT * FROM dbo.ufn_CashInUsersGames('Love in a mist')