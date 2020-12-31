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
								SELECT TOP(1) [Price] FROM Rooms
									WHERE [HotelId] = @HotelId AND [Beds] >= @People
									ORDER BY [Price] DESC
							 );
	DECLARE @totalPrice DECIMAL(18,2) = (@hotelBaseRate + @roomPrice) * @People;

	DECLARE @Availability INT = (
									SELECT COUNT(*) FROM (SELECT [ArrivalDate], [ReturnDate] FROM Trips AS t
															JOIN Rooms AS r ON r.[Id] = t.[RoomId]
															WHERE ('2011-06-01' BETWEEN [ArrivalDate] AND [ReturnDate]) 
															AND ([CancelDate] IS NOT NULL) AND (r.[HotelId] = @HotelId)) AS dateValidation
								);

	DECLARE @RoomCapacity INT = (
									SELECT TOP(1) [Beds] FROM Rooms
									WHERE [HotelId] = @HotelId AND [Beds] >= @People
									ORDER BY [Price] DESC
								);

	IF(@Availability = 0 AND @RoomCapacity >= @People)
		RETURN 'No rooms available';

	DECLARE @GetRoomId INT = (
								SELECT top(1) [Id] FROM Rooms WHERE [HotelId] = @HotelId AND [Beds] >= @People
									ORDER BY [Price] DESC
							 );
	DECLARE @GetRoomType nvarchar(max) = (
									SELECT [Type] FROM Rooms WHERE [Id] = @GetRoomId
							   );
	DECLARE @GetRoomBeds INT  = (
									SELECT [Beds] FROM Rooms WHERE [Id] = @GetRoomId
								);
	DECLARE @Result VARCHAR(MAX) = CONCAT('Room ', cast(@GetRoomId as nvarchar(max)), ': ',
										  @GetRoomType, ' ', cast(@GetRoomBeds as nvarchar(max)), ' beds', ' - ',
										  cast(@totalPrice as nvarchar(max)));

	RETURN @Result
END
		
GO

SELECT dbo.udf_GetAvailableRoom(19, '2011-06-01', 3)