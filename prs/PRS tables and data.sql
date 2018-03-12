DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;

CREATE TABLE User (
ID				INT 	Primary Key		Auto_Increment,
UserName		VARCHAR(20) Not Null Unique,
Password		VARCHAR(10) Not Null,
FirstName		VARCHAR(20) Not Null,
LastName		VARCHAR(20) Not Null,
Phone			VARCHAR(12) Not Null,
Email			VARCHAR(75) Not Null,
IsReviewer		Bit(1) Not Null,
IsAdmin			Bit(1) Not Null,
IsActive		Bit(1) DEFAULT 1 NOT NULL,
DateCreated		DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
DateUpdated		DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP Not Null,
UpdatedByUser	INT DEFAULT 1 Not Null
);

CREATE TABLE Status (
ID				INT 	Primary Key		Auto_Increment,
Description		VARCHAR(20) Not Null Unique,
IsActive		Bit(1) DEFAULT 1 NOT NULL,
DateCreated		DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
DateUpdated		DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP Not Null,
UpdatedByUser	INT DEFAULT 1 Not Null
);

CREATE TABLE Vendor (
ID				INT		Primary Key		Auto_Increment,
Code			VARCHAR(10) Not Null Unique,
Name			VARCHAR(255) Not Null,
Address			VARCHAR(255) Not Null,
City			VARCHAR(255) Not Null,
State			VARCHAR(2) Not Null,
Zip				VARCHAR(5) Not Null,
Phone			VARCHAR(12) Not Null,
Email			VARCHAR(100) Not Null,
IsPreApproved	Bit(1) Not Null,
IsActive		Bit(1) DEFAULT 1 NOT NULL,
DateCreated		DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
DateUpdated		DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP Not Null,
UpdatedByUser	INT DEFAULT 1 Not Null
);

CREATE TABLE PurchaseRequest (
ID					INT		Primary Key		Auto_Increment,
UserID				INT Not Null,
Description			VARCHAR(100) Not Null,
Justification		VARCHAR(255) Not Null,
DateNeeded			DATE Not Null,
DeliveryMode		VARCHAR(25) Not Null,
StatusID			INT Not Null,
Total				DECIMAL(10,2) Not Null,
SubmittedDate		DATE,
ReasonForRejection	VARCHAR(100) Not Null,
IsActive		Bit(1) DEFAULT 1 NOT NULL,
DateCreated		DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
DateUpdated		DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP Not Null,
UpdatedByUser	INT DEFAULT 1 Not Null,
FOREIGN KEY (UserID) References User (ID),
FOREIGN KEY (StatusID) References Status (ID)
);

CREATE TABLE Product (
ID				INT		Primary Key		Auto_Increment,
VendorID		INT Not Null,
PartNumber		VARCHAR(50) Not Null,
Name			VARCHAR(150) Not Null,
Price			DECIMAL(10,2) Not Null,
Unit			VARCHAR(255),
PhotoPath		VARCHAR(255),
IsActive		Bit(1) DEFAULT 1 NOT NULL,
DateCreated		DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
DateUpdated		DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP Not Null,
UpdatedByUser	INT DEFAULT 1 Not Null,
FOREIGN KEY (VendorID) References Vendor (ID),
CONSTRAINT vendor_part UNIQUE (VendorID, PartNumber)
);

CREATE TABLE PurchaseRequestLineItem (
ID					INT		Primary Key		Auto_Increment,
PurchaseRequestID	INT Not Null,
ProductID			INT Not Null,
Quantity			INT Not Null,
IsActive		Bit(1) DEFAULT 1 NOT NULL,
DateCreated		DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
DateUpdated		DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP Not Null,
UpdatedByUser	INT DEFAULT 1 Not Null,
FOREIGN KEY (ProductID) References Product (ID),
FOREIGN KEY (PurchaseRequestID) References PurchaseRequest (ID),
CONSTRAINT req_pdt UNIQUE (PurchaseRequestID, ProductID)
);

-- insert users
INSERT INTO user (ID, UserName, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin) VALUES 
(1,'SYSTEM','xxxxx','System','System','XXX-XXX-XXXX','system@test.com','\0','\0'),
(2,'sblessing','login','Sean','Blessing','513-600-7096','sean@blessingtechnology.com','','');

-- insert core status values
INSERT INTO status (ID, Description) VALUES 
(1,'New'),
(2,'Approved'),
(3,'Rejected'),
(4,'Review');

-- insert vendors
INSERT INTO `vendor` (ID, Code, Name, Address, City, State, Zip, Phone, Email, isPreApproved) 
VALUES 
(1,'BB-1001','Best Buy','100 Best Buy Street','Louisville','KY','40207','502-111-9099','geeksquad@bestbuy.com','\0'),
(2,'AP-1001','Apple Inc','1 Infinite Loop','Cupertino','CA','95014','800-123-4567','genius@apple.com','\0'),
(3,'AM-1001','Amazon','410 Terry Ave. North','Seattle','WA','98109','206-266-1000','amazon@amazon.com',''),
(4,'ST-1001','Staples','9550 Mason Montgomery Rd','Mason','OH','45040','513-754-0235','support@orders.staples.com',''),
(5,'MC-1001','Micro Center','11755 Mosteller Rd','Sharonville','OH','45241','513-782-8500','support@microcenter.com','');

-- insert base products
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (1,1,'ME280LL','iPad Mini 2',296.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (2,2,'ME280LL','iPad Mini 2',299.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (3,3,'105810','Hammermill Paper, Premium Multi-Purpose Paper Poly Wrap',8.99,'1 Ream / 500 Sheets',NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (4,4,'122374','HammerMill® Copy Plus Copy Paper, 8 1/2\" x 11\", Case',29.99,'1 Case, 10 Reams, 500 Sheets per ream',NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (5,4,'784551','Logitech M325 Wireless Optical Mouse, Ambidextrous, Black ',14.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (6,4,'382955','Staples Mouse Pad, Black',2.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (7,4,'2122178','AOC 24-Inch Class LED Monitor',99.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (8,4,'2460649','Laptop HP Notebook 15-AY163NR',529.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (9,4,'2256788','Laptop Dell i3552-3240BLK 15.6\"',239.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (10,4,'IM12M9520','Laptop Acer Acer™ Aspire One Cloudbook 14\"',224.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (11,4,'940600','Canon imageCLASS Copier (D530)',99.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (12,5,'228148','Acer Aspire ATC-780A-UR12 Desktop Computer',399.99,'','/images/AcerAspireDesktop.jpg');
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (13,5,'279364','Lenovo IdeaCentre All-In-One Desktop',349.99,'','/images/LenovoIdeaCenter.jpg');