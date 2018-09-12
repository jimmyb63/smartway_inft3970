--Store Procedures

USE SmartwayDataBase;  
GO  
IF OBJECT_ID('NewRegistration', 'P') IS NOT NULL  
   DROP PROCEDURE NewRegistration;  
GO  


CREATE PROCEDURE NewRegistration (lastName,fistname)
Return on default = newID;
AS    
	
	SET NOCOUNT ON;  
	SELECT LastName, SalesYTD  
	FROM Sales.SalesPerson AS sp  
	JOIN HumanResources.vEmployee AS e ON e.BusinessEntityID = sp.BusinessEntityID  

RETURN  
GO 
	
	

INSERT INTO Person (firstName, lastName, email )
VALUES ('Dave', 'Smith', 'davesemail@yahoo.com' );	 