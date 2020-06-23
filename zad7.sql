CREATE FUNCTION funkcja (@nr_zam INT)
RETURNS datetime
AS
BEGIN
DECLARE @data_wysylki datetime;
SELECT @data_wysylki=ShipDate FROM [AdventureWorks2017].[Sales].[SalesOrderHeader] WHERE @nr_zam=SalesOrderID
RETURN @data_wysylki

END;



CREATE PROCEDURE Product_Info( @product_name nvarchar(50))
AS 
	BEGIN
 	SELECT ProductID,Name,MakeFlag FROM [AdventureWorks2017].[Production].[Product]  app
	WHERE app.Name = @product_name




CREATE FUNCTION nrcard3 (@order_nr INT)
RETURNS nvarchar(25)
AS
BEGIN
DECLARE @nr_card nvarchar(25);
SELECT @nr_card=CardNumber FROM [AdventureWorks2017].[Sales].[CreditCard] cc JOIN [AdventureWorks2017].[Sales].[SalesOrderHeader] soh ON cc.CreditCardID=soh.CreditCardID
WHERE @order_nr=soh.SalesOrderID
RETURN @nr_card

END;



CREATE  PROCEDURE dzielenie @num1 float,@num2 float
AS
BEGIN
	IF @num1>@num2
		BEGIN
		SELECT @num1/@num2
		END;
	ELSE
		BEGIN
		DECLARE @error varchar(40)
		SET @error ='Niewlasciwie zdefiniowales dane wejsciowe'
		RETURN @error
		END;
END;