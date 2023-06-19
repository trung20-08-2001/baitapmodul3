/*
Bài tập 1: Hệ thống đặt vé máy bay
Yêu cầu:
Một hãng hàng không muốn xây dựng một hệ thống đặt vé máy bay trực tuyến. 
Hệ thống này cần lưu trữ thông tin về chuyến bay, hành khách và đặt vé. 
Mỗi chuyến bay có mã chuyến bay, ngày bay, điểm khởi hành, điểm đến, giờ khởi hành và giờ đến.
Mỗi hành khách có mã hành khách, tên, số CMND và thông tin liên hệ. 
Mỗi vé được đặt có mã vé, mã chuyến bay và mã hành khách.
Hãy thiết kế CSDL quan hệ để đáp ứng các yêu cầu trên.
*/

create database BTSlack_hethongdatvemaybay;
use BTSlack_hethongdatvemaybay;

create table chuyenbay(
machuyenbay varchar(50) primary key,
ngaybay datetime not null,
diemkhoihanh varchar(50) not null,
diemden varchar(50) not null,
giokhoihanh time not null,
gioden time not null
);

create table hanhkhach(
mahanhkhach varchar(50) primary key,
ten varchar(50) not null,
soCCCD varchar(20) not null unique,
SDT varchar(12) not null unique,
machuyenbay varchar(50) not null,
foreign key (machuyenbay) references chuyenbay(machuyenbay)
);

create table vemaybay(
mave varchar(50) primary key,
machuyenbay varchar(50) not null,
mahanhkhach varchar(50),
foreign key(machuyenbay) references chuyenbay(machuyenbay)
);
