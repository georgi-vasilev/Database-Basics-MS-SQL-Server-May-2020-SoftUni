USE TripService

SELECT a.[Id],
	   a.[Email],
	   ac.[Name],
	   COUNT(act.TripId) AS [Trips]
FROM AccountsTrips AS act
	JOIN Accounts AS a ON a.[Id] = act.[AccountId]
	JOIN Trips AS t ON t.[Id] = act.[TripId]
	JOIN Cities AS ac ON ac.[Id] = a.[CityId]
		JOIN Rooms AS r ON r.[Id] = t.[RoomId]
		JOIN Hotels AS h ON h.[Id] = r.[HotelId]
		JOIN Cities AS hmc ON hmc.[Id] = h.[CityId]
			WHERE hmc.[Id] = a.[CityId]
			GROUP BY ac.[Name], a.[Email], a.[Id]
			ORDER BY [Trips] DESC, a.[Id]