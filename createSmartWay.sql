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


--Required Database Data

							
								
 
