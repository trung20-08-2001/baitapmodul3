/*
Bài tập 5: Hệ thống blog
Yêu cầu:
Một trang web blog muốn xây dựng một hệ thống quản lý bài viết và người dùng. 
Hệ thống này cần lưu trữ thông tin về bài viết, tác giả và người đọc. 
Mỗi bài viết có mã bài viết, tiêu đề, nội dung và ngày đăng. 
Mỗi tác giả có mã tác giả, tên tác giả và thông tin liên hệ. 
Mỗi người đọc có mã người đọc, tên người đọc và thông tin liên hệ. 
Hãy thiết kế CSDL quan hệ để đáp ứng các yêu cầu trên.
*/


create database btslack_hethongblog;
use btslack_hethongblog;

create table tacgia(
matacgia varchar(50) primary key,
tentacgia varchar(50) not null,
SDT varchar(12) not null
);

create table baiviet(
mabaiviet varchar(50) primary key,
tieude varchar(50) not null,
noidung varchar(500) not null,
ngaydang datetime not null,
matacgia varchar(50) not null,
foreign key (matacgia) references tacgia(matacgia)
);


create table nguoidoc(
manguoidoc varchar(50) primary key,
tennguoidoc varchar(50) not null,
SDT varchar(50) not null
);

create table chitietbaiviet(
mabaiviet varchar(50) not null,
manguoidoc varchar(50) not null,
primary key (manguoidoc,mabaiviet),
foreign key (mabaiviet) references baiviet(mabaiviet),
foreign key (manguoidoc) references nguoidoc(manguoidoc)
);