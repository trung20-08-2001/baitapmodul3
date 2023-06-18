create database bai2_ChuyenDoiERDSangMoHinhQuanHe;
use bai2_ChuyenDoiERDSangMoHinhQuanHe;

create table NhaCungCap(
NhaCCId varchar(20) primary key,
TenNCC varchar(50),
DiaChi varchar(50),
SDT varchar(12)
);

create table DonHang(
SoDonHang int auto_increment primary key,
NgayDatHang datetime,
NhaCCID varchar(20),
foreign key (NhaCCID) references NhaCungCap (NhaCCID)
);

create table VatTu(
MaVattu varchar(20) primary key,
TenVatTu varchar(50)
);

create table ChiTietDonDatHang(
MaVattu varchar(20),
SoDonHang int auto_increment,
foreign key (MaVatTu) references VatTu(MaVattu),
foreign key (SoDonHang) references DonHang(SoDonHang)
);

create table PhieuXuat(
SoPhieuXuat int auto_increment primary key,
NgayXuat datetime
);

create table ChiTietPhieuXuat(
MaVatTu varchar(20),
SoPhieuXuat int,
DonGiaXuat int,
SoLuongXuat int,
foreign key(MaVatTu) references VatTu(MaVatTu),
foreign key (SoPhieuXuat) references PhieuXuat(SoPhieuXuat)
); 

create table PhieuNhap(
SoPhieuNhap int auto_increment primary key,
NgayNhap datetime
);

create table ChiTietPhieuNhap(
DonGiaNhap int,
NgayNhap datetime,
MaVatTu varchar(20),
SoPhieuNhap int,
foreign key (MaVatTu) references VatTu(MaVatTu),
foreign key (SoPhieuNhap) references PhieuNhap(SoPhieuNhap)
);