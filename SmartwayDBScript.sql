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
IF EXISTS(select * from sys.databases where name='SmartwayDataBase')
DROP DATABASE SmartwayDataBase

--Create Database
CREATE DATABASE SmartwayDataBase;
GO

USE SmartwayDataBase;
GO

--Drop Tables if they exist
IF OBJECT_ID('dbo.ForumComment', 'U') IS NOT NULL 
  DROP TABLE dbo.ForumComment; 
IF OBJECT_ID('dbo.ForumPost', 'U') IS NOT NULL 
  DROP TABLE dbo.ForumPost;
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
create table StateName	(	ID int NOT NULL IDENTITY(1,1) primary key,
							stateName varchar(20) NOT NULL,
							creationDate date NOT NULL DEFAULT GETDATE(),
							active bit DEFAULT 1,
						)

--This table will be used to store the Address of the Users that register with SmartWay.
create table PostalAddress	(	ID int IDENTITY(1000,1) primary key,
								unitNumber varchar(4), -- unit number can be letter or number
								streetAddress varchar(20) NOT NULL,
								streetName varchar(35) NOT NULL,
								city varchar(50) NOT NULL,
								postCode int NOT NULL,
								stateName int NOT NULL, -- References a saved StateName.
								country varchar(30) NOT NULL,
								creationDate date NOT NULL DEFAULT GETDATE(),
								active bit DEFAULT 1,
								foreign key (stateName) references StateName(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
							)

--This table will be used to store the Phone Number of the Users that register with SmartWay.
create table PhoneNumber (	ID int IDENTITY(1000,1) primary key,
							phoneNumber int,
							creationDate date NOT NULL DEFAULT GETDATE(),
							active bit DEFAULT 1,
						)

--This table will be used to store the Personal Details of the Users that register with SmartWay.
--Will link to PhoneNumber and PostalAddresses via their ID
--Requirements. Date of Birth should not be in the future.
create table Person		(	ID int IDENTITY(1000,1) primary key,
							firstName varchar(20) NOT NULL,
							lastName varchar(20) NOT NULL,
							email varchar(320),
							DOB	date,
							phoneNumberId int,
							addressId int,
							paypalID int,
							SWUsername varchar(30),
							SWPassword varchar(30),
							verificationDate date,
							creationDate date NOT NULL DEFAULT GETDATE(),
							active bit default 1,
							foreign key (PhoneNumberId) references PhoneNumber(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
							foreign key (addressId) references PostalAddress(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION
						)
--This table will be used to store the Verification Details of the Users that register with SmartWay.
--Requirements. Code, personID and creation Date should NOT be Null.
create table VerificationCode (	ID int IDENTITY(1,1) primary key,
								code varchar(8) NOT NULL,
								personID int,
								creationDate date NOT NULL DEFAULT GETDATE(),
								active bit default 1,
								foreign key (personID) references Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
							  )

--This table will be used to store the People that are Staff with SmartWay. This is a child of person.
--Will link to Person via their ID
--Requirement:-
create table Staff		(	ID int IDENTITY(1000,1) primary key,
							personID int,
							postion varchar(30) NOT NULL,
							creationDate date NOT NULL DEFAULT GETDATE(),
							active bit DEFAULT 1,
							foreign key (personID) references Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION
						)

--This table will be used to store the Paypal Details of the Users that register with SmartWay.
--Will link to Person via their ID
--Requirements. 
create table PaypalDetails (	ID int IDENTITY(1000,1) primary key,
								personID int,
								paypalUserName varchar(32) NOT NULL,
								paypalAccountNumber varchar(32),
								primaryPaymentMethod bit DEFAULT 0,
								creationDate date NOT NULL DEFAULT GETDATE(),
								active bit DEFAULT 1,
								FOREIGN KEY (PersonID) REFERENCES Person(ID) 
								)

----Add comments
--create table AddStatus (		ID int IDENTITY(1000,1) primary key,
--								StatusName varchar(30) NOT NULL,
--								creationDate date NOT NULL DEFAULT GETDATE(),
--								active bit DEFAULT 1
--								)

--This table will be used to store the Add Categories of the Advertisements with SmartWay.
--Requirements:-
create table AddCategory	(		ID int IDENTITY(1000,1) primary key,
									category varchar(30) NOT NULL,
									subCategory varchar(30)NOT NULL,
									creationDate date NOT NULL DEFAULT GETDATE(),
									active bit DEFAULT 1
							)

--This table will be used to store the Advertisement Details registered with SmartWay.
--Will link to Sellers, Buyers, Address via their ID. 
--Requirements:-
create table Advertisement (	ID int IDENTITY(1000,1) primary key,
								sellerID int NOT NULL,
								buyerID int,
								adType varchar(30) NOT NULL,
								title varchar(50) NOT NULL,
								adDescription varchar(50) NOT NULL,
								addressID int NOT NULL,
								--addStatusID int NOT NULL DEFAULT 0,
								categoryID int NOT NULL,
								price decimal NOT NULL,		
								dateCompleted date,
								creationDate date NOT NULL DEFAULT GETDATE(),
								active bit DEFAULT 1,
								--foreignkeys
								foreign key (sellerID) references Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
								foreign key (buyerID) references Person(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION,
								foreign key (addressID) references PostalAddress(ID)	ON UPDATE NO ACTION ON DELETE NO ACTION,
								--foreign key (addStatusID) references AddStatus(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION,
								foreign key (categoryID) references AddCategory(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
								)

--This table will be used to store the Img Details.
--Will link to Person via their ID
--Requirements. filepagth, userID should not be NULL.
create table ProfileImage (		ID int IDENTITY(1000,1) primary key,
								filePath varchar(260) NOT NULL,
								userID int NOT NULL,
								creationDate date NOT NULL DEFAULT GETDATE(),
								active bit DEFAULT 1
								foreign key (userID) references Person(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
								)
--This table will be used to link the Imgs to attach to details.
--Will link to Person via their ID
--Requirements. Date of Birth should not be in the future.
create table AddImage	(		ID int IDENTITY(1000,1) primary key,
								--imageID int NOT NULL,
								filePath varchar(260) NOT NULL,
								userID int NOT NULL,
								adID int NOT NULL,
								creationDate date NOT NULL DEFAULT GETDATE(),
								active bit DEFAULT 1,
								--foreignkeys
								foreign key (userID) references Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
								foreign key (adID) references Advertisement(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
								)

--This table will be used to link the Imgs to attach to details.
--Will link to Person via their ID
--Requirements. Date of Birth should not be in the future.
create table FeedBack (			ID int IDENTITY(1000,1) primary key,
								sellerID int NOT NULL,
								buyerID int,
								addID int NOT NULL,
								rating int NOT NULL,
								comment varchar(30) NOT NULL,
								creationDate date NOT NULL DEFAULT GETDATE(),
								active bit DEFAULT 1,
								foreign key (sellerID) references Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
								foreign key (buyerID) references Person(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION,
								foreign key (addID) references Advertisement(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
								)
--Add comments
create table RecycleLocations (	ID int IDENTITY(1000,1) primary key,
								title varchar(30) NOT NULL,
								shortDescription varchar(50) NOT NULL,
								imageID int NOT NULL,
								addressID int NOT NULL,
								categoryID int NOT NULL,
								creationDate date NOT NULL DEFAULT GETDATE(),
								active bit DEFAULT 1,
								--foreignkeys
								foreign key (imageID) references ProfileImage(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
								foreign key (addressID) references PostalAddress(ID)	ON UPDATE NO ACTION ON DELETE NO ACTION,
								foreign key (categoryID) references AddCategory(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
								)
									
--This table will be used to link the Imgs to attach to details.
--Will link to Person via their ID
--Requirements. Date of Birth should not be in the future.
create table ReviewReason (		ID int IDENTITY(1000,1) primary key,
								reviewReason varchar(30) NOT NULL,
								creationDate date NOT NULL DEFAULT GETDATE(),
								active bit DEFAULT 1
							)

--This Table will be used to capture requests for Admin to review an Add.
create table AddReview	(		ID int IDENTITY(1000,1) primary key,
								addID int NOT NULL,
								sellerID int NOT NULL,
								reporterUserID int,
								reviewReason int NOT NULL,
								adDescription varchar(150) NOT NULL,
								adminComments varchar(150),
								inReview BIT,
								dateCompleted date,
								creationDate date NOT NULL DEFAULT GETDATE(),
								active bit DEFAULT 1,
								--foreignkeys
								foreign key (addID) references Advertisement(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
								foreign key (sellerID) references Person(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION,
								foreign key (reporterUserID) references Person(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
								foreign key (reviewReason) references ReviewReason(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
								)

									
--Add comments							
create table ForumPost	 (		ID int IDENTITY(1000,1) primary key,
								personID int NOT NULL,
								title varchar(30) NOT NULL,
								forumDescription varchar(50) NOT NULL,
								imageID int NOT NULL,
								categoryID int NOT NULL,
								creationDate date NOT NULL DEFAULT GETDATE(),
								active bit DEFAULT 1,
								--foreignkeys	
								foreign key (personID) references Person(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION,
								foreign key (imageID) references ProfileImage(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
								foreign key (categoryID) references AddCategory(ID)		ON UPDATE NO ACTION ON DELETE NO ACTION
								)
								
--Add comments	
create table ForumComment	 (	ID int IDENTITY(1000,1) primary key,
								forumPostID int NOT NULL,
								comment varchar(50) NOT NULL,
								imageID int NOT NULL,
								creationDate date NOT NULL DEFAULT GETDATE(),
								active bit DEFAULT 1,
								--foreignkeys
								foreign key (forumPostID) references ForumPost(ID)			ON UPDATE NO ACTION ON DELETE NO ACTION,
								foreign key (imageID) references ProfileImage(ID)				ON UPDATE NO ACTION ON DELETE NO ACTION
								)


--STORE PROCEDURES

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
	@tempDescription varchar(50),
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
	SELECT @returnAdID;
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
EXEC sp_NewRegistration 'Ashley', 'Ballinger', 'Sunwast', '1992-09-29', 'ahleylballinger@gmail.com', 'Password1', 0404980808,
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

--Add Test User Images



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

