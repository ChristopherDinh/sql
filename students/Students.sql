DROP DATABASE IF EXISTS Students;
CREATE DATABASE Students;
USE Students;

CREATE TABLE Course (
CourseID	INT	PRIMARY KEY	AUTO_INCREMENT,
Name VARCHAR(25)	NOT NULL UNIQUE
);

CREATE TABLE USER (
UserID INT	PRIMARY KEY	AUTO_INCREMENT,
Name	VARCHAR(25)	NOT NULL,
CourseID INT,
FOREIGN KEY (Course) REFERENCES Course (CourseID)
);

INSERT into Course VALUES 
(1,'HTML5'), 
(2,'CSS3'), 
(3,'JavaScript'), 
(4,'PHP'), 
(5,'MySQL');

INSERT into User (Name, CourseID) VALUES ('Alice', '1');
INSERT into User (Name, CourseID) VALUES ('Bob', '1');
INSERT into User (Name, CourseID) VALUES ('Caroline', '2');
INSERT into User (Name, CourseID) VALUES ('David', '5');
INSERT into User (Name, CourseID) VALUES ('Emma', null);




