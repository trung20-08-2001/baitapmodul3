create database Bai12_QL_Customer;
use Bai12_QL_Customer;

create table Customer(
ID int auto_increment primary key,
Name varchar(20) not null,
Age tinyint not null,
Img varchar(1000)
);



insert into Customer(Name,Age,Img) values
("A",18,"https://kichducnu.com/wp-content/uploads/2021/06/Nguyen-Bao-Thoa-97.jpg"),
("B",23,"https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh-6.jpg"),
("C",15,"https://i.pinimg.com/originals/34/bd/4d/34bd4dfd13499e0fdca21fa353290cd2.jpg"),
("D",30,"https://thethao99.com/wp-content/uploads/2020/11/hot_girl_gai_xinh-653.jpg"),
("E",20,"https://upanh123.com/wp-content/uploads/2020/10/Anh-gai-xinh-lam-anh-dai-dien-facebook7.jpg"),
("F",23,"https://img.docbao.vn/images/fullsize/2018/03/08/co-gai-9.jpg"),
("G",26,"https://img2.thuthuatphanmem.vn/uploads/2019/01/04/anh-gai-xinh_025101471.jpg"),
("H",24,"https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh.jpg");