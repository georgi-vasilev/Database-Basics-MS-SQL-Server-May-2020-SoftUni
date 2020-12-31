USE TripService

SELECT c.[Name] AS [City], COUNT(h.[CityId]) AS [Hotels]
	FROM Cities AS c
		JOIN Hotels AS h ON h.[CityId] = c.[Id]
			GROUP BY c.[Name]
				ORDER BY [Hotels] DESC, [City]