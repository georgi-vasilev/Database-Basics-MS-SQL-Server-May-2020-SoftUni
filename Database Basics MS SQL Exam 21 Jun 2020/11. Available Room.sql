USE TripService

GO

CREATE OR ALTER FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATETIME, @People INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	DECLARE @hotelBaseRate INT = (
									SELECT [BaseRate] FROM Hotels
										WHERE [Id] = @HotelId
								 );
	DECLARE @roomPrice INT = (
								SELECT [Price] FROM Rooms
									WHERE HotelId = @HotelId
							 );
	DECLARE @totalCost DECIMAL(18,2) = (@hotelBaseRate + @roomPrice) * @People;

	IF((@Date >= (SELECT TOP(1) [ArrivalDate] FROM Trips WHERE [CancelDate] IS NOT NULL) 
			 AND @Date <= (SELECT TOP(1) [ReturnDate] FROM Trips WHERE [CancelDate] IS NOT NULL)))
	BEGIN
		RETURN 'No rooms available';
	END

	RETURN 0;
END

SELECT dbo.udf_GetAvailableRoom(94, '2015-07-26', 3)