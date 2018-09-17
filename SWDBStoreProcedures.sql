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



IF ( OBJECT_ID('sp_state_insert') IS NOT NULL ) 
   DROP PROCEDURE sp_state_insert
GO

CREATE PROCEDURE sp_state_insert(
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
	@tempEmail varchar(320),
	@tempPassword varchar(30))
--Return on default = newID;
AS
BEGIN
	INSERT INTO Person (firstName, lastName, email, SWPassword) 
	VALUES(@tempFirstname, @tempLastName, @tempEmail, @tempPassword);
END

RETURN  
GO 
	
-- If New Address Exists
IF OBJECT_ID('sp_NewAddress', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewAddress;  
GO  

--New Address
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

--New Phone
CREATE PROCEDURE sp_newPhone(
	@tempPhone INT)
AS
BEGIN
	INSERT INTO PhoneNumber (phoneNumber) 
	VALUES(@tempPhone);
END
GO

IF ( OBJECT_ID('sp_newVerificationCode') IS NOT NULL ) 
   DROP PROCEDURE sp_newVerificationCode
GO

--New Verification Code
CREATE PROCEDURE sp_newVerificationCode(
	@tempVerificationCode varchar(8),
	@tempPersonId INT)
AS
BEGIN
	INSERT INTO VerificationCode (code, personID) 
	VALUES(@tempVerificationCode, @tempPersonID);
END
GO


--New Registration
IF OBJECT_ID('sp_NewRegistration', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewRegistration;  
GO  

CREATE PROCEDURE sp_NewRegistration(
	@tempFirstname varchar(20),
	@tempLastName varchar(20),
	@tempUsername varchar(30),
	@tempDOB date, 
	@tempEmail varchar(320),
	@tempPassword varchar(30),
	@tempPhone INT,
	@tempUnitNumber varchar(4), -- unit number can be letter or number
	@tempStreetAddress varchar(20),
	@tempStreetName varchar(35),
	@tempCity varchar(50),
	@tempPostCode int,
	@tempStateName int, -- References a saved StateName.
	@tempCountry varchar(30),
	@tempVerificationCode varchar(8),
	@returnPersonID INT OUTPUT)
--Return on default = newID;
AS
 --DECLARE Temp Primary Key Variables
	DECLARE @tempPostalAddressID INT;
	DECLARE @tempPhoneID INT;
	--DECLARE @returnPersonID INT;
BEGIN
	INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country) 
	VALUES(@tempUnitNumber, @tempStreetAddress, @tempStreetName, @tempCity, @tempPostCode, @tempStateName, @tempCountry);
	INSERT INTO PhoneNumber (phoneNumber) 
	VALUES(@tempPhone);
	SET @tempPostalAddressID =(select max(ID) from PostalAddress);
	SET @tempPhoneID =(select max(ID) from PhoneNumber);
	INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, phoneNumberId, addressId) 
	VALUES(@tempFirstname, @tempLastName, @tempEmail, @tempDOB, @tempUsername, @tempPassword, @tempPhoneID, @tempPostalAddressID );
	SET @returnPersonID =(select max(ID) from Person);
	INSERT INTO VerificationCode (code, personID) 
	VALUES(@tempVerificationCode, @returnPersonID);
	SELECT @returnPersonID;
	--RETURN @returnPersonID;
END
GO 

IF ( OBJECT_ID('sp_updatePerson') IS NOT NULL ) 
   DROP PROCEDURE sp_updatePerson
GO

CREATE PROCEDURE sp_updatePerson(
	@tempFirstName varchar(20),
	@tempLastName varchar(20),
	@tempEmail varchar(320), 
	@tempID INT )

AS
BEGIN
	UPDATE Person
	SET firstName = @tempFirstName, lastName= @tempLastName, email=@tempEmail
	WHERE ID = @tempID;
END
GO


IF ( OBJECT_ID('sp_verifyPerson') IS NOT NULL ) 
   DROP PROCEDURE sp_verifyPerson
GO

CREATE PROCEDURE sp_verifyPerson(
	@tempVerificationCode varchar(8),
	@tempPersonId INT)
AS
	DECLARE @tempCurrentDate DATE;
BEGIN
	-- Assignes the current date to the temporary variable
	SET @tempCurrentDate = GETDATE();
	--This is just a test and in sql displays if there was a match or not and from this we decide to update.
	SELECT personID
	FROM VerificationCode
	WHERE code = @tempVerificationCode  AND personID = @tempPersonId;
	--Updates the person by setting the verfication date to the current date
	UPDATE Person
	SET verificationDate = @tempCurrentDate
	--It will do this if the ID = the tempory Id passed in and if there was a match to the above test 
	--of if a match exists in Verfication table that matches the personID and the code that are passed in.
	WHERE ID = @tempPersonId AND
		EXISTS (
		SELECT personID
		FROM VerificationCode
		WHERE code = @tempVerificationCode  AND personID = @tempPersonId)

END
GO