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
EXEC sp_NewPerson 'Dave', 'Smith', 'davesemail@yahoo.com', 'password', '2004/05/21'
GO

--INSERT INTO VerificationCode (code, personID) VALUES(@tempVerificationCode, @tempPersonID);
INSERT INTO VerificationCode (code, personID) VALUES ('abcd1234', '1000');

EXEC sp_newVerificationCode 'abcd4321', '1001';

--Insert Statenames
EXEC sp_state_insert 'NSW';
EXEC sp_state_insert 'QLD';
EXEC sp_state_insert 'WA';
EXEC sp_state_insert 'VIC';
EXEC sp_state_insert 'SA';
EXEC sp_state_insert 'NT';
EXEC sp_state_insert 'TAS';
EXEC sp_state_insert 'ACT';
GO

--Insert New Address
EXEC sp_NewAddress '5', '181-183', 'Michael Street', 'Jesmond', 2299, 1, 'Australia'


--Insert New Registration
EXEC sp_NewRegistration 'Jerry', 'Seinfield', 'jerry@Email.com', 'Password1', 0404999444,
						'1A' , '35', 'Janet Street', 'Jesmond', 2299, 1, 'Australia', 'abcd1234'

EXEC sp_NewRegistration 'Whitney', 'Houston', 'singer@Email.com', 'Password2', 0299444444,
						'10A' , '16', 'West Street', 'Jesmond', 2299, 1, 'Australia', 'abcd4321'


EXEC sp_NewRegistration 'Ethan', 'Hunt', 'danger@Email.com', 'Password3', 0299449999,
						'1' , '12', 'Smith Street', 'Jesmond', 2299, 1, 'Australia', 'abcd9876'

EXEC sp_NewRegistration 'Dollie', 'Parton', 'banjo@Email.com', 'Password4', 0404980808,
						'1A' , '35', 'Janet Street', 'Jesmond', 2299, 1, 'Australia', 'abcd1234'
