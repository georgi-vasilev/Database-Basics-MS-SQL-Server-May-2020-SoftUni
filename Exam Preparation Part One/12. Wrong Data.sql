USE Airport

GO

CREATE OR ALTER PROCEDURE usp_CancelFlights
AS
BEGIN
	UPDATE Flights
		SET [DepartureTime] = NULL, [ArrivalTime] = NULL
			WHERE DATEDIFF(SECOND, [ArrivalTime], [DepartureTime] ) < 0
END

GO

EXEC usp_CancelFlights