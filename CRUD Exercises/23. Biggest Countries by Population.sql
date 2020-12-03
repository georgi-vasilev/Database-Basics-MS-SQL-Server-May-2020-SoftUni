USE [Geography]

SELECT TOP(30) [CountryName], [Population] 
	FROM Countries
		ORDER BY [Population] DESC