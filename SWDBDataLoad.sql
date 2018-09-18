/*	
	FileName	=	DataLoad.sql
	SmartWay - Major Project
	Authors - Ashley Ballinger, Gabriele Urbonaite, Graham Johnstone, Zac Skoumbourdis, James Bailey and Brock Buttsworth
	Created August 2018
	Purpose of the File-
		Load Data from Excel into SQL Database
*/


USE SmartwayDataBase;
GO


---StateName Loading
--INSERT INTO StateName (stateName) VALUES ('	NSW');
--INSERT INTO StateName (stateName) VALUES ('	SA'	);
--INSERT INTO StateName (stateName) VALUES ('	NSW');
--INSERT INTO StateName (stateName) VALUES ('	QLD');
--INSERT INTO StateName (stateName) VALUES ('	NSW');
--INSERT INTO StateName (stateName) VALUES ('	SA'	);
--INSERT INTO StateName (stateName) VALUES ('	NSW');
--INSERT INTO StateName (stateName) VALUES ('	SA'	);
--INSERT INTO StateName (stateName) VALUES ('	SA'	);
--INSERT INTO StateName (stateName) VALUES ('	NSW');
--INSERT INTO StateName (stateName) VALUES ('	VIC');
--INSERT INTO StateName (stateName) VALUES ('	WA'	);

EXEC sp_state_insert 'NSW'; ---1
EXEC sp_state_insert 'QLD'; ---2
EXEC sp_state_insert 'WA';  ---3
EXEC sp_state_insert 'VIC'; ---4
EXEC sp_state_insert 'SA';  ---5
EXEC sp_state_insert 'NT';  ---6
EXEC sp_state_insert 'TAS'; ---7
EXEC sp_state_insert 'ACT'; ---8
GO


---PostalAddress Loading
INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('','64','Lewin Street','Barellan',2665,1,'Australia');
INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('',	'13','Black Point Drive','Whyalla Jenkins',5609,5,'Australia');
INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('A','4'	,'Warruga Street','	Corlette',2315,1,'Australia');
INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('C','5'	,'Bayview Close','The Common',4701,2,'Australia');
INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES (''	,'123','Fake Street','Newcastle',9009,1,'Australia');
INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('','75','Auricht Road','Tilley Swamp',5275, 5,'Australia');
INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('A','22','Junction Street','Caldwell',2710,1,'Australia');
INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('','3','Wigley Street','Seacombe Heights',5047,5,'Australia');
INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('','8','Sunnyside Road','Murtho',5340,5,'Australia');
INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('','35','Dalgarno Street','Basin Plain',2380,1,'Australia');
INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('','41','Horsington Street','Box Hill South',3128,4,'Australia');
INSERT INTO PostalAddress (unitNumber, streetAddress, streetName, city, postCode, stateName, country ) VALUES ('','58','Pelican Close','RoadHill',6798,3,'Australia');


---Person Data Loading
INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, verificationDate) VALUES ('Zane','Crook','ZaneCrook@dayrep.com','1999-09-15','CaptainCrook','Uomai7Oo','2018-09-07');
INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, verificationDate) VALUES ('Stella','Beale','StellaBeale@jourrapide.com','1991-04-02','StellaBeale91','wee9Wooce4R','2018-09-05');
INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, verificationDate) VALUES ('Graham','Johnstone','grahamjohnstone@gmail.com','1997-06-30','DreadPirateRoberts','P@ssword1234','2018-08-30');
INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, verificationDate) VALUES ('Tahlia','Sayers','TahliaSayers@rhyta.com','1975-11-11','Tahlia1986','Xahg0ooNg0','2018-09-07');
INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, verificationDate) VALUES ('John','Smith','johnsmith@gmail.com','1992-05-22','JohnS','password','2018-08-30');
INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, verificationDate) VALUES ('Ben','Downey','BenDowney@rhyta.com','1952-09-10','BenDowney','qwerty','2018-09-04');
INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, verificationDate) VALUES ('Christian','Dunckley','ChristianDunckley@jourrapide.com','1991-02-03','Sprid1991','aique6Weep','2018-09-04');
INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, verificationDate) VALUES ('Austin','Fitchett','AustinFitchett@teleworm.us','1979-02-23','	Whinevesock','	Maic8uzoa','2018-09-03');
INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, verificationDate) VALUES ('Hayley','Aronson','HayleyAronson@armyspy.com','1996-07-03','Whishill','adaeV500','2018-09-01');
INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, verificationDate) VALUES ('Georgia','Luke','GeorgiaLuke@rhyta.com','1984-11-16','Doony1984','iek3Lu7O','2018-09-07');
INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, verificationDate) VALUES ('Christian','Pell','	ChristianPell@rhyta.com','1992-10-21','Sunwast','thait8oJ','2018-09-02');
INSERT INTO Person (firstName, lastName, email, DOB, SWUsername, SWPassword, verificationDate) VALUES ('Ashley','Ballinger','ab@gmail.com', '1992-10-29','Ash1992','password','2018-08-30');

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


SELECT * 
FROM Person

SELECT *
FROM addCategory

SELECT * 
FROM Advertisement
