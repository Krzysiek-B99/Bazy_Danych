CREATE PROCEDURE Fibonacci(@n INT)
AS 

DECLARE @x INT=0;
DECLARE @y INT=0;
DECLARE @z INT=1;

IF @n = 1
BEGIN

 SET @x=0 ;

END;
ELSE 
BEGIN
	WHILE @n-1 > 1
	BEGIN
	 SET @x = @y + @z;
	 SET @y = @z;
	 SET @z = @x;
	 SET @n = @n-1;
	END;
END;

RETURN @x;


CREATE  TRIGGER DMLtrigg ON AdventureWorks2017.Persons.Person 
FOR UPDATE AS
UPDATE Person SET LastName=upper(LastName)
