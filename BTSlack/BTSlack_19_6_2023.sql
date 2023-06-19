create database BTSlack_19_6_2023;
use BTSlack_19_6_2023;

create table KHACHHANG (
MAKH int auto_increment primary key,
HOTEN varchar(30) not null,
DCHI varchar(30),
SODT varchar(12),
NGSINH date, 
DOANHSO float default 0,
NGDK date
);

create table NHANVIEN (
MANV int auto_increment primary key,
HOTEN varchar(30) not null,
NGVL date not null,
SODT varchar(12)
);

create table SANPHAM(
MASP int auto_increment primary key,
TENSP varchar(20)not null,
DVT varchar(20),
NUOCSX varchar(20) not null,
GIA float not null
);

CREATE TABLE HOADON(
SOHD INT auto_increment primary KEY,
NGAY DATE NOT NULL,
MAKH INT NOT NULL,
MANV INT NOT NULL,
TRIGIA FLOAT DEFAULT 0,
foreign key (MAKH) REFERENCES KHACHHANG(MAKH),
FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
);


CREATE TABLE CTHD(
SOHD INT NOT NULL,
MASP INT NOT NULL,
SL INT,
FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD),
FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP) 
);

INSERT INTO KHACHHANG(HOTEN,DCHI,SODT,NGSINH,NGDK) VALUES
("lÊ VĂN A","HÀ NỘI","12345678910","2001-3-12","2022-2-13"),
("NGUYỄN THỊ B","HẢI DƯƠNG","12345678910","2002-3-15","2023-5-13"),
("PHẠM VĂN C","HÀ NỘI","12345678910","2000-3-12","2020-2-15"),
("LÝ THỊ D","HẢI PHÒNG","12345678910","2005-5-6","2023-6-15");

INSERT INTO SANPHAM(TENSP,DVT,NUOCSX,GIA) VALUES
("ĐIỀU HÒA","CÁI","NHẬT BẢN",5),
("TỦ LẠNH","CÁI","TRUNG QUỐC",4),
("ĐIỆN THOẠI","CÁI","VIỆT NAM",3),
("GẠO","CÂN","VIỆT NAM",2),
('KHOAI', 'CÂN', 'TRUNG QUỐC', '1');

INSERT INTO NHANVIEN(HOTEN,NGVL,SODT) VALUES 
("T","2022-5-12","01234567899"),
("B","2023-5-12","01234567899"),
("Z","2022-12-12","01234567899");

INSERT INTO HOADON(NGAY,MAKH,MANV) VALUES
("2023-6-12",1,1),
("2023-6-12",2,1),
("2023-6-12",3,1),
("2023-6-12",4,1),
("2023-6-12",1,2),
("2023-6-12",2,2),
("2023-6-12",3,2),
("2022-12-30",4,2),
("2022-12-30",1,2),
("2022-12-30",3,2),
("2022-12-30",3,3),
("2022-12-30",3,2),
("2022-12-30",4,3),
("2022-12-30",4,2);

INSERT INTO CTHD(SOHD,MASP,SL) VALUES 
(2,2,1),
(3,4,2),
(6,3,10),
(9,1,2),
(10,2,2),
(7,1,5),
(1,1,3);


DELIMITER //
CREATE TRIGGER TINHHOADON BEFORE INSERT ON CTHD 
FOR EACH ROW
BEGIN 
UPDATE HOADON SET TRIGIA =(SELECT SUM(CTHD.SL * SANPHAM.GIA) FROM CTHD JOIN SANPHAM ON (NEW.MASP = SANPHAM.MASP))
WHERE HOADON.SOHD=NEW.SOHD;
END //
DELIMITER ;

DROP  TRIGGER TINHHOADON;
-- 1. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2023.

SELECT COUNT(MASP) AS `SỐ SP KHÁC NHAU BÁN RA TRONG NĂM 2023`
FROM CTHD 
JOIN HOADON ON CTHD.SOHD=HOADON.SOHD AND YEAR(HOADON.NGAY)=2023;

-- 2. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?

SELECT MAX(TRIGIA) AS `HÓA ĐƠN CAO NHẤT`,MIN(TRIGIA) `HÓA ĐƠN THẤP NHÂT`
FROM HOADON;


-- 3. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2023 là bao nhiêu?

SELECT AVG(TRIGIA) AS `GIÁ TRỊ TRUNG BÌNH HÓA ĐƠN NĂM 2023`
FROM HOADON
WHERE YEAR(NGAY)=2023;

-- 4. Tính doanh thu bán hàng trong năm 2023.

SELECT SUM(TRIGIA) AS `DOANH THU NĂM 2023`
FROM HOADON
WHERE YEAR(NGAY)=2023;

-- 5. Tìm số hóa đơn có trị giá cao nhất trong năm 2023.

SELECT SOHD,TRIGIA 
FROM HOADON
WHERE  TRIGIA=ALL(SELECT MAX(TRIGIA) AS TRIGIAMAX FROM HOADON WHERE YEAR(NGAY)=2023 GROUP BY YEAR(NGAY)=2023);

-- 6. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.

SELECT HOTEN 
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.MAKH=HOADON.MAKH
WHERE TRIGIA=ALL(SELECT MAX(TRIGIA) AS TRIGIAMAX FROM HOADON WHERE YEAR(NGAY)=2023 GROUP BY YEAR(NGAY)=2023);
 
-- 7. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.

SELECT MAKH,HOTEN FROM KHACHHANG 
ORDER BY DOANHSO DESC
LIMIT 3;

-- 8. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.

SELECT MASP,TENSP FROM SANPHAM
ORDER BY GIA DESC
LIMIT 3;

-- 9. In ra danh sách các sản phẩm (MASP, TENSP)
--    do “VIỆT NAM” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).

SELECT MASP,TENSP FROM SANPHAM
WHERE NUOCSX="VIỆT NAM" AND GIA IN(SELECT GIA FROM(SELECT GIA FROM SANPHAM ORDER BY GIA DESC LIMIT 3) AS SUBQUERY);

-- 10. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất
--     có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT MASP,TENSP FROM SANPHAM
WHERE NUOCSX ="TRUNG QUỐC" AND GIA IN (SELECT GIA FROM(SELECT GIA FROM  SANPHAM ORDER BY GIA DESC LIMIT 3) AS SUBQUERY);


-- 11. * In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).

SELECT MAKH,HOTEN,DOANHSO FROM KHACHHANG 
ORDER BY DOANHSO DESC
LIMIT 3;


-- 12. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.

SELECT COUNT(MASP) AS `SỐ SP DO TQ SX` 
FROM SANPHAM
WHERE NUOCSX="TRUNG QUỐC";

-- 13. Tính tổng số sản phẩm của từng nước sản xuất.

SELECT NUOCSX,COUNT(MASP) AS `SỐ SP`
FROM SANPHAM
GROUP BY NUOCSX;

-- 14. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.









