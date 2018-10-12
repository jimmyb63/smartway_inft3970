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
From AddCategory

Select * 
From Person

Select * 
From Advertisement

Select * 
From AddOffer

SELECT *
FROM AddImage


Select * 
From PostalAddress

Select * 
From PhoneNumber

Select *
From VerificationCode

Select *
From ProfileImage

Select *
From AddImage


Select * From Advertisement Where ID = 1000


Select * From Advertisement

EXEC sp_SearchSaleItemsByTitle 'F-16', '','';

EXEC sp_SearchSaleItemsByTitle 'F-16', 'Birthday','';

EXEC sp_SearchSaleItemsByTitle 'F-16', 'Birthday','Rake';


Select * From Advertisement

EXEC sp_SearchSaleItemsByDescription 'warm', '','';

EXEC sp_SearchSaleItemsByDescription 'warm', 'cool','';



--Shouldn't work
EXEC sp_verifyPerson 'abcd1234', 1001
--Should work
EXEC sp_verifyPerson 'abcd1234', 1000

EXEC sp_verifyPerson 'abcd1234', 1003

SELECT code FROM VerificationCode WHERE personID = 1000

Select adType, title, adDescription, price, creationDate FROM Advertisement 
	WHERE sellerID = (1000) AND active = 1

SELECT ID FROM AddOffer 
WHERE buyerID = 1003 AND addID = 1000 AND offerAccepted IS NULL


EXEC sp_NewPrivateMessage 1003, 1000, 1000, 0, 'Hi. How are you?', 0, 2222

--EXEC sp_GetPrivateMsg 1000

EXEC sp_NewPrivateMessage 1000, 1003, 1000, 0, 'I am good. How are you?', 1000, 2222

--EXEC sp_GetPrivateMsg 1002
EXEC sp_NewPrivateMessage 1004, 1002, 1001, 0, 'Is that Mig still for Sale?', 0, 2222

EXEC sp_NewPrivateMessage 1003, 1000, 1000, 0, 'Bit Meh, is raining here. How is your weather?', 1001, 2222

EXEC sp_NewPrivateMessage 1000, 1003, 1000, 0, 'Yes is raining here also', 1003, 2222

EXEC sp_NewPrivateMessage 1002, 1004, 1001, 0, 'No it sold, but i have a F-16 forsale.', 1002, 2222


EXEC getUserPMIDList 1000

EXEC getUserPMIDList 1003

Select *
From PrivateMessage


DECLARE @firstMessageID INT 
DECLARE @tempUserID INT = 1003
--SELECT TOP 1 ID FROM PrivateMessage WHERE  receiverUserID = @tempUserID AND firstMessage IS NOT NULL 
	--OR sendersUserID = @tempUserID AND firstMessage IS NOT NULL;
SET @firstMessageID = (SELECT TOP 1 ID FROM PrivateMessage WHERE  receiverUserID = @tempUserID AND firstMessage IS NOT NULL 
	OR sendersUserID = @tempUserID AND firstMessage IS NOT NULL);
SELECT * FROM PrivateMessage WHERE firstMessage = @firstMessageID
ORDER BY firstMessage,[creationDate] DESC;

DECLARE @tempMsgID INT = 1000
Select *
From PrivateMessage
Where ID = @tempMsgID
Select *
FROM ReplyMessage
Where privateMessageID = @tempMsgID
ORDER BY [creationDate] DESC;

-- for testing Gabby's awesome made stored procedure awooooooo
EXEC sp_GetUserByID 1000;