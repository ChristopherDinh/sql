 -- create and select the database
DROP DATABASE IF EXISTS bigbox;
CREATE DATABASE bigbox;
USE bigbox;

-- create the Division table
CREATE TABLE Division (
  ID				INT            PRIMARY KEY  AUTO_INCREMENT,
  DivisionNumber	VARCHAR(3)     NOT NULL UNIQUE,
  DivisionName		VARCHAR(50)   NOT NULL
);

-- create the Store table
CREATE TABLE Store (
  ID			INT            PRIMARY KEY  AUTO_INCREMENT,
  DivisionID	INT            NOT NULL,
  StoreNumber	VARCHAR(5)     NOT NULL,
  StoreName		VARCHAR(50)   NOT NULL,
  CONSTRAINT unq_div_store UNIQUE(DivisionID, StoreNumber),
  Foreign Key (DivisionID) references division(ID)
);

-- create the Store_Sales table
CREATE TABLE StoreSales (
	ID			INT				PRIMARY KEY AUTO_INCREMENT,
    StoreID		INT				NOT NULL,
    Date		DATE			NOT NULL,
    Sales		DECIMAL(10,2)	NOT NULL,
    Foreign Key (StoreID) references Store(ID)
);
-- insert some rows into the Stores table
INSERT INTO Division VALUES 
(1, '001', 'Cincinnati Division Office'),
(2, '111', 'Louisville Division Office');

-- insert some rows into the Stores table
INSERT INTO Store VALUES 
(1, 1, '00011', 'Mason Big Box'),
(2, 1, '00255', 'Downtown Big Box'),
(3, 1, '00172', 'Goshen Big Box'),
(4, 1, '00075', 'Bridgetown Big Box'),
(5, 2, '00011', 'Louisville Big Box'),
(6, 2, '00044', 'Riverfront Big Box');

-- insert some rows into the Store_Sales table
INSERT INTO StoreSales (StoreID, Date, Sales) VALUES
(1, '2018-01-01', 3445555.89),
(1, '2018-01-08', 3445555.89),
(1, '2018-01-15', 3445555.89),
(1, '2018-01-22', 3445555.89),
(2, '2018-01-01', 3444433.33),
(2, '2018-01-08', 3444433.33),
(2, '2018-01-15', 3444433.33),
(2, '2018-01-22', 3444433.33),
(2, '2018-01-29', 3444433.33),
(3, '2018-01-01', 4555543.66),
(3, '2018-01-08', 4555543.66),
(3, '2018-01-15', 4555543.66),
(3, '2018-01-22', 4555543.66),
(3, '2018-01-29', 4555543.66),
(3, '2018-02-05', 4555543.66),
(3, '2018-02-12', 4555543.66),
(4, '2018-01-01', 3444555.99),
(4, '2018-01-08', 3444555.99),
(5, '2018-01-15', 7668944.33),
(5, '2018-01-22', 7668944.33),
(5, '2018-01-29', 7668944.33),
(5, '2018-02-05', 7668944.33),
(6, '2018-01-01', 8777655.33),
(6, '2018-01-08', 8777655.33),
(6, '2018-01-15', 8777655.33);

-- create a user and grant privileges to that user
GRANT SELECT, INSERT, DELETE, UPDATE
ON bigbox.*
TO bb_user@localhost
IDENTIFIED BY 'sesame';