show databases;
use  demodatabases;

/* Creating Table Orders*/
CREATE TABLE Orders( OrderID int AUTO_INCREMENT PRIMARY KEY, OrderNumber
int NOT NULL , PersonId int, FOREIGN KEY(PersonId) REFERENCES Persons(ID));

/* Creating Table Persons*/
CREATE TABLE Persons( ID int AUTO_INCREMENT PRIMARY KEY, FirstName
varchar(255));

/* Inserting  into Table persons*/
INSERT INTO `demodatabases`.`Persons` (`ID`, `FirstName`) VALUES ('1','data');
INSERT INTO `demodatabases`.`Persons` (`ID`, `FirstName`) VALUES ('2','data1');
INSERT INTO `demodatabases`.`Persons` (`ID`) VALUES ('3');
UPDATE `demodatabases`.`Persons` SET `FirstName` = 'data3' WHERE (`PersonID` ='3');

/* Inserting  into Table orders*/
INSERT INTO `demodatabases`.`Orders` (`OrderID`, `OrderNumber`, `PersonID`)
VALUES ('1','23','2');
INSERT INTO `demodatabases`.`Orders` (`OrderID`, `OrderNumber`, `PersonID`)
VALUES ('3','43','3');
INSERT INTO `demodatabases`.`Orders` (`OrderID`, `OrderNumber`) VALUES ('2','23');
UPDATE `demodatabases`.`Orders` SET `PersonID` = '1' WHERE (`OrderID` = '3');
UPDATE `demodatabases`.`Orders` SET `PersonId` = '3' WHERE (`OrderID` = '2');


DELIMITER $$
CREATE PROCEDURE GetPersonsandOrders1()
BEGIN
SELECT * FROM Orders LEFT JOIN Persons ON Orders.PersonID=Persons.ID;
END $$
DELIMITER ;

call GetPersonsandOrders1();

DELIMITER $$
CREATE PROCEDURE GetPersonsandOrders2()
BEGIN
SELECT * FROM Orders RIGHT JOIN Persons ON Orders.PersonID=Persons.ID;
END $$
DELIMITER ;

call GetPersonsandOrders2();


CREATE TABLE hired_candidate(
ID int AUTO_INCREMENT PRIMARY KEY,
FirstName varchar(255),
MiddleName varchar(255),
LastName varchar(255),
EmailId varchar(255),
HiredCity varchar(255),
HiredDate varchar(255),
MobileNo BIGINT,
PinCode INT,
HiredLab varchar(255),
Attitude varchar(255),
CommunicationRemark varchar(255),
KnowledgeRemark varchar(255),
AggregateRemark varchar(255),
Status varchar(255),
CreatorStamp varchar(255) ,
CreatorUser varchar(255),
Candidate_ID INT
);

CREATE TABLE onboarding_candidate(
Candidate_ID int AUTO_INCREMENT PRIMARY KEY,
FirstName varchar(255),
MiddleName varchar(255),
LastName varchar(255),
EmailId varchar(255),
HiredCity varchar(255),
HiredDate varchar(255),
MobileNo BIGINT,
PinCode INT,
HiredLab varchar(255),
Attitude varchar(255),
CommunicationRemark varchar(255),
KnowledgeRemark varchar(255),
AggregateRemark varchar(255),
Status varchar(255),
CreatorStamp varchar(255) ,
CreatorUser varchar(255),
BirthDate varchar(255),
IsBirthDateVerified varchar(255),
ParentName varchar(255),
ParentOccupation varchar(255),
ParentsMobileNumber BIGINT, 
ParentsAnnualSalary BIGINT,
LocalAddress varchar(255),
 PermanentAddress varchar(255), 
 PhotoPath varchar(255),
JoinigDate varchar(255), 
CandidateStatus varchar(255), 
PersonalInformation
varchar(255),
BankInformation varchar(255), 
EducationalInformation varchar(255),
DocumentStatus varchar(255), 
Remark varchar(255)
);

CREATE TABLE candidate_qualification(
ID INT AUTO_INCREMENT PRIMARY KEY,
candidate_id INT ,
diploma varchar(255),
degree_name varchar(255),
is_degree_name_verified varchar(255), 
employee_decipline varchar(255),
is_employee_decipline_verified varchar(255), 
passing_year varchar(255),
aggr_per varchar(255),
is_passing_year_verified varchar(255),
 final_year_per varchar(255),
is_final_year_per_verified varchar(255), 
training_institute varchar(255),
is_training_institute_verified varchar(255), 
training_duration_month varchar(255),
is_training_duration_month_verified varchar(255), 
other_training varchar(255),
is_other_training_verified varchar(255),
 creator_stamp varchar(255),
creator_user varchar(255),
FOREIGN KEY(candidate_id) REFERENCES onboarding_candidate(candidate_ID)
);

ALTER TABLE hired_candidate
ADD CONSTRAINT fk_candidate
FOREIGN KEY(candidate_id) REFERENCES onboarding_candidate(candidate_ID);


SELECT * FROM demodatabases.candidate_qualification;
commit;

SELECT * FROM demodatabases.hired_candidate;
commit;

SELECT * FROM demodatabases.onboarding_candidate;
commit;


select * from demodatabases.hired_candidate hc inner join demodatabases.onboarding_candidate oc
on hc.Candidate_ID=oc.Candidate_ID inner join demodatabases.candidate_qualification cq
on oc.candidate_id=cq.candidate_id;

select * from demodatabases.hired_candidate hc left outer  join demodatabases.onboarding_candidate oc
on hc.Candidate_ID=oc.Candidate_ID;


