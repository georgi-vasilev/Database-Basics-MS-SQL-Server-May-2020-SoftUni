USE [Geography]

SELECT TOP(5)
		[Country],
		CASE 
			WHEN [PeakName] IS NULL THEN '(no highest peak)'
			ELSE [PeakName]
			
		END AS [Highest Peak Name],
		CASE
			WHEN [Elevation] IS NULL THEN 0
			ELSE [Elevation]
		END AS [Highest Peak Elevation],
		CASE
			WHEN [MountainRange] IS NULL THEN '(no mountain)'
			ELSE [MountainRange]
		END AS [Mountain]

FROM (
		SELECT *,
			DENSE_RANK() OVER(PARTITION BY [Country] ORDER BY [Elevation] DESC) AS [PeakRank]
			FROM (
					SELECT [CountryName] AS [Country],
						   p.[PeakName],
						   p.[Elevation],
						   m.MountainRange
					FROM Countries AS c
						LEFT JOIN MountainsCountries AS mc ON c.[CountryCode] = mc.[CountryCode]
						LEFT JOIN Mountains AS m ON mc.[MountainId] = m.[Id]
						LEFT JOIN Peaks AS p ON p.[MountainId] = m.[Id]
				  ) AS [FullInfoQuery]
	 ) AS [PeakRankingsQuery]
		WHERE [PeakRank] = 1
			ORDER BY [Country] ASC,
					 [Highest Peak Name] ASC