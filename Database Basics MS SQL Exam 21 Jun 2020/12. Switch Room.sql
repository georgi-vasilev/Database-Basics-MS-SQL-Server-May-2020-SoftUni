USE TripService

GO

CREATE OR ALTER PROCEDURE usp_SwitchRoom(@TripId INT, @TargetRoomId INT)
AS
BEGIN
	DECLARE @CurrentRoomCapacity INT = (SELECT TOP(1) r.[Beds] FROM AccountsTrips AS act
										JOIN Trips AS t ON t.[Id] = act.[TripId]
										JOIN Rooms AS r ON r.[Id] = t.[RoomId]
										JOIN Hotels AS h ON r.[HotelId] = h.[Id]
											WHERE t.[Id] = @TripId);
	
	DECLARE @TargetRoomCapacity INT = (SELECT [Beds] FROM Rooms WHERE [Id] = @TargetRoomId);

	
	DECLARE @CurretRoomHotel INT = (SELECT TOP(1) r.[HotelId] FROM AccountsTrips AS act
										JOIN Trips AS t ON t.[Id] = act.[TripId]
										JOIN Rooms AS r ON r.[Id] = t.[RoomId]
										JOIN Hotels AS h ON r.[HotelId] = h.[Id]
											WHERE t.[Id] = @TripId);

	DECLARE @TargetRoomHotel INT = (SELECT [HotelId] FROM Rooms WHERE [Id] = @TargetRoomId);

	IF(@CurretRoomHotel != @TargetRoomHotel)
		THROW 50001, 'Target room is in another hotel!', 1;

	IF(@CurrentRoomCapacity > @TargetRoomCapacity)
		THROW 50000, 'Not enough beds in target room!', 1;

	

	UPDATE Trips
		SET [RoomId] = @TargetRoomId
		WHERE [Id] = @TripId
END

GO
--the following example in the doc is incorrect. if we make a query
--we can clearly see that the target room's capacity is less than the
--one we have at the trip
--so that the target room should be with Id=10
EXEC usp_SwitchRoom 10, 11
SELECT RoomId FROM Trips WHERE Id = 10


GO
EXEC usp_SwitchRoom 10, 7

GO
EXEC usp_SwitchRoom 10, 8

