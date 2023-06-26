create database Bai12_QL_User;
use Bai12_QL_User;

create table Users(
IdUsers int auto_increment primary key ,
NameUsers varchar(20) not null,
EmailUsers varchar(256) not null,
CountryUsers varchar(120)
);

insert into Users(NameUsers,EmailUsers,CountryUsers) values
("Minh","Minh@gmail.com","VN"),
("Trung","Trung@gmail.com","VN"),
("Kante","Kante@gmail.com","USA");
