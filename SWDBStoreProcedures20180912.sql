/*	
	FileName	=	SWDBStoreProcedures.sql
	SmartWay - Major Project
	Authors - Ashley Ballinger, Gabriele Urbonaite, Graham Johnstone, Zac Skoumbourdis, James Bailey and Brock Buttsworth
	Created August 2018
	Purpose of the File-
		Creates the Database For SmartWay Project
*/

--Store Procedures

USE SmartwayDataBase;  
GO  



IF ( OBJECT_ID('state_insert') IS NOT NULL ) 
   DROP PROCEDURE state_insert
GO

CREATE PROCEDURE state_insert(
	@stateName varchar(20))
AS
BEGIN
	INSERT INTO StateName (stateName) 
	VALUES(@stateName);
END

GO

--New Registration
IF OBJECT_ID('sp_NewPerson', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewPerson;  
GO  

CREATE PROCEDURE sp_NewPerson(
	@tempFirstname varchar(20),
	@tempLastName varchar(20), 
	@tempEmail varchar(320))
--Return on default = newID;
AS
BEGIN
	INSERT INTO Person (firstName, lastName, email) 
	VALUES(@tempFirstname, @tempLastName, @tempEmail );
END

RETURN  
GO 
	
--New Address
IF OBJECT_ID('sp_NewAddress', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewAddress;  
GO  

CREATE PROCEDURE sp_NewAddress(
	@tempUnitNumber varchar(4), -- unit number can be letter or number
	@tempStreetAddress varchar(20),
	@tempStreetName varchar(35),
	@tempCity varchar(50),
	@tempPostCode int,
	@tempStateName int, -- References a saved StateName.
	@tempCountry varchar(30))
--Return on default = newID;
AS
BEGIN
	INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country) 
	VALUES(@tempUnitNumber, @tempStreetAddress, @tempStreetName, @tempCity, @tempPostCode, @tempStateName, @tempCountry );
END

RETURN  
GO 


IF ( OBJECT_ID('sp_newPhone') IS NOT NULL ) 
   DROP PROCEDURE sp_newPhone
GO

CREATE PROCEDURE sp_newPhone(
	@tempPhone INT)
AS
BEGIN
	INSERT INTO PhoneNumber (phoneNumber) 
	VALUES(@tempPhone);
END

GO


--New Registration
IF OBJECT_ID('sp_NewRegistration', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewRegistration;  
GO  

CREATE PROCEDURE sp_NewRegistration(
	@tempFirstname varchar(20),
	@tempLastName varchar(20), 
	@tempEmail varchar(320),
	@tempUnitNumber varchar(4), -- unit number can be letter or number
	@tempStreetAddress varchar(20),
	@tempStreetName varchar(35),
	@tempCity varchar(50),
	@tempPostCode int,
	@tempStateName int, -- References a saved StateName.
	@tempCountry varchar(30),
	@tempPhone INT	)

--Return on default = newID;
AS
BEGIN
	INSERT INTO Person (firstName, lastName, email) 
	VALUES(@tempFirstname, @tempLastName, @tempEmail );
	INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country) 
	VALUES(@tempUnitNumber, @tempStreetAddress, @tempStreetName, @tempCity, @tempPostCode, @tempStateName, @tempCountry );
	INSERT INTO PhoneNumber (phoneNumber) 
	VALUES(@tempPhone);
END
GO 