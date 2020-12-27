USE SoftUni

GO

CREATE OR ALTER FUNCTION ufn_IsWordComprised(@setOfLetters NVARCHAR(MAX), @word NVARCHAR(MAX))
RETURNS BIT
AS
BEGIN
	DECLARE @i INT = 1;
	WHILE (@i <= LEN(@word))
		BEGIN
			DECLARE @currentCharacter CHAR = SUBSTRING(@word, @i, 1);
			DECLARE @charIndex INT = CHARINDEX(@currentCharacter, @setOfLetters);

			IF (@charIndex = 0)
				BEGIN 
					RETURN 0;
				END

			SET @i = @i + 1;
		END

		RETURN 1;
END

SELECT dbo.ufn_IsWordComprised('bobr', 'Rob')