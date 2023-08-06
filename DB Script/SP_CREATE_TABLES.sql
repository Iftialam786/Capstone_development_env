CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_TABLES`()
BEGIN

/*DECLARING THE VARIABLES*/

DECLARE TABLE_COUNT INT;
DECLARE OPERATION_TYPE VARCHAR(50);
DECLARE LOG_DETAILS VARCHAR(50);
DECLARE PROCESS_NAME VARCHAR(30);
SET OPERATION_TYPE = 'CREATING THE TABLE FOR ALL THE LAYERS';
SET PROCESS_NAME = 'SP_CREATE_TABLES';


    
/*THIS IS THE AUDIT TABLE WHERE WE WILL CAPTURE ALL THE OPERATION AND DETAILS FOR AUDITING*/
CREATE TABLE Capstone_SYS_AUDIT_CONTROL
(OP_ID INT PRIMARY KEY AUTO_INCREMENT,  
SOURCE_NAME VARCHAR(30),
TARGET_NAME VARCHAR(30),
PROCESS_NAME VARCHAR(30),
OPERATION_TYPE VARCHAR(50),
SOURCE_COUNT INT,
TARGET_COUNT INT,
LOG_DETAILS VARCHAR(50),
OPERATED_BY VARCHAR(20),
OPERATION_DATE TIMESTAMP);

/*THIS IS THE STAGING AREA, WHERE WE ARE GOING TO DUMP ALL THE DATA COMING FROM THE CSV SOURCE*/

CREATE TABLE TBL_STG_ACTOR
(
actor_id smallint,
first_name VARCHAR(45),
last_name VARCHAR(45),
last_update date
);

CREATE TABLE TBL_STG_COUNTRY
(
country_id smallint,
country VARCHAR(50),
last_update date
); 

CREATE TABLE TBL_STG_ADDRESS
(
address_id smallint,
address VARCHAR(50),
address2 VARCHAR (50),
district VARCHAR(20),
city_id smallint,
postal_code int,
phone INT,
last_update date
); 

CREATE TABLE TBL_STG_CATEGORY
(category_id smallint,
name VARCHAR(25),
last_update date
); 

CREATE TABLE TBL_STG_FILM
(
film_id smallint,
title VARCHAR(128),
description TEXT,
release_year YEAR,
language_id varchar(10),
original_language_id tinyint,
rental_duration tinyint,
rental_rate decimal(4,2),
length smallint,
replacement_cost decimal(5,2),
rating varchar(5),
special_features varchar(20),
last_update date);


CREATE TABLE TBL_STG_CITY
(
city_id smallint,
city VARCHAR(50),
country_id smallint,
last_update date
); 

Create table TBL_STG_FILM_CATEGORY
(film_id smallint,
category_id tinyint,
last_update date);

CREATE TABLE TBL_STG_CUSTOMER
(
customer_id smallint,
store_id tinyint,
first_name VARCHAR(45),
last_name VARCHAR(45),
email VARCHAR(50),
address_id smallint,
active boolean,
create_date datetime,
last_update date
); 

CREATE TABLE TBL_STG_FILM_ACTOR
(
actor_id smallint,
film_id smallint,
last_update date
);


Create Table TBL_STG_LANGUAGE
(language_id tinyint,
name CHAR(20),
last_update date);

Create Table TBL_STG_STORE
(store_id tinyint,
manager_staff_id tinyint,
address_id smallint, 
last_update date);

create table TBL_STG_INVENTORY
(
inventory_id mediumint,
film_id smallint,
store_id tinyint,
last_update date
);

Create table TBL_STG_PAYMENT
(payment_id smallint,
customer_id smallint,
staff_id tinyint, 
rental_id int, 
amount decimal (5,3),
payment_date date,
last_update date);

Create Table TBL_STG_FILM_TEXT
(film_id smallint,
title varchar(225),
description TEXT);

create table TBL_STG_RENTAL
(rental_id int,
rental_date date,
inventory_id mediumint,
customer_id smallint,
return_date date,
staff_id tinyint,
last_update date);

create table TBL_STG_STAFF
(
staff_id tinyint,
first_name varchar(45),
last_name varchar (45),
address_id smallint,
picture blob,
email varchar (50),
store_id tinyint,
active boolean,
username varchar(16),
password varchar(40),
last_update date);

/*THIS IS THE HOP1 TRANSFORMATION AREA, WHERE WE ARE GOING TO MODIFY 
THE EXISTING COLUMNS BASED ON THE REQUIREMENTS DATA*/

CREATE TABLE TBL_TRANS_HOP1_ACTOR
(
actor_id smallint,
first_name VARCHAR(45),
last_name VARCHAR(45)
);

CREATE TABLE TBL_TRANS_HOP1_COUNTRY
(
country_id smallint,
country VARCHAR(50)
); 

CREATE TABLE TBL_TRANS_HOP1_ADDRESS
(
address_id smallint,
address VARCHAR(50),
address2 VARCHAR (50),
district VARCHAR(20),
city_id smallint,
postal_code VARCHAR(10),
phone VARCHAR(20)
); 

CREATE TABLE TBL_TRANS_HOP1_CATEGORY
(category_id smallint,
name VARCHAR(25)
); 

CREATE TABLE TBL_TRANS_HOP1_FILM
(
film_id smallint,
title VARCHAR(128),
description TEXT,
release_year YEAR,
language_id tinyint,
original_language_id tinyint,
rental_duration tinyint,
rental_rate decimal(4,2),
length smallint,
replacement_cost decimal(5,2),
rating varchar(5),
special_features varchar(20));


CREATE TABLE TBL_TRANS_HOP1_CITY
(
city_id smallint,
city VARCHAR(50),
country_id smallint
); 

Create table TBL_TRANS_HOP1_FILM_CATEGORY
(film_id smallint,
category_id tinyint);

CREATE TABLE TBL_TRANS_HOP1_CUSTOMER
(
customer_id smallint,
store_id tinyint,
first_name VARCHAR(45),
last_name VARCHAR(45),
email VARCHAR(50),
address_id smallint,
active boolean,
create_date datetime
); 

CREATE TABLE TBL_TRANS_HOP1_FILM_ACTOR
(
actor_id smallint,
film_id smallint
);


Create Table TBL_TRANS_HOP1_LANGUAGE
(language_id tinyint,
name CHAR(20));

Create Table TBL_TRANS_HOP1_STORE
(store_id tinyint,
manager_staff_id tinyint,
address_id smallint);

create table TBL_TRANS_HOP1_INVENTORY
(
inventory_id mediumint,
film_id smallint,
store_id tinyint
);

Create table TBL_TRANS_HOP1_PAYMENT
(payment_id smallint,
customer_id smallint,
staff_id tinyint, 
rental_id int, 
amount decimal (5,3),
payment_date date);

create table TBL_TRANS_HOP1_RENTAL
(rental_id int,
rental_date datetime,
inventory_id mediumint,
customer_id smallint,
return_date date,
staff_id tinyint);

create table TBL_TRANS_HOP1_STAFF
(
staff_id tinyint,
first_name varchar(45),
last_name varchar (45),
address_id smallint,
picture blob,
email varchar (50),
store_id tinyint,
active boolean,
username varchar(16),
password varchar(40));


/*THIS IS THE HOP2 TRANSFORMATION AREA, WHERE WE ARE GOING TO ADD NEW COLUMNS IN THE TABLE 
BASED ON THE REQUIREMENTS DATA*/

CREATE TABLE TBL_TRANS_HOP2_ACTOR
(
actor_id smallint,
Actor_name varchar (100)
);

CREATE TABLE TBL_TRANS_HOP2_ADDRESS
(
address_id smallint,
address VARCHAR(50),
district VARCHAR(20),
city_id smallint,
postal_code VARCHAR(10) ,
phone VARCHAR(20)
); 

CREATE TABLE TBL_TRANS_HOP2_FILM
(
film_id smallint,
title VARCHAR(128),
description TEXT,
release_year YEAR,
language_id tinyint,
original_language_id tinyint,
rental_duration tinyint,
rental_rate decimal(4,2),
length smallint,
replacement_cost decimal(5,2),
rating varchar(5),
Updated_rating varchar (50),
special_features varchar(20));

CREATE TABLE TBL_TRANS_HOP2_CUSTOMER
(
customer_id smallint,
store_id tinyint,
first_name VARCHAR(45),
last_name VARCHAR(45),
email VARCHAR(50),
address_id smallint,
active boolean,
create_date datetime
); 


/*THIS IS THE FINAL AREA, WHERE WE WE WILL HAVE ALL THE CLEANED DATA*/
CREATE TABLE TBL_FNL_ACTOR
(
actor_id smallint,
Actor_name varchar (100)
);

CREATE TABLE TBL_FNL_COUNTRY
(
country_id smallint,
country VARCHAR(50)
); 

CREATE TABLE TBL_FNL_ADDRESS
(
address_id smallint,
address VARCHAR(50),
district VARCHAR(20),
city_id smallint,
postal_code VARCHAR(10) ,
phone VARCHAR(20)
); 

CREATE TABLE TBL_FNL_CATEGORY
(category_id smallint,
name VARCHAR(25)
); 

CREATE TABLE TBL_FNL_FILM
(
film_id smallint,
title VARCHAR(128),
description TEXT,
release_year YEAR,
language_id tinyint,
original_language_id tinyint,
rental_duration tinyint,
rental_rate decimal(4,2),
length smallint,
replacement_cost decimal(5,2),
rating varchar(5),
Updated_rating varchar (50),
special_features varchar(20));

CREATE TABLE TBL_FNL_CITY
(
city_id smallint,
city VARCHAR(50),
country_id smallint
); 

CREATE TABLE TBL_FNL_FILM_CATEGORY
(category_id smallint,
name VARCHAR(25)
); 

CREATE TABLE TBL_FNL_CUSTOMER
(
customer_id smallint,
store_id tinyint,
first_name VARCHAR(45),
last_name VARCHAR(45),
email VARCHAR(50),
address_id smallint,
active boolean,
create_date datetime
); 


CREATE TABLE TBL_FNL_FILM_ACTOR
(
actor_id smallint,
film_id smallint
);


Create Table TBL_FNL_LANGUAGE
(language_id tinyint,
name CHAR(20));

Create Table TBL_FNL_STORE
(store_id tinyint,
manager_staff_id tinyint,
address_id smallint);

create table TBL_FNL_INVENTORY
(
inventory_id mediumint,
film_id smallint,
store_id tinyint
);

Create table TBL_FNL_PAYMENT
(payment_id smallint,
customer_id smallint,
staff_id tinyint, 
rental_id int, 
amount decimal (5,3),
payment_date date);

Create Table TBL_FNL_TEXT
(film_id smallint,
title varchar(225),
description TEXT);

create table TBL_FNL_RENTAL
(rental_id int,
rental_date datetime,
inventory_id mediumint,
customer_id smallint,
return_date date,
staff_id tinyint);

create table TBL_FNL_STAFF
(
staff_id tinyint,
first_name varchar(45),
last_name varchar (45),
address_id smallint,
picture blob,
email varchar (50),
store_id tinyint,
active boolean,
username varchar(16),
password varchar(40));


SELECT COUNT(*) INTO TABLE_COUNT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='Capstone';

IF TABLE_COUNT = 51 THEN
        SET LOG_DETAILS = 'ALL THE TABLES ARE CREATED SUCCESSFULLY';
ELSE
		SET LOG_DETAILS = 'THERE IS NO MISMATCH IN THE NUMBER OF TABLES';
END IF;


INSERT INTO Capstone_SYS_AUDIT_CONTROL 
    (
    PROCESS_NAME,
    OPERATION_TYPE,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        PROCESS_NAME,
        OPERATION_TYPE,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());

END