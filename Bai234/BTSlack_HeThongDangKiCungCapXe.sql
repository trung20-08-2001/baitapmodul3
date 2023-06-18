create database btSlack_hethongxe;
use btSlack_hethongxe;

create table NhaCungCap(
MaNCC varchar(20) primary key,
TenNCC varchar(20) not null unique,
DiaChi varchar(20) not null,
SDT varchar(12) not null,
MaSoThue varchar(20) not null
);

create table LoaiDichVu(
MaLoaiDV varchar(20) primary key,
TenLoaiDV varchar(20) not null unique
);

create table MucPhi(
MaMP varchar(20) primary key,
DonGia int not null,
Mota varchar(50) not null
);

create table DongXe(
DongXe varchar(20) primary key,
HangXe varchar(20) not null,
SoChoNgoi int not null
);

create table DangKyCungCap(
MaDKCC varchar(20) primary key,
MaNCC varchar(20) not null ,
MaLoaiDV varchar(20) not null ,
DongXe varchar(20) not null ,
MaMP varchar(20) not null ,
NgayBatDauCungCap datetime not null,
NgayKetThucCungCap datetime not null,
SoLuongXeDangKy int not null,
foreign key (MaNCC) references NhaCungCap(MaNCC),
foreign key (MaLoaiDV) references LoaiDichVu(MaLoaiDV),
foreign key (DongXe) references DongXe(DongXe),
foreign key (MaMP) references MucPhi(MaMP)
);


--  Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ
select DongXe 
from DongXe where SoChoNgoi>=5;

-- Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
-- thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe
-- thuộc hãng xe “KIA” với mức phí có đơn giá là 20.000 VNĐ/km

select TenNCC,DiaChi,SDT,MaSoThue 
from NhaCungCap 
join DangKyCungCap on NhaCungCap.MaNCC=DangKyCungCap.MaNCC
join DongXe on DangKyCungCap.DongXe=DongXe.DongXe
join MucPhi on DangKyCungCap.MaMP=MucPhi.MaMP
where (DongXe.HangXe="Toyota" and MucPhi.DonGia=15000) or (DongXe.HangXe="KIA" and MucPhi.DonGia=20000);

-- Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung cấp và giảm dần theo mã số thuế

select * 
from NhaCungCap 
order by TenNCC,MaSoThue desc;


-- Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với
-- yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu
-- cung cấp là “20/11/2015”

select NhaCungCap.TenNCC,count(DangKyCungCap.MaNCC) as SoLanDangKy
from NhaCungCap
join DangKyCungCap on NhaCungCap.MaNCC=DangKyCungCap.MaNCC
where DangKyCungCap.NgayBatDauCungCap>"2015-11-20"
group by  NhaCungCap.TenNCC;

--  Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe chỉ được liệt kê một lần

select HangXe 
from DongXe
group by HangXe;

-- Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV, DonGia,
-- HangXe, NgayBatDauCC, NgayKetThucCC của tất cả các lần đăng ký cung cấp phương
-- tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương
-- tiện thì cũng liệt kê thông tin những nhà cung cấp đó ra

select  DangKyCungCap.MaDKCC, NhaCungCap.MaNCC ,NhaCungCap.DiaChi, NhaCungCap.MaSoThue, MucPhi.DonGia, DongXe.HangXe, DangKyCungCap.NgayBatDauCungCap, DangKyCungCap.NgayKetThucCungCap
from NhaCungCap
left join DangKyCungCap on DangKyCungCap.MaNCC=NhaCungCap.MaNCC
left join LoaiDichVu on DangKyCungCap.MaLoaiDV=LoaiDichVu.MaLoaiDV
left join DongXe on DangKyCungCap.DongXe=DongXe.DongXe
left join MucPhi on DangKyCungCap.MaMP=MucPhi.MaMP;

-- Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện
-- thuộc dòng xe “Hiace” hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe “Cerato”

select NhaCungCap.MaNCC, NhaCungCap.TenNCC, NhaCungCap.DiaChi, NhaCungCap.SDT, NhaCungCap.MaSoThue
from NhaCungCap
join DangKyCungCap on NhaCungCap.MaNCC=DangKyCungCap.MaNCC
where  DangKyCungCap.DongXe="Hiace" or  DangKyCungCap.DongXe="Cerato ";

-- Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp
-- phương tiện lần nào cả.

select NhaCungCap.MaNCC, NhaCungCap.TenNCC, NhaCungCap.DiaChi, NhaCungCap.SDT, NhaCungCap.MaSoThue
from NhaCungCap
left join DangKyCungCap on DangKyCungCap.MaNCC=NhaCungCap.MaNCC
where DangKyCungCap.MaNCC is null;
