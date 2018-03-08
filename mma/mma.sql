-- create and select the database
DROP DATABASE IF EXISTS mma;
CREATE DATABASE mma;
USE mma;

-- create the Product table
CREATE TABLE Product (
  ID      INT            PRIMARY KEY  AUTO_INCREMENT,
  Code           VARCHAR(10)    NOT NULL     UNIQUE,
  Description    VARCHAR(255)   NOT NULL,
  ListPrice      DECIMAL(10,2)  NOT NULL
);

CREATE TABLE Invoice (
	ID	int	primary key auto_increment,
    OrderNumber	varchar(25)	not null unique,
    CustomerName	varchar(50)	not null,
    OrderDate	date	not null,
    Total	decimal(10,2)	not null
);
CREATE TABLE LineItem (
	ID	int	primary key	auto_increment,
    InvoiceId	int not null,
    ProductId	int	not null,
    Quanity	int	not null,
    FOREIGN KEY (InvoiceID) REFERENCES Invoice (ID),
    FOREIGN KEY (ProductID) REFERENCES Product (ID)
);
    
-- insert some rows into the Product table
INSERT INTO Product VALUES
(1, 'java', 'Murach''s Java Programming', '57.50'),
(2, 'jsp', 'Murach''s Java Servlets and JSP', '57.50'),
(3, 'mysql', 'Murach''s MySQL', '54.50'),
(4, 'android', 'Murach''s Android Programming', '57.50'),
(5, 'html5', 'Murach''s HTML5 and CSS3', '54.50'),
(6, 'oracle', 'Murach''s Oracle and PL/SQL', '54.50'),
(7, 'javascript', 'Murach''s JavaScript and jQuery', '54.50'),
(8, 'php', 'Murach''s PHP', '54.50'),
(9, 'dummy', 'dummy', '10');


