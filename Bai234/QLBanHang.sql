create database Bai2_qlbanhang;
use Bai2_qlbanhang; 

create table customer(
customerId int auto_increment primary key,
ten varchar(50),
tuoi tinyint
);

create table product(
productId int auto_increment primary key,
tensanpham varchar(50),
giasanpham float
);


create table chitietdonhang(
chitietdonhangID int primary key,
customerId int,
productId int,
quatity int,
foreign key (customerId) references customer(customerId),
foreign key (productId) references product(productID)
);


create table orders(
ordersID int primary key,
customerId int,
ngaydathang datetime,
totalprice float,
sanphammua int,
foreign key (sanphammua) references chitietdonhang(chitietdonhangID)
);

