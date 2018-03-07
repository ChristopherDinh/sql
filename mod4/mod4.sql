drop database if exists mod4;
create database mod4;
use mod4;

create table id (
id 		int				primary key 	auto_increment,
name	varchar(50)		not null,
city	varchar(50)		not null,
state	varchar(2)		not null,
sales	decimal(16,2)	not null,
Active	bit(1)			not null
);

insert into id values
(1,'Acme, inc.','Jersey City','NJ',14381891,1),
(2,'Widget Corp','Seattle','WA',97865829,1),
(3,'123 Warehousing','Los Angeles','CA',77503710,1),
(4,'DemoCompany','Columbus','OH',74647541,1),
(5,'Smith and Co.','Honolulu','HI',36046590,1),
(6,'Foo Bars','Fresno','CA',39912857,1),
(7,'ABC Telecom','Birmingham','AL',31149083,1),
(8,'Fake Brothers','Stockton','CA',31226191,1),
(9,'QWERTY Logistics','Lubbock','TX',17226905,1),
(10,'Demo, Inc.','Las Vegas','NV',69551557,1);