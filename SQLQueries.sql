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
From ProfileImage

Select * From Advertisement Where ID = 1000

Select * 
From Advertisement

--Shouldn't work
EXEC sp_verifyPerson 'abcd1234', 1001
--Should work
EXEC sp_verifyPerson 'abcd1234', 1000

EXEC sp_verifyPerson 'abcd1234', 1003

SELECT code FROM VerificationCode WHERE personID = 1000

SELECT a.ID FROM Staff a INNER JOIN Person u ON a.personID = u.ID WHERE u.email = 'ahleylballinger@gmail.com'

SELECT * FROM Staff a INNER JOIN Person u ON a.personID = u.ID

EXEC sp_Admin_Check 'grahamjohnstone@gmail.com', 100;


EXEC sp_Admin_Check 'NotAdmin@gmail.com', 100;