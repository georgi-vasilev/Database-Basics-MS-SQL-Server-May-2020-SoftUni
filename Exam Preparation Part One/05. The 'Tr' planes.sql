USE Airport

SELECT * FROM Planes
	WHERE [Name] Like '%tr%'
		ORDER BY [Id], [Name], [Seats], [Range]