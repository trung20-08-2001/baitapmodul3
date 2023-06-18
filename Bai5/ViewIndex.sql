create database bai5_ViewIndexStoreProcedure;
use  bai5_ViewIndexStoreProcedure;

create table `product`(
`Id` int auto_increment primary key,
`productCode`  varchar(20) not null,
`productName` varchar(20) not null,
`productPrice` float not null,
`productAmount` int not null,
`productDescription` varchar(50),
`productStatus` bit default 1
);

alter table  product add unique (productName);

insert into product (productCode,productName,productPrice,productAmount,productDescription) values
("A","Quat",1,10,"Mô tả A"),
("B","Diêu Hoa",5,102,"Mô tả B"),
("C","Tu lanh",10,12,"Mô tả C"),
("D","Laptop",15,8,"Mô tả D"),
("E","Tivi",20,6,"Mô tả E"),
("F","May giat",25,50,"Mô tả F"),
("G","Bep dien",30,20,"Mô tả G");


-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)

alter table product add index indexProductCode(ProductCod);
-- Cách 2: create index indexProductCode on product (ProductCode);
explain select * from product where productCode="H" ;
alter table product drop index indexProductCode;

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)

alter table Product add index index_productName_ProductName(productName, productPrice);
-- Cách 2: CREATE INDEX idx_productName_productPrice ON Products (productName, productPrice);
explain select * from Product where ProductCode="C" and ProductName like "T%";
alter table Product drop index index_productName_ProductName;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.

create view view_product as
select productCode,productName,productPrice,productStatus
from product;

select * from view_product;

-- Tiến hành sửa đổi view
create or replace view view_product as
select productName
from product;

-- Tiến hành xoá view
drop view view_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

delimiter // 
create procedure getInfomationProduct()
begin 
      select * from product;
end //
delimiter ; 

call getInfomationProduct;

delimiter //
drop procedure if exists getInfomationProduct;

-- Tạo store procedure thêm một sản phẩm mới

delimiter //
create procedure addProduct(
in productCode varchar(20),
in productName varchar(20),
in productPrice float,
in productAmount int,
in productDescription varchar(50)
)
begin
insert into Product(productCode,productName,productPrice,productAmount,productDescription)
values(productCode,productName,productPrice,productAmount,productDescription);
end  //
delimiter ;

call addProduct("H","Diên thoai",35,10,"Mô tả H");

delimiter //
drop procedure if EXISTS addProduct; //
-- Tạo store procedure sửa thông tin sản phẩm theo id

delimiter //
create procedure UpdateProductById(
in ProductId int ,
in productCode varchar(20),
in productName varchar(20),
in productPrice float,
in productAmount int,
in productDescription varchar(50),
in productStatus bit)
begin
update Product set
productCode=productCode,
productName=productName,
productPrice=productPrice,
productAmount=productAmount,
productDescription=productDescription,
productStatus=productStatus
where Id=ProductId;
end //
delimiter ;

call  UpdateProductById(1,"I","Tai nghe",40,100,"Mô tả I",1);

delimiter //
drop procedure if exists UpdateProductById;

-- Tạo store procedure xoá sản phẩm theo id

delimiter //
create procedure DeleteProductById(in ProductId int)
begin 
delete from Product where id=ProductId;
end //
delimiter ;

call DeleteProductByid(9) ;

delimiter //
drop procedure if exists  DeleteProductByid;
