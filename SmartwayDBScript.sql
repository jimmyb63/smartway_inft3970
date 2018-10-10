
/*	
	FileName	=	createSmartWayDB.sql
	SmartWay - Major Project
	Authors - Ashley Ballinger, Gabriele Urbonaite, Graham Johnstone, Zac Skoumbourdis, James Bailey and Brock Buttsworth
	Created August 2018
	Purpose of the File-
		Creates the Database For SmartWay Project
*/

--Drop Database if it exist
USE master
IF EXISTS(SELECT * FROM sys.databases WHERE name='SmartwayDataBase')
DROP DATABASE SmartwayDataBase

--Create Database
CREATE DATABASE SmartwayDataBase;
GO

USE SmartwayDataBase;
GO

--Drop Tables if they exist
IF OBJECT_ID('dbo.PrivateMessage', 'U') IS NOT NULL 
  DROP TABLE dbo.PrivateMessage; 
IF OBJECT_ID('dbo.ForumComment', 'U') IS NOT NULL 
  DROP TABLE dbo.ForumComment; 
IF OBJECT_ID('dbo.ForumPost', 'U') IS NOT NULL 
  DROP TABLE dbo.ForumPost;
IF OBJECT_ID('dbo.AddReview', 'U') IS NOT NULL 
  DROP TABLE dbo.AddReview;
IF OBJECT_ID('dbo.WatchListItem', 'U') IS NOT NULL
  DROP TABLE dbo.WatchListItem;
IF OBJECT_ID('dbo.AddOffer', 'U') IS NOT NULL
  DROP TABLE dbo.AddOffer;
IF OBJECT_ID('dbo.ReviewReason', 'U') IS NOT NULL
  DROP TABLE dbo.ReviewReason;
IF OBJECT_ID('dbo.RecycleLocations', 'U') IS NOT NULL 
  DROP TABLE dbo.RecycleLocations;
IF OBJECT_ID('dbo.FeedBack', 'U') IS NOT NULL 
  DROP TABLE dbo.FeedBack;
IF OBJECT_ID('dbo.AddImage', 'U') IS NOT NULL 
  DROP TABLE dbo.AddImage;
IF OBJECT_ID('dbo.SavedImage', 'U') IS NOT NULL 
  DROP TABLE dbo.SavedImage;
IF OBJECT_ID('dbo.Advertisement', 'U') IS NOT NULL 
  DROP TABLE dbo.Advertisement;
IF OBJECT_ID('dbo.AddCategory', 'U') IS NOT NULL 
  DROP TABLE dbo.AddCategory;
IF OBJECT_ID('dbo.AddStatus', 'U') IS NOT NULL 
  DROP TABLE dbo.AddStatus;
IF OBJECT_ID('dbo.PaypalDetails', 'U') IS NOT NULL 
  DROP TABLE dbo.PaypalDetails;
IF OBJECT_ID('dbo.Staff', 'U') IS NOT NULL 
  DROP TABLE dbo.Staff;
IF OBJECT_ID('dbo.VerificationCode', 'U') IS NOT NULL 
  DROP TABLE dbo.VerificationCode;
IF OBJECT_ID('dbo.Person', 'U') IS NOT NULL 
  DROP TABLE dbo.Person;
IF OBJECT_ID('dbo.PhoneNumber', 'U') IS NOT NULL 
  DROP TABLE dbo.PhoneNumber;
IF OBJECT_ID('dbo.PostalAddress', 'U') IS NOT NULL 
  DROP TABLE dbo.PostalAddress;
IF OBJECT_ID('dbo.StateName', 'U') IS NOT NULL 
  DROP TABLE dbo.StateName;

--Create Tables
--This table will be used to link the Address States to the postal Address in the Database
--The values of the ID in the database will be the same as the value associated with that selection in the dropdown menu in the UserLayer,
CREATE TABLE StateName		(	ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
							stateName VARCHAR(20) NOT NULL,
							creationDate DATE NOT NULL DEFAULT GETDATE(),
							active BIT DEFAULT 1,
							)

--This table will be used to store the Address of the Users that register with SmartWay.
CREATE TABLE PostalAddress	(	ID INT IDENTITY(1000,1) PRIMARY KEY,
								unitNumber VARCHAR(4), -- unit number can be letter or number
								streetAddress VARCHAR(20) NOT NULL,
								streetName VARCHAR(35) NOT NULL,
								city VARCHAR(50) NOT NULL,
								postCode INT NOT NULL,
								stateName INT NOT NULL, -- References a saved StateName.
								country VARCHAR(30) NOT NULL,
								creationDate DATE NOT NULL DEFAULT GETDATE(),
								active BIT DEFAULT 1,
								FOREIGN KEY (stateName) REFERENCES StateName(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
							)

--This table will be used to store the Phone Number of the Users that register with SmartWay.
CREATE TABLE PhoneNumber	(	ID INT IDENTITY(1000,1) PRIMARY KEY,
								phoneNumber INT,
								creationDate DATE NOT NULL DEFAULT GETDATE(),
								active BIT DEFAULT 1,
							)

--This table will be used to store the Personal Details of the Users that register with SmartWay.
--Will link to PhoneNumber and PostalAddresses via their ID
--Requirements. Date of Birth should not be in the future.
CREATE TABLE Person			(	ID INT IDENTITY(1000,1) PRIMARY KEY,
								firstName VARCHAR(20) NOT NULL,
								lastName VARCHAR(20) NOT NULL,
								email VARCHAR(320),
								DOB	DATE,
								phoneNumberId INT,
								addressId INT,
								paypalID INT,
								SWUsername VARCHAR(30),
								SWPassword VARCHAR(30),
								verificationDate DATE,
								creationDate DATE NOT NULL DEFAULT GETDATE(),
								active BIT DEFAULT 1,
								FOREIGN KEY (PhoneNumberId) REFERENCES PhoneNumber(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
								FOREIGN KEY (addressId) REFERENCES PostalAddress(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION
							)
--This table will be used to store the Verification Details of the Users that register with SmartWay.
--Requirements. Code, personID and creation Date should NOT be Null.
CREATE TABLE VerificationCode(	ID INT IDENTITY(1,1) PRIMARY KEY,
								code VARCHAR(8) NOT NULL,
								personID INT,
								creationDate DATE NOT NULL DEFAULT GETDATE(),
								active BIT DEFAULT 1,
								FOREIGN KEY (personID) REFERENCES Person(ID)					ON UPDATE NO ACTION ON DELETE NO ACTION,
							  )

--This table will be used to store the People that are Staff with SmartWay. This is a child of person.
--Will link to Person via their ID
--Requirement:-
CREATE TABLE Staff			(	ID INT IDENTITY(1000,1) PRIMARY KEY,
								personID INT,
								position VARCHAR(30) NOT NULL,
								creationDate DATE NOT NULL DEFAULT GETDATE(),
								active BIT DEFAULT 1,
								FOREIGN KEY (personID) REFERENCES Person(ID)					ON UPDATE NO ACTION ON DELETE NO ACTION
							)

--This table will be used to store the Paypal Details of the Users that register with SmartWay.
--Will link to Person via their ID
--Requirements. 
CREATE TABLE PaypalDetails (	ID INT IDENTITY(1000,1) PRIMARY KEY,
								personID INT,
								paypalUserName VARCHAR(32) NOT NULL,
								paypalAccountNumber VARCHAR(32),
								primaryPaymentMethod BIT DEFAULT 0,
								creationDate DATE NOT NULL DEFAULT GETDATE(),
								active BIT DEFAULT 1,
								FOREIGN KEY (PersonID) REFERENCES Person(ID) 
								)

----Add comments
--create table AddStatus (		ID INT IDENTITY(1000,1) PRIMARY KEY,
--								StatusName VARCHAR(30) NOT NULL,
--								creationDate DATE NOT NULL DEFAULT GETDATE(),
--								active BIT DEFAULT 1
--								)

--This table will be used to store the Add Categories of the Advertisements with SmartWay.
--Requirements:-
CREATE TABLE AddCategory	(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									category VARCHAR(30) NOT NULL,
									subCategory VARCHAR(30)NOT NULL,
									creationDate DATE NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1
							)

--This table will be used to store the Advertisement Details registered with SmartWay.
--Will link to Sellers, Buyers, Address via their ID. 
--Requirements:-
CREATE TABLE Advertisement	(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									sellerID INT NOT NULL,
									buyerID INT,
									adType VARCHAR(30) NOT NULL,
									title VARCHAR(50) NOT NULL,
									adDescription VARCHAR(250) NOT NULL,
									addressID INT NOT NULL,
									--addStatusID INT NOT NULL DEFAULT 0,
									categoryID INT NOT NULL,
									price DECIMAL NOT NULL,		
									dateCompleted DATE,
									creationDate DATE NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (sellerID) REFERENCES Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (buyerID) REFERENCES Person(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (addressID) REFERENCES PostalAddress(ID)	ON UPDATE NO ACTION ON DELETE NO ACTION,
									--FOREIGN KEY (addStatusID) REFERENCES AddStatus(ID)	ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (categoryID) REFERENCES AddCategory(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
							)

--This table will be used to store the Img Details.
--Will link to Person via their ID
--Requirements. filepagth, userID should not be NULL.
CREATE TABLE ProfileImage	(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									filePath VARCHAR(260) NOT NULL,
									userID INT NOT NULL,
									creationDate DATE NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1
									FOREIGN KEY (userID) REFERENCES Person(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION
							)
--This table will be used to link the Imgs to attach to details.
--Will link to Person via their ID
--Requirements. Date of Birth should not be in the future.
CREATE TABLE AddImage		(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									--imageID INT NOT NULL,
									filePath VARCHAR(260) NOT NULL,
									userID INT NOT NULL,
									adID INT NOT NULL,
									creationDate DATE NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (userID) REFERENCES Person(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (adID) REFERENCES Advertisement(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION
							)

--This table will be used to link the Imgs to attach to details.
--Will link to Person via their ID
--Requirements. Date of Birth should not be in the future.
CREATE TABLE FeedBack		(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									sellerID INT NOT NULL,
									buyerID INT,
									addID INT NOT NULL,
									rating INT NOT NULL,
									comment VARCHAR(30) NOT NULL,
									creationDate DATE NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									FOREIGN KEY (sellerID) REFERENCES Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (buyerID) REFERENCES Person(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (addID) REFERENCES Advertisement(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
							)
--Add comments
CREATE TABLE RecycleLocations	(	ID INT IDENTITY(1000,1) PRIMARY KEY,
									title VARCHAR(30) NOT NULL,
									shortDescription VARCHAR(50) NOT NULL,
									imageID INT NOT NULL,
									addressID INT NOT NULL,
									categoryID INT NOT NULL,
									creationDate DATE NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (imageID) REFERENCES ProfileImage(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (addressID) REFERENCES PostalAddress(ID)	ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (categoryID) REFERENCES AddCategory(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
								)
									
--This table will be used to link the Imgs to attach to details.
--Will link to Person via their ID
--Requirements. Date of Birth should not be in the future.
CREATE TABLE ReviewReason	(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									reviewReason VARCHAR(30) NOT NULL,
									creationDate DATE NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1
							)

--This Table will be used to capture requests for Admin to review an Add.
CREATE TABLE AddReview		(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									addID INT NOT NULL,
									sellerID INT NOT NULL,
									reporterUserID INT,
									reviewReason INT NOT NULL,
									adDescription VARCHAR(150) NOT NULL,
									adminComments VARCHAR(150),
									inReview BIT,
									dateCompleted DATE,
									creationDate DATE NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (addID) REFERENCES Advertisement(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (sellerID) REFERENCES Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (reporterUserID) REFERENCES Person(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (reviewReason) REFERENCES ReviewReason(ID)	ON UPDATE NO ACTION ON DELETE NO ACTION
							)

CREATE TABLE AddOffer 		(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									buyerID INT NOT NULL,
									sellerID INT NOT NULL,
									addID INT NOT NULL,
									offerAmount DECIMAL,
									offerAccepted INT DEFAULT 2, -- 0 for declined, 1 for accepted, 2 for pending
									creationDate DATE NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (addID) REFERENCES Advertisement(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (buyerID) REFERENCES Person(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (sellerID) REFERENCES Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION
							)


CREATE TABLE WatchListItem 	(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									watcherID INT NOT NULL,
									sellerID INT NOT NULL,
									currentlyWatching BIT DEFAULT 1,
									creationDate DATE NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (watcherID) REFERENCES Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (sellerID) REFERENCES Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION
							)
									
--Add comments							
CREATE TABLE ForumPost		(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									personID INT NOT NULL,
									title VARCHAR(30) NOT NULL,
									forumDescription VARCHAR(50) NOT NULL,
									imageID INT NOT NULL,
									categoryID INT NOT NULL,
									creationDate DATE NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys	
									FOREIGN KEY (personID) REFERENCES Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (imageID) REFERENCES ProfileImage(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (categoryID) REFERENCES AddCategory(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
							)
								
--Add comments	
CREATE TABLE ForumComment	(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									forumPostID INT NOT NULL,
									comment VARCHAR(50) NOT NULL,
									imageID INT NOT NULL,
									creationDate DATE NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (forumPostID) REFERENCES ForumPost(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (imageID) REFERENCES ProfileImage(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
							)

CREATE TABLE PrivateMessage (		ID INT IDENTITY(1000,1) PRIMARY KEY,
									sendersUserID INT NOT NULL,
									receiverUserID INT NOT NULL,
									addID INT,
									forumID INT,
									messageDetails VARCHAR(250) NOT NULL,
									messageRead BIT DEFAULT 0,		-- 0 is Not Read, 1 is Read
									messageReplied BIT DEFAULT 0,	-- 0 is Not Replied, 1 is Replied
									creationDate DATE NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (addID) REFERENCES Advertisement(ID)					ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (forumID) REFERENCES ForumPost(ID)						ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (sendersUserID) REFERENCES Person(ID)					ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (receiverUserID) REFERENCES Person(ID)					ON UPDATE NO ACTION ON DELETE NO ACTION
							)

CREATE TABLE ReplyMessage	(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									privateMessageID INT NOT NULL,
									messageDetails VARCHAR(250) NOT NULL,
									messageRead BIT DEFAULT 0,		-- 0 is Not Read, 1 is Read
									messageReplied BIT DEFAULT 0,	-- 0 is Not Replied, 1 is Replied
									creationDate DATE NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (privateMessageID) REFERENCES PrivateMessage(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION,
							)

CREATE TABLE ViewCounter	(
									ID INT IDENTITY(1000,1) PRIMARY KEY,
									adID INT NOT NULL,
									viewCount INT NOT NULL DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (adID) REFERENCES Advertisement(ID)						ON UPDATE NO ACTION ON DELETE NO ACTION
							)

--STORE PROCEDURES

IF ( OBJECT_ID('sp_state_insert') IS NOT NULL ) 
   DROP PROCEDURE sp_state_insert
GO

CREATE PROCEDURE sp_state_insert(
	@stateName VARCHAR(20))
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
	@tempFirstname VARCHAR(20),
	@tempLastName VARCHAR(20), 
	@tempEmail VARCHAR(320),
	@tempPassword VARCHAR(30))
--Return on DEFAULT = newID;
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
	@tempUnitNumber VARCHAR(4), -- unit number can be letter or number
	@tempStreetAddress VARCHAR(20),
	@tempStreetName VARCHAR(35),
	@tempCity VARCHAR(50),
	@tempPostCode INT,
	@tempStateName INT, -- References a saved StateName.
	@tempCountry VARCHAR(30))
--Return on DEFAULT = newID;
AS
BEGIN
	INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country) 
	VALUES(@tempUnitNumber, @tempStreetAddress, @tempStreetName, @tempCity, @tempPostCode, @tempStateName, @tempCountry );
END

RETURN  
GO 

-- IF New Admin Exists
IF OBJECT_ID('sp_NewAdmin', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewAdmin;  
GO  

--Add New Admin
CREATE PROCEDURE sp_NewAdmin(
	@tempPersonID INT,
	@tempPosition VARCHAR(30))
AS
BEGIN
	INSERT INTO Staff (personID, position) 
	VALUES(@tempPersonID, @tempPosition );
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
	@tempVerificationCode VARCHAR(8),
	@tempPersonId INT)
AS
BEGIN
	INSERT INTO VerificationCode (code, personID) 
	VALUES(@tempVerificationCode, @tempPersonID);
END
GO

--New Advertisement
IF OBJECT_ID('sp_NewAdvertisement', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewAdvertisement;  
GO 

CREATE PROCEDURE sp_NewAdvertisement(
	@tempSellerID INT,
	@tempTitle varchar(50),
	@tempType varchar(30),
	@tempCategory varchar(30),
	@tempSubCategory varchar(30),
	@tempDescription varchar(250),
	@tempAddressID INT,
	@tempPrice DECIMAL,
	@returnAdID INT OUTPUT)
AS
	DECLARE @tempCategoryID INT;
BEGIN
	SET @tempCategoryID =(select ID from AddCategory where category = @tempCategory and subCategory = @tempSubCategory);
	INSERT INTO Advertisement (sellerID, adType, title, adDescription, addressID, categoryID, price)
	VALUES(@tempSellerID, @tempType, @tempTitle, @tempDescription, @tempAddressID, @tempCategoryID, @tempPrice);
	SET @returnAdID =(select max(ID) from Advertisement);
	INSERT INTO ViewCounter (adID) VALUES (@returnAdID);
	SELECT @returnAdID;
END
GO

--New Registration
IF OBJECT_ID('sp_NewRegistration', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewRegistration;  
GO  

CREATE PROCEDURE sp_NewRegistration(
	@tempFirstname VARCHAR(20),
	@tempLastName VARCHAR(20),
	@tempUsername VARCHAR(30),
	@tempDOB DATE, 
	@tempEmail VARCHAR(320),
	@tempPassword VARCHAR(30),
	@tempPhone INT,
	@tempUnitNumber VARCHAR(4), -- unit number can be letter or number
	@tempStreetAddress VARCHAR(20),
	@tempStreetName VARCHAR(35),
	@tempCity VARCHAR(50),
	@tempPostCode INT,
	@tempStateName INT, -- References a saved StateName.
	@tempCountry VARCHAR(30),
	@tempVerificationCode VARCHAR(8),
	@returnPersonID INT OUTPUT)
--Return on DEFAULT = newID;
AS
 --DECLARE Temp PRIMARY KEY Variables
	DECLARE @tempPostalAddressID INT;
	DECLARE @tempPhoneID INT;
	--DECLARE @returnPersonID INT;
BEGIN
	INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country) 
	VALUES(@tempUnitNumber, @tempStreetAddress, @tempStreetName, @tempCity, @tempPostCode, @tempStateName, @tempCountry);
	INSERT INTO PhoneNumber (phoneNumber) 
	VALUES(@tempPhone);
	SET @tempPostalAddressID =(SELECT MAX(ID) FROM PostalAddress);
	SET @tempPhoneID =(SELECT MAX(ID) FROM PhoneNumber);
	INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, phoneNumberId, addressId) 
	VALUES(@tempFirstname, @tempLastName, @tempEmail, @tempDOB, @tempUsername, @tempPassword, @tempPhoneID, @tempPostalAddressID );
	SET @returnPersonID =(SELECT MAX(ID) FROM Person);
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
	@tempFirstName VARCHAR(20),
	@tempLastName VARCHAR(20),
	@tempEmail VARCHAR(320), 
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
	@tempVerificationCode VARCHAR(8),
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

IF OBJECT_ID('view_PersonStaff') IS NOT NULL  
   DROP VIEW view_PersonStaff;  
GO

--Create a View PersonStaff
CREATE VIEW view_PersonStaff AS
    SELECT a.position, u.ID, u.firstName, u.lastName, u.email, u.SWPassword FROM Staff a INNER JOIN Person u ON a.personID = u.ID

GO

--SELECT * FROM view_PersonStaff

--View of Sale Items
IF ( OBJECT_ID('sp_SaleItems') IS NOT NULL ) 
   DROP PROCEDURE sp_SaleItems
GO

--New Phone
CREATE PROCEDURE sp_SaleItems(
	@tempUserID INT)
AS
BEGIN
	SELECT ID, sellerID, adType, title, adDescription, price, creationDate, active FROM Advertisement 
	WHERE sellerID = (@tempUserID) AND active = 1;
END
GO

-- If sp_Admin_Check Exists
IF OBJECT_ID('sp_Admin_Check', 'P') IS NOT NULL  
   DROP PROCEDURE sp_Admin_Check;  
GO  

--Admin Check is used to check if a user is admin via their email address.
CREATE PROCEDURE sp_Admin_Check(
	@email VARCHAR(320), -- email address
	@returnAdminID INT OUTPUT)  -- temp variable used to return AdminID
AS
BEGIN
IF EXISTS (SELECT a.ID FROM Staff a INNER JOIN Person u ON a.personID = u.ID WHERE u.email = @email)
BEGIN --these are like { } brackets
	SET @returnAdminID =(SELECT a.ID FROM Staff a INNER JOIN Person u ON a.personID = u.ID WHERE u.email = @email);
	SELECT @returnAdminID;  --- if a match is found returns the matches Admin ID
END --these are like { } brackets
ELSE
BEGIN --these are like { } brackets
	SET @returnAdminID = -1;
	SELECT @returnAdminID;  --- if not a match returns -1
END --these are like { } brackets
END
GO 


--New Profile Image
IF OBJECT_ID('sp_NewProfileImg', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewProfileImg;  
GO  

CREATE PROCEDURE sp_NewProfileImg(
	@tempFilePath VARCHAR(260),
	@tempUserID VARCHAR(20))
--Return on DEFAULT = newID;
AS
BEGIN
	INSERT INTO ProfileImage (filePath, userID) 
	VALUES(@tempFilePath, @tempUserID);
END

RETURN  
GO 

--Get Profile Image
IF OBJECT_ID('sp_GetProfileImg', 'P') IS NOT NULL  
   DROP PROCEDURE sp_GetProfileImg;  
GO  

CREATE PROCEDURE sp_GetProfileImg(
	@tempUserID VARCHAR(20))
AS
	DECLARE @tempFilePath VARCHAR(260);
BEGIN
	IF EXISTS (SELECT filePath FROM ProfileImage WHERE userID = @tempUserID)
	BEGIN --these are like { } brackets
		SET @tempFilePath =(SELECT filePath FROM ProfileImage WHERE userID = @tempUserID);
		SELECT @tempFilePath;  --- if a match is found returns the matches Filepath
	END --these are like { } brackets
	ELSE
	BEGIN --these are like { } brackets
		SET @tempFilePath = 'none';
		SELECT @tempFilePath;  --- if not a match returns -1
	END --these are like { } brackets;
END
RETURN  
GO

--New Offer
IF OBJECT_ID('sp_NewAddOffer', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewAddOffer;  
GO  

CREATE PROCEDURE sp_NewAddOffer(
	@tempBuyerID INT,
	@tempSellerID INT,
	@tempAddID INT,
	@tempOfferAmount DECIMAL,
	@returnCode INT Output)
--Return on DEFAULT = newID;
AS
BEGIN
	IF EXISTS (SELECT ID FROM AddOffer WHERE buyerID = @tempBuyerID AND addID = @tempAddID AND offerAccepted IS NULL )
	BEGIN
		SET @returnCode = -1; --exists
		SELECT @returnCode;
	END
	ELSE
	BEGIN
		INSERT INTO AddOffer (buyerID, sellerID, addID, offerAmount) 
		VALUES(@tempBuyerID, @tempSellerID, @tempAddID, @tempOfferAmount);
		SET @returnCode =(SELECT MAX(ID) FROM AddOffer);
		SELECT @returnCode;
	END
END

RETURN  
GO 

--New Private Message
IF OBJECT_ID('sp_NewPrivateMessage', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewPrivateMessage;  
GO  

CREATE PROCEDURE sp_NewPrivateMessage(
	@tempSendersUserID INT,
	@tempReceiverUserID INT,
	@tempAddID INT,
	@tempForumID INT,
	@tempMessageDetails VARCHAR(250),
	@returnNewMessageID INT Output)
--Return on DEFAULT = newID;
AS
	DECLARE @tempFirstMessageID INT;
BEGIN
	IF (@tempAddID = 0) -- Is a message Regarding a Forum Post
	BEGIN
		INSERT INTO PrivateMessage (sendersUserID, receiverUserID, forumID, messageDetails) 
		VALUES(@tempSendersUserID, @tempReceiverUserID, @tempForumID, @tempMessageDetails);
		SET @returnNewMessageID =(SELECT MAX(ID) FROM PrivateMessage);
		SELECT @returnNewMessageID;
	END
	ELSE IF (@tempForumID = 0)  -- Is a message Regarding an Add Post
	BEGIN
		INSERT INTO PrivateMessage (sendersUserID, receiverUserID, addID, messageDetails) 
		VALUES(@tempSendersUserID, @tempReceiverUserID, @tempAddID, @tempMessageDetails);
		SET @returnNewMessageID =(SELECT MAX(ID) FROM PrivateMessage);
		SELECT @returnNewMessageID;
	END
	ELSE --Is a message about neither an Add Post or a foumPost.
	BEGIN
		INSERT INTO PrivateMessage (sendersUserID, receiverUserID, messageDetails) 
		VALUES(@tempSendersUserID, @tempReceiverUserID, @tempMessageDetails);
		SET @returnNewMessageID =(SELECT MAX(ID) FROM PrivateMessage);
		SELECT @returnNewMessageID;
	END
END

RETURN  
GO

--Get Private Message
IF OBJECT_ID('sp_GetPrivateMsg', 'P') IS NOT NULL  
   DROP PROCEDURE sp_GetPrivateMsg;  
GO  

CREATE PROCEDURE sp_GetPrivateMsg(
	@tempPrvMsgID VARCHAR(20))
AS
BEGIN
	SELECT * FROM PrivateMessage WHERE ID = @tempPrvMsgID;
END
RETURN  
GO

--Get Private Message ID List
IF OBJECT_ID('getUserPMIDList', 'P') IS NOT NULL  
   DROP PROCEDURE getUserPMIDList;  
GO  

CREATE PROCEDURE getUserPMIDList(
	@tempUserID VARCHAR(20))
AS
	DECLARE @firstMessageID INT 
BEGIN
SELECT ID FROM PrivateMessage WHERE  receiverUserID = @tempUserID OR sendersUserID = @tempUserID;
END
RETURN
GO

--New reply to Private Message
IF OBJECT_ID('sp_NewReplyMessage', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewReplyMessage;  
GO  

CREATE PROCEDURE sp_NewReplyMessage(
	@tempPrivateMessageID INT,
	@tempMessageDetails VARCHAR(250),
	@returnNewMessageID INT Output)
AS
BEGIN
		INSERT INTO ReplyMessage (privateMessageID, messageDetails) 
		VALUES(@tempPrivateMessageID, @tempMessageDetails);
		SET @returnNewMessageID =(SELECT MAX(ID) FROM ReplyMessage);
		SELECT @returnNewMessageID;
END
RETURN  
GO

CREATE PROCEDURE getPMReplyList(
	@tempPrivMsgID VARCHAR(20))
AS
BEGIN
SELECT * FROM ReplyMessage WHERE  privateMessageID = @tempPrivMsgID
ORDER BY creationDate DESC;
END
RETURN  
GO

--DATALOAD

---StateName Loading

EXEC sp_state_insert 'NSW'; ---1
EXEC sp_state_insert 'QLD'; ---2
EXEC sp_state_insert 'WA';  ---3
EXEC sp_state_insert 'VIC'; ---4
EXEC sp_state_insert 'SA';  ---5
EXEC sp_state_insert 'NT';  ---6
EXEC sp_state_insert 'TAS'; ---7
EXEC sp_state_insert 'ACT'; ---8


--AddCategory Data Loading
INSERT INTO AddCategory (category, subCategory) VALUES('services', 'labour');
INSERT INTO AddCategory (category, subCategory) VALUES('services', 'tools required');
INSERT INTO AddCategory (category, subCategory) VALUES('services', 'skills required');
INSERT INTO AddCategory (category, subCategory) VALUES('goods', 'free');
INSERT INTO AddCategory (category, subCategory) VALUES('goods', 'household');
INSERT INTO AddCategory (category, subCategory) VALUES('goods', 'electronics');
INSERT INTO AddCategory (category, subCategory) VALUES('goods', 'outdoor');
INSERT INTO AddCategory (category, subCategory) VALUES('goods', 'sporting');
INSERT INTO AddCategory (category, subCategory) VALUES('goods', 'automotive');
INSERT INTO AddCategory (category, subCategory) VALUES('goods', 'baby/child');
INSERT INTO AddCategory (category, subCategory) VALUES('goods', 'clothing');
INSERT INTO AddCategory (category, subCategory) VALUES('goods', 'tools');
INSERT INTO AddCategory (category, subCategory) VALUES('goods', 'other');

--Forum Categories



--Review Reason Categories




--TEST DATA


---Person Data Loading
-------Insert New Registration
EXEC sp_NewRegistration 'Jerry', 'Seinfield', 'FastCarsJerry', '1954-04-29',  'jerry@Email.com', 'Password1', 0404999444,
						'1A' , '35', 'Janet Street', 'Jesmond', 2299, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'Whitney', 'Houston', 'SingingPipes', '1963-08-09', 'singer@Email.com', 'Password2', 0299444444,
						'10A' , '16', 'West Street', 'Jesmond', 2299, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'Ethan', 'Hunt', 'OnTheEdge', '1964-08-18', 'danger@Email.com', 'Password3', 0299449999,
						'1' , '12', 'Smith Street', 'Jesmond', 2299, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'Dollie', 'Parton', 'BigHairSinger', '1946-01-19', 'banjo@Email.com', 'Password4', 0404980808,
						'1A' , '35', 'Janet Street', 'Jesmond', 2299, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'Zane', 'Crook', 'CaptainCrook', '1999-09-15', 'ZaneCrook@dayrep.com', 'Uomai7Oo', 0404980808,
						'9' , '19', 'Kahibah Road', 'Waratah', 2298, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'Stella', 'Beale', 'StellaBeale91', '1991-04-02', 'StellaBeale@jourrapide.com', 'wee9Wooce4R', 0404980808,
						'' , '87A', 'Cresent Road', 'Waratah', 2298, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'Graham', 'Johnstone', 'DreadPirateRoberts', '1997-06-30', 'grahamjohnstone@gmail.com', 'P@ssword1234', 0404980808,
						'' , '121', 'Station Street', 'Waratah', 2298, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'Tahlia', 'Sayers', 'Tahlia1986', '1975-11-11', 'TahliaSayers@rhyta.com', 'Xahg0ooNg0', 0404980808,
						'' , '2', 'Godfrey Street', 'Waratah', 2298, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'John', 'Smith', 'JohnS', '1992-05-22', 'johnsmith@gmail.com', 'password', 0404980808,
						'2' , '29', 'Grove Street', 'Waratah', 2298, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'Ben', 'Downey', 'BenDowney', '1952-09-10', 'BenDowney@rhyta.com', 'qwerty', 0404980808,
						'Apt 5' , '60', 'Harriet Street', 'Waratah', 2298, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'Christian', 'Dunckley', 'Sprid1991', '1991-02-03', 'ChristianDunckley@jourrapide.com', 'aique6Weep', 0404980808,
						'3' , '96', 'Janet Street', 'North Lambton', 2299, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'Austin', 'Fitchett', 'Whinevesock', '1979-02-23', 'AustinFitchett@teleworm.us', 'Maic8uzoa', 0404980808,
						'' , '43', 'Acacia Avenue', 'Waratah West', 2298, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'Hayley', 'Aronson', 'Whishill', '1996-07-03', 'HayleyAronson@armyspy.com', 'adaeV500', 0404980808,
						'' , '33', 'Queen Street', 'Waratah West', 2298, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'Georgia', 'Luke', 'Doony1984', '1984-11-16', 'GeorgiaLuke@rhyta.com', 'iek3Lu7O', 0404980808,
						'1' , '35', 'Robinsion Avenue', 'Lambton', 2299, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'Christian', 'Pell', 'Sunwast', '1992-10-21', 'ChristianPell@rhyta.com', 'thait8oJ', 0404980808,
						'' , '14', 'Turana Parade', 'North Lambton', 2299, 1, 'Australia', 'abcd1234', 12345678
EXEC sp_NewRegistration 'Ashley', 'Ballinger', 'Sunwast', '1992-09-29', 'ashleylballinger@gmail.com', 'Password1', 0404980808,
						'' , '10A', 'Hughes Street', 'Birmingham Gardens', 2299, 1, 'Australia', 'abcd1234', 12345678

--Verify Users
EXEC sp_newVerificationCode 'abcd1234', '1000';
EXEC sp_newVerificationCode 'abcd1234', '1001';
EXEC sp_newVerificationCode 'abcd1234', '1002';
EXEC sp_newVerificationCode 'abcd1234', '1003';
EXEC sp_newVerificationCode 'abcd1234', '1004';
EXEC sp_newVerificationCode 'abcd1234', '1005';
EXEC sp_newVerificationCode 'abcd1234', '1006';
EXEC sp_newVerificationCode 'abcd1234', '1007';
EXEC sp_newVerificationCode 'abcd1234', '1008';
EXEC sp_newVerificationCode 'abcd1234', '1009';
EXEC sp_newVerificationCode 'abcd1234', '1010';
EXEC sp_newVerificationCode 'abcd1234', '1011';
EXEC sp_newVerificationCode 'abcd1234', '1012';
EXEC sp_newVerificationCode 'abcd1234', '1013';
EXEC sp_newVerificationCode 'abcd1234', '1014';
EXEC sp_newVerificationCode 'abcd1234', '1015';

--Admin's
EXEC sp_NewAdmin '1006', 'Manager';
EXEC sp_NewAdmin '1015', 'Manager';

--Add Test User Images

EXEC sp_NewProfileImg '../Images/TestImg/1000.png', '1000';
EXEC sp_NewProfileImg '../Images/TestImg/1001.jpg', '1001';
EXEC sp_NewProfileImg '../Images/TestImg/1002.jpg', '1002';
EXEC sp_NewProfileImg '../Images/TestImg/1003.jpg', '1003';
EXEC sp_NewProfileImg '../Images/TestImg/1004.jpg', '1004';
EXEC sp_NewProfileImg '../Images/TestImg/1005.jpg', '1005';
EXEC sp_NewProfileImg '../Images/TestImg/1006.jpg', '1006';
EXEC sp_NewProfileImg '../Images/TestImg/1007.jpg', '1007';

--Add Test Adds and  Images

--Rake Add
EXEC sp_NewAdvertisement 1000,'Rake','offer', 'goods','household','Cool Rake', 1000, 30, 5; 
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/AdImg/1_1000_1000.jpg', 1000, 1000);

--Birthday Party Add
EXEC sp_NewAdvertisement 1000,'Birthday Party Host','offer', 'goods','household','Very Funny, Great with Kids', 1000, 25, 5; 
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1003_1000.jpg', 1000, 1001);

--F-16 Add
EXEC sp_NewAdvertisement 1002,'F-16 Commuter Jet','offer', 'goods','automotive','Flies well, good petrol mielage. Few scratches and bullet holes', 1002, 9500, 5; 
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1002_1002.jpg', 1002, 1002);
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/2_1002_1002.jpg', 1002, 1002);
--Add Test Offer
EXEC sp_NewAddOffer 1003, 1000, 1000, 300.00, 5;


--Add test Conversations
--New Message Thread
EXEC sp_NewPrivateMessage 1003, 1000, 1000, 0, 'Hi. How are you?', 2222

EXEC sp_NewPrivateMessage 1004, 1002, 1001, 0, 'Is that Mig still for Sale?', 2222

--Reply Messages

EXEC sp_NewReplyMessage 1000, 'I am good. How are you?', 2222

EXEC sp_NewReplyMessage 1000, 'Bit Meh, is raining here. How is your weather?', 2222

EXEC sp_NewReplyMessage 1000, 'Yes is raining here also', 2222

EXEC sp_NewReplyMessage 1001, 'No it sold, but i have a F-16 forsale.', 2222




---PostalAddress Loading
--INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('','64','Lewin Street','Barellan',2665,1,'Australia');
--INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('',	'13','Black Point Drive','Whyalla Jenkins',5609,5,'Australia');
--INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('A','4'	,'Warruga Street','	Corlette',2315,1,'Australia');
--INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('C','5'	,'Bayview Close','The Common',4701,2,'Australia');
--INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES (''	,'123','Fake Street','Newcastle',9009,1,'Australia');
--INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('','75','Auricht Road','Tilley Swamp',5275, 5,'Australia');
--INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('A','22','Junction Street','Caldwell',2710,1,'Australia');
--INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('','3','Wigley Street','Seacombe Heights',5047,5,'Australia');
--INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('','8','Sunnyside Road','Murtho',5340,5,'Australia');
--INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('','35','Dalgarno Street','Basin Plain',2380,1,'Australia');
--INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('','41','Horsington Street','Box Hill South',3128,4,'Australia');
--INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('','58','Pelican Close','RoadHill',6798,3,'Australia');
