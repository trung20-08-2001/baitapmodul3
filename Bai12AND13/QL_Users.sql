create database Bai12_QL_User;
use Bai12_QL_User;

create table Users(
IdUsers int auto_increment primary key ,
NameUsers varchar(20) not null,
EmailUsers varchar(256) not null,
CountryUsers varchar(120)
);

CREATE TABLE PERMISION(
IDPERMISION INT PRIMARY KEY,
NAMEPERMISION VARCHAR(50)
);

CREATE TABLE USER_PERMISION(
IDPERMISION INT,
IDUSERS INT,
FOREIGN KEY (IDPERMISION) REFERENCES PERMISION(IDPERMISION),
FOREIGN KEY (IDUSERS) REFERENCES USERS(IDUSERS)
);

insert into Users(NameUsers,EmailUsers,CountryUsers) values
("Minh","Minh@gmail.com","VN"),
("Trung","Trung@gmail.com","VN"),
("Kante","Kante@gmail.com","USA");

INSERT INTO PERMISION VALUES 
(1,"ADD"), 
(2,"EDIT"), 
(3,"DELETE"), 
(4,"VIEW");

 -- drop database bai12_ql_user;

DELIMITER //
CREATE PROCEDURE GET_USER_BY_ID(IN ID INT)
BEGIN 
SELECT * FROM USERS WHERE IdUsers=ID;
END//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE INSERT_USERS
(IN NEWNAME VARCHAR(20),
IN NEWEMAIL VARCHAR(256),
IN NEWCOUNTRY VARCHAR(120))
BEGIN
   INSERT INTO USERS(NameUsers,EmailUsers,CountryUsers)
   VALUE(NEWNAME,NEWEMAIL,NEWCOUNTRY);
END //
DELIMITER ;

drop database  Bai12_QL_User;
call GET_USER_BY_ID(1);
call INSERT_USERS("Long","long@gmail.com","TQ");



