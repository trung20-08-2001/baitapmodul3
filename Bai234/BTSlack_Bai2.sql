/*
Bài tập 2: Hệ thống thư viện
Yêu cầu:
Một thư viện muốn xây dựng một hệ thống quản lý sách.
Hệ thống này cần lưu trữ thông tin về sách, tác giả, thể loại và độc giả.
Mỗi sách có mã sách, tên sách, tác giả và thể loại. 
Mỗi tác giả có mã tác giả, tên tác giả và quốc tịch.
Mỗi độc giả có mã độc giả, tên độc giả, địa chỉ và thông tin liên hệ.
Hãy thiết kế CSDL quan hệ để đáp ứng các yêu cầu trên.
*/

create database btslack_hethongthuvien;
use btslack_hethongthuvien;

create table tacgia(
matacgia varchar(50) primary key,
tentacgia varchar(50) not null,
quoctich varchar(50) not null
);


create table sach(
masach varchar(50) primary key,
tensach varchar(50) not null unique,
tacgia varchar(50) not null,
theloai varchar(50) not null,
matacgia varchar(50) not null,
foreign key (matacgia) references tacgia(matacgia)
);

create table docgia(
madocgia varchar(50) primary key,
tendocgia varchar(50) not null,
diachi varchar(50) not null,
SDT varchar(12) not null,
masach varchar(50) not null,
foreign key (masach) references sach(masach)
);
