USE SoftUni

SELECT * FROM Towns
	WHERE LEFT([Name], 1) IN ('M', 'K', 'B', 'E')
	ORDER BY [Name] ASC

	--Second way of solving the problem using 'regex'
SELECT * FROM Towns
	WHERE [Name] LIKE '[MKBE]%'
	ORDER BY [Name] ASC