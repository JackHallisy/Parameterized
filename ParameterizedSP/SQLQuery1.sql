CREATE PROCEDURE [dbo].[GetCustomerSales]
(
@CustomerId char(5),
@TotalSales money OUTPUT
)

AS
	SELECT @TotalSales = SUM(Quantity * UnitPrice)
	FROM (Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID)
	INNER JOIN [Order Details]
	ON Orders.OrderID = [Order Details].OrderID
	WHERE Customers.CustomerID = @CustomerId

RETURN 