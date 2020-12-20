USE [Geography]

SELECT TOP(5) [CountryName],
			  MAX(p.[Elevation]) AS [Highest Peak Elevation],
	          MAX(r.[Length]) AS [Longest River Length]
		FROM Countries AS c
			LEFT JOIN CountriesRivers AS cr ON cr.[CountryCode] = c.[CountryCode]
			LEFT JOIN Rivers AS r ON cr.[RiverId] = r.[Id]
			LEFT JOIN MountainsCountries AS mc ON c.[CountryCode] = mc.[CountryCode]
			LEFT JOIN Mountains AS m ON mc.[MountainId] = m.[Id]
			LEFT JOIN Peaks AS p on p.[MountainId] = m.[Id]
				GROUP BY c.[CountryName]
					ORDER BY [Highest Peak Elevation] DESC,
							 [Longest River Length] DESC,
							 [CountryName] ASC