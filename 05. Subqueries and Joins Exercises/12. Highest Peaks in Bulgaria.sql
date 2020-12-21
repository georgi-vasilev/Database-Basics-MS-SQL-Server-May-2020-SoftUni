USE [Geography]

SELECT c.[CountryCode], m.[MountainRange], p.[PeakName], p.[Elevation] 
	FROM MountainsCountries AS mc
		JOIN Countries AS c ON c.[CountryCode] = mc.[CountryCode]
		JOIN Mountains AS m ON mc.[MountainId] = m.[Id]
		JOIN PEAKS AS p ON p.MountainId = m.Id
			WHERE c.[CountryCode] = 'BG' AND p.[Elevation] > 2835
			ORDER BY p.[Elevation] DESC