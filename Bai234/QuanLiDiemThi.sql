create database Bai2_QuanLyDiemThi;

use Bai2_QuanLyDiemThi;

create table HocSinh(
MaHocSinh varchar(20) primary key,
nameStudent varchar(50),
brithday datetime,
class varchar(20),
infomation varchar(100)
);


create table MonHoc(
MaMonHoc varchar(20) primary key,
Tenmonhoc varchar(50)
);

create table BangDiem(
MaHocSinh varchar(20),
MaMonHoc varchar(20),
DiemThi int,
NgayKiemTra datetime,
primary key(MaHocSinh,MaMonHoc),
foreign key(MaHocSinh) references HocSinh(MaHocSinh),
foreign key(MaMonHoc) references MonHoc(MaMonHoc)
);

create table GiaoVien(
MaGiaoVien varchar(20) primary key,
TenGiaoVien varchar(20),
SDT varchar(20)
);


alter table MonHoc add MaGV varchar(20);
alter table MonHoc add constraint FK_MaxGV foreign key(MaGV) references GiaoVien(MaGiaoVien);