
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
IF OBJECT_ID('dbo.ViewCounter', 'U') IS NOT NULL
	DROP TABLE dbo.ViewCounter;
IF OBJECT_ID('dbo.PrivateMessage', 'U') IS NOT NULL 
  DROP TABLE dbo.PrivateMessage; 
IF OBJECT_ID('dbo.PrivateMessageChain', 'U') IS NOT NULL 
  DROP TABLE dbo.PrivateMessageChain; 
IF OBJECT_ID('dbo.ForumComment', 'U') IS NOT NULL 
  DROP TABLE dbo.ForumComment; 
IF OBJECT_ID('dbo.ForumPostTags', 'U') IS NOT NULL 
  DROP TABLE dbo.ForumPostTags;
IF OBJECT_ID('dbo.ForumImage', 'U') IS NOT NULL
  DROP TABLE dbo.ForumImage;
IF OBJECT_ID('dbo.ForumPost', 'U') IS NOT NULL 
  DROP TABLE dbo.ForumPost;
IF OBJECT_ID('dbo.ForumTag', 'U') IS NOT NULL
  DROP TABLE dbo.ForumTag;
IF OBJECT_ID('dbo.WatchListItem', 'U') IS NOT NULL
  DROP TABLE dbo.WatchListItem;
IF OBJECT_ID('dbo.AddOffer', 'U') IS NOT NULL
  DROP TABLE dbo.AddOffer;
IF OBJECT_ID('dbo.AddReview', 'U') IS NOT NULL 
  DROP TABLE dbo.AddReview;
IF OBJECT_ID('dbo.ReviewReason', 'U') IS NOT NULL
  DROP TABLE dbo.ReviewReason;
IF OBJECT_ID('dbo.RecycleLocations', 'U') IS NOT NULL 
  DROP TABLE dbo.RecycleLocations;
IF OBJECT_ID('dbo.FeedBack', 'U') IS NOT NULL 
  DROP TABLE dbo.FeedBack;
IF OBJECT_ID('dbo.AddImage', 'U') IS NOT NULL 
  DROP TABLE dbo.AddImage;
IF OBJECT_ID('dbo.ProfileImage', 'U') IS NOT NULL 
  DROP TABLE dbo.ProfileImage;
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
								creationDate DATETIME NOT NULL DEFAULT GETDATE(),
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
								creationDate DATETIME NOT NULL DEFAULT GETDATE(),
								active BIT DEFAULT 1,
								--foreignkeys
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
								verificationDate DATETIME,
								creationDate DATETIME NOT NULL DEFAULT GETDATE(),
								active BIT DEFAULT 1,
								--foreignkeys
								FOREIGN KEY (PhoneNumberId) REFERENCES PhoneNumber(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
								FOREIGN KEY (addressId) REFERENCES PostalAddress(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION
							)
--This table will be used to store the Verification Details of the Users that register with SmartWay.
--Requirements. Code, personID and creation Date should NOT be Null.
CREATE TABLE VerificationCode(	ID INT IDENTITY(1,1) PRIMARY KEY,
								code VARCHAR(8) NOT NULL,
								personID INT,
								creationDate DATETIME NOT NULL DEFAULT GETDATE(),
								active BIT DEFAULT 1,
								--foreignkeys
								FOREIGN KEY (personID) REFERENCES Person(ID)					ON UPDATE NO ACTION ON DELETE NO ACTION,
							  )

--This table will be used to store the People that are Staff with SmartWay. This is a child of person.
--Will link to Person via their ID
--Requirement:-
CREATE TABLE Staff			(	ID INT IDENTITY(1000,1) PRIMARY KEY,
								personID INT,
								position VARCHAR(30) NOT NULL,
								creationDate DATETIME NOT NULL DEFAULT GETDATE(),
								active BIT DEFAULT 1,
								--foreignkeys
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
								creationDate DATETIME NOT NULL DEFAULT GETDATE(),
								active BIT DEFAULT 1,
								--foreignkeys
								FOREIGN KEY (PersonID) REFERENCES Person(ID) 
								)

--This table will be used to store the Add Categories of the Advertisements with SmartWay.
--Requirements:-
CREATE TABLE AddCategory	(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									category VARCHAR(30) NOT NULL,
									subCategory VARCHAR(30)NOT NULL,
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
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
									categoryID INT NOT NULL,
									price DECIMAL(7,2) NOT NULL,		
									dateCompleted DATETIME,
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (sellerID) REFERENCES Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (buyerID) REFERENCES Person(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (addressID) REFERENCES PostalAddress(ID)	ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (categoryID) REFERENCES AddCategory(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
							)

--This table will be used to store the Img Details.
--Will link to Person via their ID
--Requirements. filepagth, userID should not be NULL.
CREATE TABLE ProfileImage	(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									filePath VARCHAR(260) NOT NULL,
									userID INT NOT NULL,
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1
									--foreignkeys
									FOREIGN KEY (userID) REFERENCES Person(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION
							)
--This table will be used to link the Imgs to attach to details.
--Will link to Person via their ID
CREATE TABLE AddImage		(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									--imageID INT NOT NULL,
									filePath VARCHAR(260) NOT NULL,
									userID INT NOT NULL,
									adID INT NOT NULL,
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
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
									comment VARCHAR(75),
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (sellerID) REFERENCES Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (buyerID) REFERENCES Person(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (addID) REFERENCES Advertisement(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
							)

--This table will be used to store the Recycle Location Details of the Users that register with SmartWay.
CREATE TABLE RecycleLocations	(	ID INT IDENTITY(1000,1) PRIMARY KEY,
									title VARCHAR(30) NOT NULL,
									shortDescription VARCHAR(50) NOT NULL,
									imageID INT NOT NULL,
									addressID INT NOT NULL,
									categoryID INT NOT NULL,
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (imageID) REFERENCES ProfileImage(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (addressID) REFERENCES PostalAddress(ID)	ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (categoryID) REFERENCES AddCategory(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
								)
									
--This table will be used to link the Imgs to attach to details.
--Will link to Person via their ID
--Requirements reviewReason can't be blank on creation.
CREATE TABLE ReviewReason	(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									reviewReason VARCHAR(30) NOT NULL,
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1
							)

--This Table will be used to capture requests for Admin to review an Add.
--Requirements addID, sellerID, reporterUserID, reviewReason, reviewDescriptionDetails can't be blank on creation.
CREATE TABLE AddReview		(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									addID INT NOT NULL,
									sellerID INT NOT NULL,
									reporterUserID INT,
									reviewReason INT NOT NULL,
									reviewDescriptionDetails VARCHAR(150) NOT NULL,
									adminComments VARCHAR(150),
									inReview BIT,
									dateCompleted DATETIME,
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (addID) REFERENCES Advertisement(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (sellerID) REFERENCES Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (reporterUserID) REFERENCES Person(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (reviewReason) REFERENCES ReviewReason(ID)	ON UPDATE NO ACTION ON DELETE NO ACTION
							)

--This Table will be used to capture add offers for Sellers to review.
--Requirements buyerID, sellerID, addID, offerAmount can't be blank on creation.
CREATE TABLE AddOffer 		(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									buyerID INT NOT NULL,
									sellerID INT NOT NULL,
									addID INT NOT NULL,
									offerAmount DECIMAL (7,2) NOT NULL,
									offerAccepted INT DEFAULT 2, -- 0 for declined, 1 for accepted, 2 for pending, 3 accepted another offer
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1, 
									--foreignkeys
									FOREIGN KEY (addID) REFERENCES Advertisement(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (buyerID) REFERENCES Person(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (sellerID) REFERENCES Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION
							)

--This Table will be used to capture Adds on a WatchList for Buyers to track.
--Requirements watcherID, addID can't be blank on creation.
CREATE TABLE WatchListItem 	(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									watcherID INT NOT NULL,
									addID INT NOT NULL,
									currentlyWatching BIT DEFAULT 1, -- 1 is Watching, 0 is not watching.
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (watcherID) REFERENCES Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (addID) REFERENCES Advertisement(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
							)

--This table will be used to store the Tags associated with a  ForumPost.
--Requirements:- tagName can't be blank on creation.
CREATE TABLE ForumTag		(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									tagName VARCHAR(30) NOT NULL,
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1
							)
		
--This table will be used to store ForumPost Details.
--Requirements:- personID, title, forumDescription can't be blank.						
CREATE TABLE ForumPost		(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									personID INT NOT NULL,
									title VARCHAR(50) NOT NULL,
									forumDescription VARCHAR(500) NOT NULL,
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys	
									FOREIGN KEY (personID) REFERENCES Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
									--FOREIGN KEY (imageID) REFERENCES ProfileImage(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
							)

--This table will be used to link the Imgs to attach to ForumPosts.
--Will link to ForumPost via the ForumPostID
--Requirements. filePath, forumPostID, userID should not be Null on creation .
CREATE TABLE ForumImage		(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									forumPostID INT NOT NULL,
									filePath VARCHAR(260) NOT NULL,
									userID INT NOT NULL,
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (userID) REFERENCES Person(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (forumPostID) REFERENCES ForumPost(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
							)	

--This table will be used to ForumTags to ForumPosts.
--Requirements. ForumPostID, ForumTagID should not be Null on creation .
CREATE TABLE ForumPostTags	(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									ForumPostID INT NOT NULL,
									ForumTagID INT NOT NULL,
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys	
									FOREIGN KEY (ForumPostID) REFERENCES ForumPost(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (ForumTagID) REFERENCES ForumTag(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
							)

								
--This table will be used to store Forum Comments.
--Requirements. ForumPostID, comment, repliersID should not be Null on creation.
CREATE TABLE ForumComment	(		ID INT IDENTITY(1000,1) PRIMARY KEY,
									forumPostID INT NOT NULL,
									comment VARCHAR(150) NOT NULL,
									repliersID INT NOT NULL,
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (forumPostID) REFERENCES ForumPost(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (repliersID) REFERENCES Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION
							)

--This table will be used to store Private Message Chains.
--Requirements. addID, sendersUserID, receiverUserID should not be Null on creation.
CREATE TABLE PrivateMessageChain(	ID INT IDENTITY(1000,1) PRIMARY KEY,
									addID INT NOT NULL,
									sendersUserID INT NOT NULL,
									receiverUserID INT NOT NULL,
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (addID) REFERENCES Advertisement(ID)					ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (sendersUserID) REFERENCES Person(ID)					ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (receiverUserID) REFERENCES Person(ID)					ON UPDATE NO ACTION ON DELETE NO ACTION
							)

--This table will be used to store Private Message Details.
--Requirements. PrivateMessageChainID, sendersUserID, receiverUserID, messageDetails should not be Null on creation.
CREATE TABLE PrivateMessage (		ID INT IDENTITY(1000,1) PRIMARY KEY,
									PrivateMessageChainID INT,
									sendersUserID INT NOT NULL,
									receiverUserID INT NOT NULL,
									messageDetails VARCHAR(250) NOT NULL,
									messageRead BIT DEFAULT 0,		-- 0 is Not Read, 1 is Read
									messageReplied BIT DEFAULT 0,	-- 0 is Not Replied, 1 is Replied
									creationDate DATETIME NOT NULL DEFAULT GETDATE(),
									active BIT DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (PrivateMessageChainID) REFERENCES PrivateMessageChain(ID)					ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (sendersUserID) REFERENCES Person(ID)					ON UPDATE NO ACTION ON DELETE NO ACTION,
									FOREIGN KEY (receiverUserID) REFERENCES Person(ID)					ON UPDATE NO ACTION ON DELETE NO ACTION
							)

--This table will be used to store Private Message Details.
--Requirements. adID should not be Null on creation.
CREATE TABLE ViewCounter	(
									ID INT IDENTITY(1000,1) PRIMARY KEY,
									adID INT NOT NULL,
									viewCount INT NOT NULL DEFAULT 1,
									--foreignkeys
									FOREIGN KEY (adID) REFERENCES Advertisement(ID)						ON UPDATE NO ACTION ON DELETE NO ACTION
							)

--STORE PROCEDURES
--Store Procedures are dropped if they exist and new Store Procedure is created.

--Drop New State SP
IF ( OBJECT_ID('sp_state_insert') IS NOT NULL ) 
   DROP PROCEDURE sp_state_insert
GO

--Store Procedure Inserts State Names to be referenced by addresses
--Requires StateName
CREATE PROCEDURE sp_state_insert(
	@stateName VARCHAR(20))
AS
BEGIN
	INSERT INTO StateName (stateName) 
	VALUES(@stateName);
END
GO

--Drop New Person SP
IF OBJECT_ID('sp_NewPerson', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewPerson;  
GO  

--Store Procedure Inserts New Person details on registration
--Requires Firstname, Lastname, Email Address and Password
CREATE PROCEDURE sp_NewPerson(
	@tempFirstname VARCHAR(20),
	@tempLastName VARCHAR(20), 
	@tempEmail VARCHAR(320),
	@tempPassword VARCHAR(30))
AS
BEGIN
	INSERT INTO Person (firstName, lastName, email, SWPassword) 
	VALUES(@tempFirstname, @tempLastName, @tempEmail, @tempPassword);
END

RETURN  
GO 
	
-- Drop New Address SP
IF OBJECT_ID('sp_NewAddress', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewAddress;  
GO  

--Store Procedure Inserts New Address Details
--Requires Address Details
CREATE PROCEDURE sp_NewAddress(
	@tempUnitNumber VARCHAR(4), -- unit number can be letter or number
	@tempStreetAddress VARCHAR(20),
	@tempStreetName VARCHAR(35),
	@tempCity VARCHAR(50),
	@tempPostCode INT,
	@tempStateName INT, -- References a saved StateName.
	@tempCountry VARCHAR(30))
AS
BEGIN
	INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country) 
	VALUES(@tempUnitNumber, @tempStreetAddress, @tempStreetName, @tempCity, @tempPostCode, @tempStateName, @tempCountry );
END

RETURN  
GO 

-- Drop Admin Exists SP
IF OBJECT_ID('sp_NewAdmin', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewAdmin;  
GO  

--Store Procedure Inserts New Admin Details
--Requires PersonID and Position
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

--Store Procedure Inserts New Phone Details
--Requires Phone Number
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

--Store Procedure Inserts New Verification Code Details for later Verification.
--Requires VerificationCode and PersonID
CREATE PROCEDURE sp_newVerificationCode(
	@tempVerificationCode VARCHAR(8),
	@tempPersonId INT)
AS
BEGIN
	INSERT INTO VerificationCode (code, personID) 
	VALUES(@tempVerificationCode, @tempPersonID);
END
GO

--Drop Advertisement SP
IF OBJECT_ID('sp_NewAdvertisement', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewAdvertisement;  
GO 

--Store Procedure Inserts New Advertisement Details.
--Requires VerificationCode and PersonID
CREATE PROCEDURE sp_NewAdvertisement(
	@tempSellerID INT,
	@tempTitle varchar(50),
	@tempType varchar(30),
	@tempCategory varchar(30),
	@tempSubCategory varchar(30),
	@tempDescription varchar(250),
	@tempAddressID INT,
	@tempPrice DECIMAL(7,2),
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

--Drop Registration SP
IF OBJECT_ID('sp_NewRegistration', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewRegistration;  
GO  

--Store Procedure Inserts New Registration Details.
--Requires Firstname, Lastname, Email Address and Password, Address details, Phone and Verification Code
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
AS
	DECLARE @tempPostalAddressID INT;
	DECLARE @tempPhoneID INT;
BEGIN
	--Saves New Address
	INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country) 
	VALUES(@tempUnitNumber, @tempStreetAddress, @tempStreetName, @tempCity, @tempPostCode, @tempStateName, @tempCountry);
	--Saves New Phone
	INSERT INTO PhoneNumber (phoneNumber) 
	VALUES(@tempPhone);
	--Gets Phone and Postal ID's just created
	SET @tempPostalAddressID =(SELECT MAX(ID) FROM PostalAddress);
	SET @tempPhoneID =(SELECT MAX(ID) FROM PhoneNumber);
	--Saves New Person
	INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, phoneNumberId, addressId) 
	VALUES(@tempFirstname, @tempLastName, @tempEmail, @tempDOB, @tempUsername, @tempPassword, @tempPhoneID, @tempPostalAddressID );
	--Gets Person ID just created
	SET @returnPersonID =(SELECT MAX(ID) FROM Person);
	--Saves Verification Code
	INSERT INTO VerificationCode (code, personID) 
	VALUES(@tempVerificationCode, @returnPersonID);
	--Returns person ID
	SELECT @returnPersonID;
END
GO 

--Drop Update Person SP
IF ( OBJECT_ID('sp_updatePerson') IS NOT NULL ) 
   DROP PROCEDURE sp_updatePerson
GO

--Store Procedure to update Person Details.
--Requires Firstname, Lastname, Email Address PersonID
CREATE PROCEDURE sp_updatePerson(
	@tempFirstName VARCHAR(20),
	@tempLastName VARCHAR(20),
	@tempEmail VARCHAR(320), 
	@tempID INT )

AS
BEGIN
	--Updates Person Details.
	UPDATE Person
	SET firstName = @tempFirstName, lastName= @tempLastName, email=@tempEmail
	--Where the PersonID matches.
	WHERE ID = @tempID;
END
GO

--Drop Verifiy Person SP
IF ( OBJECT_ID('sp_verifyPerson') IS NOT NULL ) 
   DROP PROCEDURE sp_verifyPerson
GO

--Store Procedure to Verify a Person.
--Requires verificationCode and PersonID
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

--Drop Person and Staff View SP
IF OBJECT_ID('view_PersonStaff') IS NOT NULL  
   DROP VIEW view_PersonStaff;  
GO

--Create a View PersonStaff
CREATE VIEW view_PersonStaff AS
    SELECT a.position, u.ID, u.firstName, u.lastName, u.email, u.SWPassword FROM Staff a INNER JOIN Person u ON a.personID = u.ID

GO

--Drop Sale Items SP
IF ( OBJECT_ID('sp_SaleItems') IS NOT NULL ) 
   DROP PROCEDURE sp_SaleItems
GO

--Store Procedure to view Sales Items.
--Requires PersonID
CREATE PROCEDURE sp_SaleItems(
	@tempUserID INT)
AS
BEGIN
	SELECT ID, sellerID, buyerID, adType, title, adDescription, price, dateCompleted, creationDate, active FROM Advertisement 
	WHERE sellerID = (@tempUserID) AND active = 1 AND buyerID IS NULL;
END
GO

-- Drop GetAd SP
IF ( OBJECT_ID('sp_GetAd') IS NOT NULL ) 
   DROP PROCEDURE sp_GetAd
GO

--Store Procedure to view Ad Details.
--Requires Ad ID
CREATE PROCEDURE sp_GetAd(
	@tempAdID INT)
AS
BEGIN
	SELECT * FROM Advertisement 
	WHERE ID = (@tempAdID);
END
GO

--- Drop GetUserByID SP
IF ( OBJECT_ID('sp_GetUserByID') IS NOT NULL ) 
   DROP PROCEDURE sp_GetUserByID
GO

--Store Procedure to view User Details.
--Requires Person ID
CREATE PROCEDURE sp_GetUserByID(
	@tempID INT)
AS
BEGIN
	SELECT * FROM Person
	WHERE ID = (@tempID);
END
GO

--Drop Search Sale Items by Title SP
IF ( OBJECT_ID('sp_SearchSaleItemsByTitle') IS NOT NULL ) 
   DROP PROCEDURE sp_SearchSaleItemsByTitle
GO

--Store Procedure to view Sale Items that match a title.
--Requires Search word
CREATE PROCEDURE sp_SearchSaleItemsByTitle(
	@tempSearchWord VARCHAR(30))
AS
BEGIN
	SELECT * FROM Advertisement 
	WHERE CHARINDEX(@tempSearchWord, title) > 0
END
GO

--Drop Search Sale Items by Description SP
IF ( OBJECT_ID('sp_SearchSaleItemsByDescription') IS NOT NULL ) 
   DROP PROCEDURE sp_SearchSaleItemsByDescription
GO

--Store Procedure to view Sale Items that match a word in the description.
--Requires Search word
CREATE PROCEDURE sp_SearchSaleItemsByDescription(
	@tempSearchWord VARCHAR(30))
AS
BEGIN
	SELECT * FROM Advertisement 
	WHERE CHARINDEX(@tempSearchWord, adDescription) > 0
END
GO

-- If sp_Admin_Check Exists
IF OBJECT_ID('sp_Admin_Check', 'P') IS NOT NULL  
   DROP PROCEDURE sp_Admin_Check;  
GO  

--Admin Check is used to check if a user is admin via their email address.
--Requires email address
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


--Drop Profile Image SP
IF OBJECT_ID('sp_NewProfileImg', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewProfileImg;  
GO  

--Store Procedure Inserts New Profile Image Details.
--Requires Filepath and PersonID
CREATE PROCEDURE sp_NewProfileImg(
	@tempFilePath VARCHAR(260),
	@tempUserID VARCHAR(20))
AS
BEGIN
	INSERT INTO ProfileImage (filePath, userID) 
	VALUES(@tempFilePath, @tempUserID);
END

RETURN  
GO 

--Drop Get Profile Image SP
IF OBJECT_ID('sp_GetProfileImg', 'P') IS NOT NULL  
   DROP PROCEDURE sp_GetProfileImg;  
GO  

--Store Procedure to view Profile Image Details.
--Requires PersonID
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

--DROP New Offer SP
IF OBJECT_ID('sp_NewAddOffer', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewAddOffer;  
GO  

--Store Procedure Inserts New Ad Offer Details.
--Requires BuyerID , SellerID, AdID, OfferAmount
CREATE PROCEDURE sp_NewAddOffer(
	@tempBuyerID INT,
	@tempSellerID INT,
	@tempAddID INT,
	@tempOfferAmount DECIMAL(7,2),
	@returnCode INT Output)
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
		--return Ad Offer ID
		SET @returnCode =(SELECT MAX(ID) FROM AddOffer);
		SELECT @returnCode;
	END
END

RETURN  
GO 


--Drop Accept an Ad Offer
IF OBJECT_ID('sp_AcceptAddOffer', 'P') IS NOT NULL  
   DROP PROCEDURE sp_AcceptAddOffer;  
GO  
--Store Procedure Accepts an Ad Offer.
--Requires Offer ID
CREATE PROCEDURE sp_AcceptAddOffer(
	@tempOfferID INT,
	@returnCode INT Output)
AS
	DECLARE @tempAddID INT;
BEGIN
	UPDATE AddOffer SET offerAccepted = 1 WHERE ID = @tempOfferID;
	SET @returnCode = 1; --Sucessful
	SELECT @returnCode;
	SET @tempAddID = (SELECT addID FROM AddOffer WHERE ID = @tempOfferID);
	UPDATE AddOffer SET offerAccepted = 3 WHERE addID = @tempAddID AND offerAccepted = 2;
END

RETURN  
GO 

--Drop New Private Message SP
IF OBJECT_ID('sp_NewPrivateMessage', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewPrivateMessage;  
GO  

--Store Procedure Inserts New Private Message Details.
--Requires SenderID, Reciever'sID, AdID, OfferAmount
CREATE PROCEDURE sp_NewPrivateMessage(
	@tempSendersUserID INT,
	@tempReceiverUserID INT,
	@tempAddID INT,
	@tempMessageDetails VARCHAR(250),
	@returnNewMessageID INT Output)
AS
	DECLARE @tempPrivateMessageChainID INT;
BEGIN
		IF EXISTS(SELECT ID FROM PrivateMessageChain WHERE sendersUserID = @tempSendersUserID AND receiverUserID = @tempReceiverUserID AND @tempAddID = @tempAddID 
			OR sendersUserID = @tempReceiverUserID AND receiverUserID = @tempSendersUserID AND @tempAddID = @tempAddID ) --There is a chain with matching AddID, sendersUserID and receiverUserID.
		BEGIN
			--Don't Create a Private Message Chain
			--Get the Private Message Chain ID
			SET @tempPrivateMessageChainID = (SELECT ID FROM PrivateMessageChain WHERE sendersUserID = @tempSendersUserID AND receiverUserID = @tempReceiverUserID AND addID = @tempAddID 
			OR sendersUserID = @tempReceiverUserID AND receiverUserID = @tempSendersUserID AND addID = @tempAddID);
			--Save Private Message Details
			INSERT INTO PrivateMessage (PrivateMessageChainID, sendersUserID, receiverUserID, messageDetails) 
			VALUES(@tempPrivateMessageChainID, @tempSendersUserID, @tempReceiverUserID, @tempMessageDetails);
			--Update Private Messages as read
			UPDATE PrivateMessage 
			SET messageRead = 1, messageReplied = 1
			--That have come before and where the User is the receiver
			WHERE PrivateMessageChainID = @tempPrivateMessageChainID AND receiverUserID = @tempSendersUserID;
			--Return New MessageID
			SET @returnNewMessageID =(SELECT MAX(ID) FROM PrivateMessage);
			SELECT @returnNewMessageID;
		END
		ELSE
		BEGIN
			--Create a Private Message Chain
			INSERT INTO PrivateMessageChain (addID, sendersUserID, receiverUserID) 
			VALUES(@tempAddID, @tempSendersUserID, @tempReceiverUserID);
			SET @tempPrivateMessageChainID = (SELECT MAX(ID) FROM PrivateMessageChain);
			--Save Private Message Details
			INSERT INTO PrivateMessage (PrivateMessageChainID, sendersUserID, receiverUserID, messageDetails) 
			VALUES(@tempPrivateMessageChainID, @tempSendersUserID, @tempReceiverUserID, @tempMessageDetails);
			--Return New MessageID
			SET @returnNewMessageID =(SELECT MAX(ID) FROM PrivateMessage);
			SELECT @returnNewMessageID;
		END
END

RETURN  
GO

--Drop Get Private Message Chain ID SP
IF OBJECT_ID('sp_GetPMChainID', 'P') IS NOT NULL  
   DROP PROCEDURE sp_GetPMChainID;  
GO 

--Store Procedure to view Private Message Chain ID
--Requires Sender, Reciever and Ad ID's
CREATE PROCEDURE sp_GetPMChainID(
	@tempSendersUserID INT,
	@tempReceiverUserID INT,
	@tempAdID INT
	)
AS
BEGIN
	SELECT ID FROM PrivateMessageChain WHERE sendersUserID = @tempSendersUserID AND receiverUserID = @tempReceiverUserID AND addID = @tempAdID 
			OR sendersUserID = @tempReceiverUserID AND receiverUserID = @tempSendersUserID AND addID = @tempAdID;
END
RETURN
GO

--Drop Get PM List SP
IF OBJECT_ID('sp_getPMList2', 'P') IS NOT NULL  
   DROP PROCEDURE sp_getPMList2;  
GO

--Store Procedure to view PM List associated With a PrivateMessageChain by PMChain ID
--Requires Private Message Chain ID
CREATE PROCEDURE sp_getPMList2(
	@tempPrivateMessageChainID INT)
AS
BEGIN
	SELECT * FROM PrivateMessage WHERE  PrivateMessageChainID = @tempPrivateMessageChainID
	ORDER BY creationDate DESC;
END
RETURN  
GO

--DROP Get PM List SP
IF OBJECT_ID('sp_getPMList', 'P') IS NOT NULL  
   DROP PROCEDURE sp_getPMList;  
GO  

--Store Procedure to view PM List associated With a PrivateMessageChain by Sender, Reciever and Add ID
--Requires Sender, Receiver and Ad ID's
CREATE PROCEDURE sp_getPMList(
	@tempSendersUserID INT,
	@tempReceiverUserID INT,
	@tempAddID INT
	)
AS
	DECLARE @tempPrivateMessageChainID INT
BEGIN
	--Get Private Message Chain ID
	SET @tempPrivateMessageChainID = (SELECT ID FROM PrivateMessageChain WHERE sendersUserID = @tempSendersUserID AND receiverUserID = @tempReceiverUserID AND @tempAddID = @tempAddID 
				OR sendersUserID = @tempReceiverUserID AND receiverUserID = @tempSendersUserID AND @tempAddID = @tempAddID)
	--Get Private Message s that have same Private Message Chain ID
	SELECT * FROM PrivateMessage WHERE  PrivateMessageChainID = @tempPrivateMessageChainID
	ORDER BY creationDate DESC;
END
RETURN  
GO

--DROP Get Private Message SP
IF OBJECT_ID('sp_GetPrivateMsg', 'P') IS NOT NULL  
   DROP PROCEDURE sp_GetPrivateMsg;  
GO  

--Store Procedure to view Private Message details by Private Message ID
--Requires Private Message ID
CREATE PROCEDURE sp_GetPrivateMsg(
	@tempPrvMsgID VARCHAR(20))
AS
BEGIN
	SELECT * FROM PrivateMessage WHERE ID = @tempPrvMsgID;
END
RETURN  
GO


--Drop Update Private Message Read SP
IF OBJECT_ID('sp_UpdatePrivateMsgtoRead', 'P') IS NOT NULL  
   DROP PROCEDURE sp_UpdatePrivateMsgtoRead;  
GO  

--Store Procedure to update Private Message to Read that have the same Private Message Chain
--Requires Private Message Chain ID
CREATE PROCEDURE sp_UpdatePrivateMsgtoRead(
	@tempPrivateMessageChainID INT)
AS
BEGIN
	UPDATE PrivateMessage 
	SET messageRead = 1 
	WHERE PrivateMessageChainID = @tempPrivateMessageChainID;
END
RETURN  
GO

--Drop Update Private Message Replied SP
IF OBJECT_ID('sp_UpdatePrivateMsgtoReplied', 'P') IS NOT NULL  
   DROP PROCEDURE sp_UpdatePrivateMsgtoReplied;  
GO  

--Store Procedure to update Private Message to Replied that have the same Private Message Chain
--Requires Private Message Chain ID
CREATE PROCEDURE sp_UpdatePrivateMsgtoReplied(
	@tempPrivateMessageChainID INT)
AS
BEGIN
	UPDATE PrivateMessage 
	SET messageReplied = 1, messageRead = 1
	WHERE PrivateMessageChainID = @tempPrivateMessageChainID;
END
RETURN  
GO

--DROP Add New Watched Item for User SP
IF OBJECT_ID('sp_NewWatchedItem', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewWatchedItem;  
GO  

--Store Procedure Inserts New Watched Item for User
--Requires AdID, PersonID
CREATE PROCEDURE sp_NewWatchedItem(
	@tempAddID INT,
	@tempUserID INT,
	@returnWatchListID INT Output)
AS
BEGIN
		INSERT INTO WatchListItem (watcherID, addID) 
		VALUES(@tempUserID, @tempAddID);
		--Return new Watchlist ID
		SET @returnWatchListID =(SELECT MAX(ID) FROM WatchListItem);
		SELECT @returnWatchListID;
END
RETURN  
GO

-- DROP Get Watched Items for User SP
IF OBJECT_ID('sp_GetUserWatchList', 'P') IS NOT NULL  
   DROP PROCEDURE sp_GetUserWatchList;  
GO  

--Store Procedure to view Watched Items for User
--Requires PersonID
CREATE PROCEDURE sp_GetUserWatchList(
	@tempUserID VARCHAR(20))
AS
	DECLARE @firstMessageID INT 
BEGIN
SELECT * FROM WatchListItem WHERE  watcherID = @tempUserID;
END
RETURN
GO

-- Drop Add New Forum Posts SP
IF OBJECT_ID('sp_NewForumPost', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewForumPost;  
GO

--Store Procedure Inserts New Forum Posts Details
--Requires PersonID, Title, Description and FilePath
CREATE PROCEDURE sp_NewForumPost(
	@tempPersonID INT,
	@tempTitle VARCHAR(50),
	@tempForumDescription VARCHAR(500),
	@tempFilePath VARCHAR(260),
	@returnForumPostID INT Output)
AS
	DECLARE @tempImageID INT
BEGIN
	IF EXISTS (SELECT ID FROM ForumPost WHERE personID = @tempPersonID AND title = @tempTitle)
	BEGIN -- Match Existes in Database
		SET @returnForumPostID = (SELECT ID FROM ForumPost WHERE personID = @tempPersonID AND title = @tempTitle);
	END
	ELSE
	IF(@tempFilePath LIKE '')
	BEGIN --No Image was Supplied
		BEGIN
			--Save Forum Post Details
			INSERT INTO ForumPost (personID, title, forumDescription) 
			VALUES(@tempPersonID, @tempTitle, @tempForumDescription);
			--Return new ForumPost ID
			SET @returnForumPostID =(SELECT MAX(ID) FROM ForumPost);
			SELECT @returnForumPostID;
		END
	END
	ELSE
	BEGIN
		BEGIN --Image Filepath Was Supplied
			--Save Forum Post Details
			INSERT INTO ForumPost (personID, title, forumDescription) 
			VALUES(@tempPersonID, @tempTitle, @tempForumDescription);
			--Return new ForumPost ID
			SET @returnForumPostID =(SELECT MAX(ID) FROM ForumPost);
			SELECT @returnForumPostID;
			--Saves Forum Image Details
			INSERT INTO ForumImage (filePath, userID, forumPostID)
			VALUES (@tempFilePath, @tempPersonID, @returnForumPostID);
		END
	END
END
RETURN  
GO

--Drop Add New Forum Tag For Forum Posts SP
IF OBJECT_ID('sp_NewForumTag', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewForumTag;  
GO  

--Store Procedure Inserts New Forum Tag For Forum Posts
--Requires Tag Name
CREATE PROCEDURE sp_NewForumTag(
	@tempTagName VARCHAR(30),
	@returnTagID INT Output)
AS
BEGIN
	IF EXISTS (SELECT ID FROM ForumTag WHERE tagName = @tempTagName )
	BEGIN -- Match Existes in Database
		SET @returnTagID = (SELECT ID FROM ForumTag WHERE tagName = @tempTagName );
	END
	ELSE
	BEGIN
		INSERT INTO ForumTag (tagName) 
		VALUES(@tempTagName);
		--Return new ForumTag ID
		SET @returnTagID =(SELECT MAX(ID) FROM ForumTag);
		SELECT @returnTagID;
	END
END
RETURN  
GO

--Drop Add New Link from Forum Tag to a Forum Posts SP
IF OBJECT_ID('sp_LinkForumTag', 'P') IS NOT NULL  
   DROP PROCEDURE sp_LinkForumTag;  
GO  
--Store Procedure Inserts New Link from Forum Tag to a Forum Posts
--Requires Tag Name, ForumPost ID
CREATE PROCEDURE sp_LinkForumTag(
	@tempTagName VARCHAR(30),
	@tempForumPostID INT,
	@returnTagID INT Output)
AS
	DECLARE @tempTagID INT
BEGIN
	IF EXISTS (SELECT ID FROM ForumTag WHERE tagName = @tempTagName )
	BEGIN -- Match Existes in Database
		--Get Forum Tag ID
		SET @tempTagID = (SELECT ID FROM ForumTag WHERE tagName = @tempTagName );
		--Link Forum tag to Forum Post
		INSERT INTO ForumPostTags (ForumPostID, ForumTagID) 
		VALUES(@tempForumPostID, @tempTagID);
		--Return new ForumTag ID
		SET @returnTagID =(SELECT MAX(ID) FROM ForumPostTags);
		SELECT @returnTagID;
	END
	ELSE --No match was Found So Create the Tag and link it
	BEGIN
		--Create New Forum Tag
		INSERT INTO ForumTag (tagName) 
		VALUES(@tempTagName);
		SET @tempTagID =(SELECT MAX(ID) FROM ForumTag);
		--Link New tag to Forum Post
		INSERT INTO ForumPostTags (ForumPostID, ForumTagID) 
		VALUES(@tempForumPostID, @tempTagID);
		--Return new ForumTag ID
		SET @returnTagID =(SELECT MAX(ID) FROM ForumPostTags);
		SELECT @returnTagID;
	END
END
RETURN  
GO

--Drop Get Tag Name of Tag Linked to a Forum Posts SP
IF OBJECT_ID('sp_GetLinkedForumTag', 'P') IS NOT NULL  
   DROP PROCEDURE sp_GetLinkedForumTag;  
GO  

--Store Procedure to view Tag Name of Tag Linked to a Forum Posts
--Requires ForumPost ID
 CREATE PROCEDURE sp_GetLinkedForumTag(
	@tempForumPostID INT)
AS
	DECLARE @tempTagID INT
BEGIN
	SELECT ft.ID, ft.tagName 
	FROM ForumPostTags fpt 
	INNER JOIN ForumTag ft ON fpt.ForumTagID = ft.ID 
	WHERE  ForumPostID = @tempForumPostID;
END
RETURN  
GO

--Add New Forum Reply(Comment) For Forum Posts
IF OBJECT_ID('sp_NewForumReply', 'P') IS NOT NULL  
   DROP PROCEDURE sp_NewForumReply;  
GO  
--Store Procedure Inserts New Forum Reply(Comment) For Forum Posts
--Requires ForumPost ID, Comment and Commenter's ID
CREATE PROCEDURE sp_NewForumReply(
	@tempForumPostID INT,
	@tempComment VARCHAR(150),
	@tempRepliersID INT)
AS
BEGIN
	INSERT INTO ForumComment (forumPostID,comment,repliersID) 
	VALUES(@tempForumPostID, @tempComment, @tempRepliersID);
END
RETURN  
GO

--Drop Get ForumReplies(Comments) SP
IF OBJECT_ID('sp_GetForumRepliesByForumID', 'P') IS NOT NULL  
   DROP PROCEDURE sp_GetForumRepliesByForumID;  
GO

--Store Procedure to view ForumReplies(Comments)
--Requires ForumPost ID
 CREATE PROCEDURE sp_GetForumRepliesByForumID(
	@tempForumPostID INT)
AS
BEGIN
	SELECT fc.ID AS ForumCommentID, fc.forumPostID, fc.comment, fc.repliersID, fc.creationDate, fc.active, Person.SWUsername, ProfileImage.filePath
	FROM ForumComment fc
	INNER JOIN Person ON Person.ID = fc.repliersID
	FULL OUTER JOIN ProfileImage ON fc.repliersID = ProfileImage.userID
	WHERE forumPostID = @tempForumPostID;
END
RETURN  
GO


-- DATALOAD

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

--Forum Tags
EXEC sp_NewForumTag 'recycling', 2222
EXEC sp_NewForumTag 'reuse', 2222
EXEC sp_NewForumTag 'repurpose', 2222
EXEC sp_NewForumTag 'fashion', 2222
EXEC sp_NewForumTag 'deals', 2222
EXEC sp_NewForumTag 'shop', 2222
EXEC sp_NewForumTag 'style', 2222
EXEC sp_NewForumTag 'smallbusiness', 2222
EXEC sp_NewForumTag 'sale', 2222
EXEC sp_NewForumTag 'happy', 2222
EXEC sp_NewForumTag 'tips', 2222
EXEC sp_NewForumTag 'localsecret', 2222
EXEC sp_NewForumTag 'savemoney', 2222
EXEC sp_NewForumTag 'cute', 2222
EXEC sp_NewForumTag 'garden', 2222
EXEC sp_NewForumTag 'kitchen', 2222
EXEC sp_NewForumTag 'bathroom', 2222
EXEC sp_NewForumTag 'work', 2222
EXEC sp_NewForumTag 'creative', 2222
EXEC sp_NewForumTag 'inspiring', 2222
EXEC sp_NewForumTag 'fitness', 2222
EXEC sp_NewForumTag 'under5mins', 2222
EXEC sp_NewForumTag 'under15mins', 2222
EXEC sp_NewForumTag 'under30mins', 2222
EXEC sp_NewForumTag 'under1hour', 2222
EXEC sp_NewForumTag 'under1day', 2222
EXEC sp_NewForumTag 'under1week', 2222
EXEC sp_NewForumTag 'under1month', 2222
EXEC sp_NewForumTag 'under1year', 2222
EXEC sp_NewForumTag 'weekendproject', 2222
EXEC sp_NewForumTag 'innovation', 2222
EXEC sp_NewForumTag 'doityourself', 2222
EXEC sp_NewForumTag 'kwanza', 2222
EXEC sp_NewForumTag 'holidayfun', 2222
EXEC sp_NewForumTag 'teamproject', 2222
EXEC sp_NewForumTag 'funwithkids', 2222
EXEC sp_NewForumTag 'kidsbirthdayideas', 2222
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

--Verifying Person
EXEC sp_verifyPerson 'abcd1234', '1000';
EXEC sp_verifyPerson 'abcd1234', '1001';
EXEC sp_verifyPerson 'abcd1234', '1002';
EXEC sp_verifyPerson 'abcd1234', '1003';
EXEC sp_verifyPerson 'abcd1234', '1004';
EXEC sp_verifyPerson 'abcd1234', '1005';
EXEC sp_verifyPerson 'abcd1234', '1006';
EXEC sp_verifyPerson 'abcd1234', '1007';
EXEC sp_verifyPerson 'abcd1234', '1008';
EXEC sp_verifyPerson 'abcd1234', '1009';
EXEC sp_verifyPerson 'abcd1234', '1010';
EXEC sp_verifyPerson 'abcd1234', '1011';
EXEC sp_verifyPerson 'abcd1234', '1012';
EXEC sp_verifyPerson 'abcd1234', '1013';
EXEC sp_verifyPerson 'abcd1234', '1014';
EXEC sp_verifyPerson 'abcd1234', '1015';

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
EXEC sp_NewAdvertisement 1002,'F-16 Commuter Jet','offer', 'goods','automotive','Flies well, good petrol mileage. Few scratches and bullet holes', 1002, 9500, 5; 
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1002_1002.jpg', 1002, 1002);
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/2_1002_1002.jpg', 1002, 1002);

--Shark with laser beam
EXEC sp_NewAdvertisement  1006, 'Shark with Frickin Laser Beams Attached to their Head', 'offer', 'services', 'tools required', 'I figure every creature deserves a warm meal', 1006, 300, 5;
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1003_1006.jpg', 1006, 1003);

--Pretty Sparkly Shoes
EXEC sp_NewAdvertisement 1005, 'Pretty Sparkly Shoes', 'offer', 'goods', 'clothing', 'Shoes that are Sparkly', 1005, 7, 5;
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1004_1005.jpg', 1005, 1004);

--Loved Cat
EXEC sp_NewAdvertisement 1007, 'Loved Cat', 'offer', 'goods', 'other', 'Great cat, very friendly', 1007, 70, 5;
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1005_1007.jpg', 1007, 1005);

--Spotty Colourful Bag
EXEC sp_NewAdvertisement 1013, 'Spotty Colourful Bag', 'offer', 'goods', 'clothing', 'A very spotty, very colourful bag', 1013, 2, 5;
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1006_1013.jpg', 1013, 1006);

--The Lovely Green Plant
EXEC sp_NewAdvertisement 1010, 'The Lovely Green Plant', 'offer', 'goods', 'other', 'The lovely green plant is as green as the grass', 1010, 3, 5;
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1007_1010.jpg', 1010, 1007);

--The Golden (and White) Pillow
EXEC sp_NewAdvertisement 1007, 'The Golden (and White) Pillow', 'offer', 'goods', 'household', 'Lovely pillow, so comfy', 1007, 100, 5;
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1008_1007.jpg', 1007, 1008);

--Unicorn Diary
EXEC sp_NewAdvertisement 1002, 'Unicorn Diary', 'offer', 'goods', 'other', 'My favourity diary of ALL TIME!', 1002, 99, 5;
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1009_1002.jpg', 1002, 1009);

--Toy Cat and Dog
EXEC sp_NewAdvertisement 1003, 'Toy Cat and Dog', 'offer', 'goods', 'baby/child', 'Great toys, had a great friendship with them', 1003, 88, 5;
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1010_1003.jpg', 1003, 1010);

--German Alphabet
EXEC sp_NewAdvertisement 1002, 'German Alphabet', 'offer', 'goods', 'other', 'I can speak fluent German because of this book', 1002, 10, 5;
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1011_1002.jpg', 1002, 1011);

--Moustache Man
EXEC sp_NewAdvertisement 1009, 'Moustache Man', 'offer', 'goods', 'other', 'What a man!', 1009, 11, 5;
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1012_1009.jpg', 1009, 1012);

--Michael Jackson Frog
EXEC sp_NewAdvertisement 1009, 'Michael Jackson Frog', 'offer', 'goods', 'other', 'What a Michael Jackson Frog!', 1009, 12, 5;
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1013_1009.jpg', 1009, 1013);

--English Tutor
EXEC sp_NewAdvertisement 1011, 'English Tuter', 'offer', 'services', 'skills required', 'I can make u gud at English', 1011, 50, 5;
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1014_1011.jpg', 1011, 1014);

--Office for Hire
EXEC sp_NewAdvertisement 1014, 'Office for Hire', 'offer', 'services', 'tools required', 'Small Office for hire', 1014, 50, 5;
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1015_1014.jpg', 1014, 1015);

--Tape Deck
EXEC sp_NewAdvertisement 1009, 'Tape Deck', 'offer', 'goods', 'electronics', 'What a Tape Deck!', 1009, 50, 5;
INSERT INTO AddImage(filePath, userID, adID) VALUES ('../Images/TestImg/1_1016_1009.jpg', 1009, 1016); 

EXEC sp_NewAdvertisement 1009, 'iPhone 5', 'offer', 'goods', 'electronics', 'Is so amazing Phone, Pictures couldnt describe!', 1009, 50, 5;

--Add Test Offer
EXEC sp_NewAddOffer 1003, 1000, 1000, 300.00, 5;

--Add test Conversations
--New Message Thread
EXEC sp_NewPrivateMessage 1003, 1000, 1000,  'Hi. How are you?', 2222

EXEC sp_NewPrivateMessage 1004, 1002, 1002,  'Is that Mig still for Sale?', 2222

--Reply Messages
EXEC sp_UpdatePrivateMsgtoReplied 1000

EXEC sp_NewPrivateMessage 1000, 1003, 1000, 'I am good. How are you?', 2222

EXEC sp_UpdatePrivateMsgtoReplied 1000

EXEC sp_NewPrivateMessage 1003, 1000, 1000, 'Bit Meh, is raining here. How is your weather?', 2222

EXEC sp_UpdatePrivateMsgtoReplied 1000

EXEC sp_NewPrivateMessage 1000, 1003, 1000, 'Yes is raining here also', 2222

EXEC sp_UpdatePrivateMsgtoReplied 1002

EXEC sp_NewPrivateMessage 1004, 1002, 1002, 'No it sold, but i have a F-16 forsale.', 2222

--Adding Test data for ForumPost
EXEC sp_NewForumPost 1003, 'Hanging Pot Plants from Plastic Bottles', 
'Rip off the outside plastic labels and cut an opening into the side of the bottle with scissors an Exacto knife. (The Exacto cut more smoothly and evenly than scissors.) 
Clean up any edges and then paint(optional). Make two small holes near the outside of the bottom of the bottle. 
Run a piece of string through the one hole and out the top of the bottle, then run another piece through the other hole you made and through the top. 
Your planter is now ready to hang.', '../Images/TestImg/1_1000_1003.jpg', 2222

--Link Tags
EXEC sp_LinkForumTag 'reuse', 1000, 2222
EXEC sp_LinkForumTag 'repurpose', 1000, 2222
EXEC sp_LinkForumTag 'savemoney', 1000, 2222
EXEC sp_LinkForumTag 'garden', 1000, 2222
EXEC sp_LinkForumTag 'under5mins', 1000, 2222
EXEC sp_LinkForumTag 'holidayfun', 1000, 2222
EXEC sp_LinkForumTag 'funwithkids', 1000, 2222
EXEC sp_LinkForumTag 'kidsbirthdayideas', 1000, 2222
EXEC sp_NewForumReply 1000,'Wow this was such a great idea!', 1004
EXEC sp_NewForumReply 1000,'We made these and the Kids had so much fun.', 1013
EXEC sp_NewForumReply 1000,'Was a Useful Tip Ty.', 1000

--Adding Test data for ForumPost
EXEC sp_NewForumPost 1006, 'Easy Watering Can', 
'Wash out the bottle a few times and let dry. Make a few holes in the cap of the bottle. Fill with water and is ready to go.', '', 2222
--Link Tags
EXEC sp_LinkForumTag 'reuse', 1001, 2222
EXEC sp_LinkForumTag 'repurpose', 1001, 2222
EXEC sp_LinkForumTag 'savemoney', 1001, 2222
EXEC sp_LinkForumTag 'garden', 1001, 2222
EXEC sp_LinkForumTag 'under5mins', 1001, 2222
EXEC sp_NewForumReply 1001,'Wow this was such a great idea!', 1004
