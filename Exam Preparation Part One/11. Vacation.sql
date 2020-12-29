USE Airport

GO

CREATE OR ALTER FUNCTION ufn_CalculateTickets(@origin VARCHAR(50), @destination VARCHAR(50), @peopleCount INT)
RETURNS VARCHAR(70)
AS
BEGIN
	IF (@peopleCount <= 0 )
		BEGIN
			RETURN 'Invalid people count!';
		END
	DECLARE @flightId INT = (
								SELECT TOP(1) [Id] FROM Flights
									WHERE [Origin] = @origin AND [Destination] = @destination
							);
	IF(@flightId IS NULL)
		BEGIN
			RETURN 'Invalid flight!';
		END
	DECLARE @pricePerTicket DECIMAL(15, 2) = (
												SELECT TOP(1) [Price] FROM Tickets
													WHERE [FlightId] = @flightId
											 );
	DECLARE @totalPrice DECIMAL(24, 2) = @pricePerTicket * @peopleCount;

	RETURN CONCAT('Total price ', @totalPrice);
END

GO

SELECT dbo.ufn_CalculateTickets('Kolyshley', 'Rancabolang', 33)