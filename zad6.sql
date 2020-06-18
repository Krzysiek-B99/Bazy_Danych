pg_dump -U postgres -Fc firma > "E:\PostgreSQL\bin\firma_backup.sql"

pg_restore -U postgres -d firma "E:\PostgreSQL\bin\firma_backup.sql"

BACKUP DATABASE AdventureWorks2017 TO DISK = 'E:\studia\semestr4\Bazy_Danych\Backup.bak'  WITH FORMAT

Create View Log_Dep AS
Select HE.Name,HE.LoginID FROM HumanResources.Department HD JOIN
HumanResources.EmployeeDepartmentHistory HEDH ON HE.BusinessEntityID = HED.BusinessEntityID
Where HD.DepartmentID = HEDH.DepartmentID AND HE.BusinessEntityID = HEDH.BusinessEntityID;
