USE Bank

GO

CREATE OR ALTER FUNCTION ufn_CalculateFutureValue(@sum DECIMAL(18, 4), @yir FLOAT, @yearsCount INT)
RETURNS DECIMAL(18, 4)
AS
BEGIN
	DECLARE @futureValue DECIMAL(18, 4)
	
	SET @futureValue = @sum * POWER((1 + @yir), @yearsCount);

	RETURN @futureValue
END

SELECT dbo.ufn_CalculateFutureValue(1000, 0.1, 5)