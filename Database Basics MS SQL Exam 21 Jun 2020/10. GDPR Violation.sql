USE TripService

SELECT act.[TripId], 
	   CONCAT(a.[FirstName], ' ', a.[MiddleName], ' ', a.[LastName]) AS [Full Name],
	   ac.[Name] AS [From],
	   hc.[Name] AS [To],
	   IIF(t.[CancelDate] IS NULL, CONCAT(DATEDIFF(DAY, t.[ArrivalDate], t.[ReturnDate]),
	   ' days'), 'Canceled') AS [Duration]
FROM AccountsTrips AS act
	JOIN Accounts AS a ON act.[AccountId] = a.[Id]
		JOIN Trips AS t ON act.[TripId] = t.[Id]
			JOIN Cities AS ac ON a.[CityId] = ac.[Id]
				JOIN Rooms AS r ON t.[RoomId] = r.[Id]
					JOIN Hotels AS h ON r.[HotelId] = h.[Id]
						JOIN Cities AS hc ON h.[CityId] = hc.[Id]
							ORDER BY [Full Name], act.[TripId]