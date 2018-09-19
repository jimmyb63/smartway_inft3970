/*	
	FileName	=	SQLQueries.sql
	SmartWay - Major Project
	Authors - Ashley Ballinger, Gabriele Urbonaite, Graham Johnstone, Zac Skoumbourdis, James Bailey and Brock Buttsworth
	Created August 2018
	Purpose of the File-
		Creates the Database For SmartWay Project
*/

/*TODO
		--Need a all person passing ID, fName,lName, James


*/

USE SmartwayDataBase;
GO


Select * FROM StateName;


Select * 
From Person

Select * 
From PostalAddress

Select * 
From PhoneNumber

Select *
From VerificationCode

Select *
From SavedImage

Select *
From AddImage

Select * 
From Advertisement

--Shouldn't work
EXEC sp_verifyPerson 'abcd1234', 1001
--Should work
EXEC sp_verifyPerson 'abcd1234', 1000

EXEC sp_verifyPerson 'abcd1234', 1003

SELECT code FROM VerificationCode WHERE personID = 1000

