/*
Bài tập 3: Hệ thống bán hàng
Yêu cầu:
Một cửa hàng muốn xây dựng một hệ thống bán hàng. 
Hệ thống này cần lưu trữ thông tin về sản phẩm, đơn hàng và khách hàng. 
Mỗi sản phẩm có mã sản phẩm, tên sản phẩm, giá và số lượng trong kho. 
Mỗi đơn hàng có mã đơn hàng, ngày đặt hàng, mã khách hàng và tổng giá trị đơn hàng. 
Mỗi khách hàng có mã khách hàng, tên khách hàng, địa chỉ và thông tin liên hệ. 
Hãy thiết kế CSDL quan hệ để đáp ứng các yêu cầu trên.
*/

create database btslack_hethongbanhang;
use btslack_hethongbanhang;


create table donhang(
madonhang varchar(50) primary key,
ngaydathang datetime not null,
makhachhang varchar(50) not null, 
tonggiatri float check(tonggiatri>0),
foreign key(makhachhang) references khachhang(makhachhang)
);

create table sanpham(
masanpham varchar(50) primary key,
tensanpham varchar(50) not null unique,
giasanpham float not null,
soluong int default 0 check (soluong>=0)
);

create table chitietdonhang(
masanpham varchar(50)  not null unique,
madonhang varchar(50) not null unique,
soluong int check(soluong>=0) ,
primary key(masanpham,madonhang),
foreign key(masanpham) references sanpham(masanpham),
foreign key(madonhang) references donhang(madonhang)
);

create table khachhang(
makhachhang varchar(50) primary key,
tenkhachhang varchar(50) not null,
diachi varchar(50) not null,
SDT varchar(12) not null
);
