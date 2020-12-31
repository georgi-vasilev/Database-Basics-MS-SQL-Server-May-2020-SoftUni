USE TripService

SELECT DISTINCT a.[Id] AS [AccountId],
	   CONCAT(a.[FirstName], ' ', a.[LastName]) AS [FullName],
	   (SELECT TOP(1) DATEDIFF(DAY, [ArrivalDate], [ReturnDate]) AS [LongestTrip] FROM Trips
			ORDER BY [LongestTrip] DESC) AS [LongestTrip],
		(SELECT TOP(1) DATEDIFF(DAY, [ArrivalDate], [ReturnDate]) AS [ShortestTrip] FROM Trips
			ORDER BY [ShortestTrip] ASC) AS [ShortestTrip]
	FROM Accounts AS a
		JOIN AccountsTrips AS act ON act.[AccountId] = a.[Id]
			JOIN Trips AS t ON t.[Id] = act.[TripId]
				WHERE a.[MiddleName] IS NULL AND t.[CancelDate] IS NULL
					ORDER BY [LongestTrip] DESC, [ShortestTrip] ASC