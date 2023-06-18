create database Bai2_qlbanhang;
use Bai2_qlbanhang; 

create table customer(
customerId int auto_increment primary key,
ten varchar(50),
tuoi tinyint
);

create table product(
productId int auto_increment primary key,
tensanpham varchar(50),
giasanpham float
);


create table orders(
ordersID int primary key,
customerId int,
ngaydathang datetime,
totalprice float,
foreign key (customerId) references customer(customerId)
);


create table chitietdonhang(
ordersID int ,
productId int,
quatity int,
primary key(ordersID,productID),
foreign key (ordersID) references orders(ordersID),
foreign key (productId) references product(productID)
);

-- Hiển thị các thông tin  gồm ordersId, ngaydathang, totalprice của tất cả các hóa đơn trong bảng Order

select ordersId,ngaydathang,totalprice from orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

select ten,tensanpham
from customer
join orders on customer.customerId=orders.customerId
join chitietdonhang on orders.ordersId=chitietdonhang.ordersId 
join product on chitietdonhang.productId=product.productId;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select ten 
from customer 
left join orders on customer.customerId = orders.customerId
where orders.ordersId is null ;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại
-- mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

select orders.ordersId,orders.ngaydathang,sum(chitietdonhang.quatity*product.giasanpham) as totalprice
from orders
join chitietdonhang on orders.ordersId=chitietdonhang.ordersId
join product on chitietdonhang.productId=product.productId
group by orders.ordersId,orders.ngaydathang;



