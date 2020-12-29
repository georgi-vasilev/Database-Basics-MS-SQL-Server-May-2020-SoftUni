USE Airport

SELECT pl.[Name], pl.[Seats], COUNT(t.[PassengerId]) AS [Passengers Count]
	FROM Planes AS pl
		LEFT JOIN Flights AS f ON f.[PlaneId] = pl.[Id]
			LEFT JOIN Tickets AS t ON t.[FlightId] = f.[Id]
				GROUP BY pl.[Name], pl.[Seats]
					ORDER BY [Passengers Count] DESC, pl.[Name], pl.[Seats]