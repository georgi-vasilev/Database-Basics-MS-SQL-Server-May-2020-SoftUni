USE Gringotts

SELECT TOP(2) [DepositGroup] 
	FROM (
			SELECT [DepositGroup], AVG([MagicWandSize]) AS [AverangeWandSize]
				FROM WizzardDeposits
					GROUP BY [DepositGroup]
		 ) AS [AverageWandSizeQuery]
			ORDER BY [AverangeWandSize]