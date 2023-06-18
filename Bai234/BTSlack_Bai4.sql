/*
Bài tập 4: Hệ thống quản lý nhân sự
Yêu cầu:
Một công ty muốn xây dựng một hệ thống quản lý nhân sự. 
Hệ thống này cần lưu trữ thông tin về nhân viên, phòng ban và dự án. 
Mỗi nhân viên có mã nhân viên, tên nhân viên, ngày sinh, địa chỉ và lương. 
Mỗi phòng ban có mã phòng ban, tên phòng ban và người quản lý. 
Mỗi dự án có mã dự án, tên dự án và mô tả. 
Mỗi nhân viên có thể thuộc về một phòng ban và tham gia vào nhiều dự án. 
Hãy thiết kế CSDL quan hệ để đáp ứng các yêu cầu trên.
*/

create database btslack_hethongquanlinhansu;
use btslack_hethongquanlinhansu;

create table phongban(
maphongban varchar(50) primary key,
tenphongban varchar(50) not null,
nguoiquanli varchar(50) not null
);

create table duan(
maduan varchar(50) primary key,
tenduan varchar(50) not null,
mota varchar(100) 
);

create table nhanvien(
manhanvien varchar(50) primary key,
tennhanvien varchar(50) not null,
ngaysinh datetime not null,
diachi varchar(50) not null,
luong float not null,
maphongban varchar(50) not null,
foreign key (maphongban) references phongban(maphongban)
);

create table chitietduan(
maduan varchar(50) not null,
manhanvien varchar(50) not null,
primary key(maduan,manhanvien),
foreign key(maduan) references duan(maduan),
foreign key(manhanvien) references nhanvien(manhanvien)
);