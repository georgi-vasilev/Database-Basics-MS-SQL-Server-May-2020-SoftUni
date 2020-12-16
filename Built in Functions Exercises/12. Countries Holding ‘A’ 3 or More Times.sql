USE [Geography]

SELECT [CountryName] AS [Country Name], [ISOCode] AS [ISO Code] 
	FROM Countries
		WHERE [CountryName] LIKE '%a%a%a%'
		ORDER BY [IsoCode]