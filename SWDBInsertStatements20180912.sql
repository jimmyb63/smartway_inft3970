/*	
	FileName	=	SWDBInsertStatements.sql
	SmartWay - Major Project
	Authors - Ashley Ballinger, Gabriele Urbonaite, Graham Johnstone, Zac Skoumbourdis, James Bailey and Brock Buttsworth
	Created August 2018
	Purpose of the File-
		Creates the Database For SmartWay Project
*/


USE SmartwayDataBase;
GO
--Insert

INSERT INTO Person (firstName, lastName, email )
VALUES ('Dave', 'Smith', 'davesemail@yahoo.com' );


--INSERT INTO 
INSERT INTO StateName (stateName) VALUES('NSW');
INSERT INTO StateName (stateName) VALUES('QLD');
INSERT INTO StateName (stateName) VALUES('WA');
INSERT INTO StateName (stateName) VALUES('VIC');
INSERT INTO StateName (stateName) VALUES('SA');
INSERT INTO StateName (stateName) VALUES('NT');
INSERT INTO StateName (stateName) VALUES('TAS');

--With Store Procedure
--Insert New Person
EXEC sp_NewPerson 'Dave', 'Smith', 'davesemail@yahoo.com'
GO

--Insert Statenames
EXEC state_insert 'NSW';
EXEC state_insert 'QLD';
EXEC state_insert 'WA';
EXEC state_insert 'VIC';
EXEC state_insert 'SA';
EXEC state_insert 'NT';
EXEC state_insert 'TAS';
EXEC state_insert 'ACT';
GO

--Insert New Address
EXEC sp_NewAddress '5', '181-183', 'Michael Street', 'Jesmond', 2299, 1, 'Australia'


--Insert New Registration
EXEC sp_NewRegistration 'Jerry', 'Seinfield', 'jerry@Email.com', 
						'1A' , '35', 'Janet Street', 'Jesmond', 2299, 1, 'Australia',
						0404999444

