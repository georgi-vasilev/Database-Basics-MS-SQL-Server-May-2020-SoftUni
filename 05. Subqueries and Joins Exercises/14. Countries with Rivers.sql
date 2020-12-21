USE [Geography]

SELECT TOP(5) cn.[CountryName],
			  r.[RiverName] 
	FROM Continents AS c
		JOIN Countries AS cn ON c.[ContinentCode] = cn.[ContinentCode]
		LEFT JOIN CountriesRivers AS cr ON cn.[CountryCode] = cr.[CountryCode]
		LEFT JOIN Rivers AS r ON cr.[RiverId] = r.[Id]
			WHERE c.[ContinentName] = 'Africa'
			ORDER BY cn.[CountryName] ASC
