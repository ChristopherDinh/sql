DROP DATABASE IF EXISTS loyalty;
CREATE DATABASE loyalty;
USE loyalty;

CREATE TABLE Membership (
ID INT PRIMARY KEY AUTO_INCREMENT,
Number INT NOT NULL Unique,
FirstName VARCHAR(25) NOT NULL,
LastName VARCHAR(25) NOT NULL,
Address VARCHAR(50) NOT NULL,
City VARCHAR(30) NOT NULL,
State VARCHAR(25) NOT NULL,
Zip VARCHAR(25) NOT NULL,
Telephone VARCHAR(15) NOT NULL,
Email VARCHAR(50),
Employee INT Default 0 NOT NULL
);

CREATE TABLE PurchaseTranaction (
ID INT PRIMARY KEY AUTO_INCREMENT,
MembershipID INT NOT NULL,
Number VARCHAR(100) NOT NULL,
Date DATE NOT NULL,
AmountTotal VARCHAR(50) NOT NULL,
FOREIGN KEY (MembershipID) References Membership (ID),
Constraint num_date Unique (Number, Date)
);

CREATE TABLE ReturnTranaction (
ID INT PRIMARY KEY AUTO_INCREMENT,
MembershipID INT NOT NULL,
Number VARCHAR(100) NOT NULL,
Date DATE NOT NULL,
AmountTotal VARCHAR(50) NOT NULL,
FOREIGN KEY (MembershipID) References Membership (ID),
Constraint num_date Unique (Number, Date)
);