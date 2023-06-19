create database BT_QLCuaHang;
use  BT_QLCuaHang;

create table KhachHang(
MaKH varchar(20) primary key,
TenKH varchar(20) not null,
Email varchar(20) not null
);

create table DonHang(
MaDH varchar(20)  primary key,
MaKH varchar(20) not null,
NgayDH datetime not null,
foreign key (MaKH) references KhachHang(MaKH)
);

create table Loai(
MaLoai varchar(20)  primary key,
TenLoai varchar(20) not null
);

create table SanPham(
MaSP varchar(20) primary key,
TenSP varchar(20) not null,
GiaSP float not null,
SoLuong int not null,
MaLoai varchar(20) not null,
foreign key (MaLoai) references Loai(MaLoai)
);

create table chitietDH(
MaSP varchar(20) not null,
MaDH varchar(20) not null,
SoLuong int not null,
foreign key (MaSP) references SanPham(MaSP),
foreign key (MaDH) references DonHang(MaDH)
);

-- Hãy viết câu lệnh SQL để lấy thông tin về tên khách hàng
-- và tổng giá trị của các đơn hàng mà khách hàng đó đã đặt trong tháng 6 năm 2023.

select KhachHang.MaKH,  KhachHang.TenKH,  KhachHang.Email , sum(chitietDH.SoLuong*SanPham.GiaSp) as TongGiaDonHang
from KhachHang
join DonHang on KhachHang.MaKH=DonHang.MaKH
join ChitietDH on DonHang.MaDH=ChitietDH.MaDH
join SanPham on ChitietDH.MaSp=SanPham.MaSP
where month(DonHang.NgayDH)=6  and year(DonHang.NgayDH)=2023
group by KhachHang.MaKH, KhachHang.TenKH, KhachHang.Email;

-- Hãy viết câu lệnh SQL để lấy thông tin về tên sản phẩm, 
-- số lượng sản phẩm đã được bán ra, và tổng doanh thu của mỗi sản phẩm trong tháng 6 năm 2023.

select SanPham.MaSP, SanPham.TenSP, SanPham.GiaSp, chitietDH.SoLuong, sum(chitietDH.SoLuong*SanPham.GiaSp)as DoanhThuCuaSanPham
from SanPham
join chitietDH on SanPham.MaSP=chitietDH.MaSP
join Loai on SanPham.MaLoai=Loai.MaLoai
join DonHang on chitietDH.MaDH=DonHang.MaDH
where month(DonHang.NgayDH)=6  and year(DonHang.NgayDH)=2023
group by SanPham.MaSP, SanPham.TenSP, SanPham.GiaSp, chitietDH.SoLuong;
 
-- Hãy viết câu lệnh SQL để lấy thông tin về loại
-- sản phẩm và số lượng các sản phẩm đã được bán ra trong tháng 6 năm 2022.

select Loai.MaLoai, Loai.TenLoai, SoLuongSanPhamBanRa
from Loai
join DonHang on Loai.MaLoai=DonHang;

-- Hãy viết câu lệnh SQL để lấy thông tin về tên khách hàng, 
-- tên sản phẩm và số lượng sản phẩm đã đặt trong đơn hàng của khách hàng đó trong tháng 6 năm 2023.

select TenKH,TenSP,SoLuong
from KhachHang
join chitietDH on KhachHang.MaKH=chitietDH.MaKH

















