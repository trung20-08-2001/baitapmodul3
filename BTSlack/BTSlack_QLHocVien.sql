create database BTSlack_QLHocVienVaDiemThi;
use BTSlack_QLHocVienVaDiemThi;

create table Test(
TestID int auto_increment primary key,
NameTest varchar(20) not null
);

create table Student(
StudentId int auto_increment primary key,
StudentName varchar(20) not null,
StudentAge tinyint not null
) ;

create table StudentTest(
TestId int,
StudentId int,
DateTest datetime,
Mark float not null,
primary key (TestId,StudentId),
foreign key (TestId) references Test(TestId),
foreign key (StudentId) references Student(StudentId)
);

insert into Student(StudentName,StudentAge) 
values("Nguyen Hong Ha",20),
      ("Truong Ngoc Anh",30),
      ("Tuan Minh",25),
      ("Dan Truong",22);

insert into Test(NameTest) 
values("EPC"),
      ("DWMX"),
	  ("SQL1"),
	  ("SQL2");
insert into StudentTest(TestId,StudentId,DateTest,Mark)
values (1,1,"2006-7-17",8),
       (2,1,"2006-7-18",5),
	   (3,1,"2006-7-19",7),
	   (1,2,"2006-7-17",7),
       (2,2,"2006-7-18",4),
       (3,2,"2006-7-19",2),
       (1,3,"2006-7-17",10),
       (3,3,"2006-7-18",1);
       
       
-- Hiển thị danh sách các học viên đã tham gia thi,
-- các môn thi được thi bởi các học viên đó

select StudentName,NameTest,Mark,DateTest
from Student 
join StudentTest on Student.StudentId=StudentTest.StudentId
join Test on StudentTest.TestId=Test.TestId;


-- Hiển thị danh sách các bạn học viên chưa thi môn nào

select Student.StudentId,Student.StudentName,Student.StudentAge
from Student
left join StudentTest on Student.StudentId=StudentTest.StudentId
where TestID is null;

-- Hiển thị danh sách học viên phải thi lại,
-- tên môn học phải thi lại và điểm thi(điểm phải thi lại là điểm nhỏ hơn 5) 

select Student.StudentName, Test.NameTest, StudentTest.Mark,StudentTest.DateTest
from Student 
join StudentTest on Student.StudentId=StudentTest.StudentId
join Test on StudentTest.TestId=Test.TestId
where Mark<5;

-- Hiển thị danh sách học viên và điểm trung bình(Average) của các môn đã thi. 
-- Danh sách phải sắp xếp theo thứ tự điểm trung bình giảm dần

select StudentName,avg(Mark) as DiemTrungBinh
from Student
join StudentTest on Student.StudentId=StudentTest.StudentId
group by StudentName
order by avg(Mark) desc;

-- Hiển thị tên và điểm trung bình của học viên có điểm trung bình lớn nhất

select StudentName, avg(Mark) as DiemTrungBinh
from Student
join StudentTest on Student.StudentId=StudentTest.StudentId		
group by StudentName
-- having avg(Mark) = (SELECT MAX(avg_mark) FROM(SELECT AVG(Mark) AS avg_mark FROM StudentTest GROUP BY StudentId) AS subquery);
having avg(Mark) >=all(select avg(Mark) from StudentTest group by StudentId);

-- Hiển thị điểm thi cao nhất của từng môn học

select NameTest,max(Mark) as `Max Mark`
from StudentTest
join Test on StudentTest.TestId=Test.TestId
group by NameTest
order by NameTest;

-- Hiển thị danh sách tất cả các học viên và môn học mà các học viên đó đã thi
-- nếu học viên chưa thi môn nào thì phần tên môn học để Null 

select StudentName,NameTest
from Student
left join StudentTest on Student.StudentId=StudentTest.StudentId
left join Test on StudentTest.TestId=Test.TestId;

-- Sửa (Update) tuổi của tất cả các học viên mỗi người lên một tuổi.

delimiter //
create procedure UpdateAgeStudent()
begin
update Student set StudentAge=StudentAge+1 where StudentId;
end //
delimiter ;
call UpdateAgeStudent;
drop procedure UpdateAgeStudent;

-- Thêm trường tên là Status có kiểu Varchar(10) vào bảng Student.

alter table Student add column StudentStatus varchar(10);

alter table Student drop column StudentStatus;

-- Cập nhật(Update) trường Status sao cho 
-- những học viên nhỏ hơn 30 tuổi sẽ nhận giá trị ‘Young’,
-- trường hợp còn lại nhận giá trị ‘Old’ 
-- sau đó hiển thị toàn bộ nội dung bảng Student

delimiter //
create procedure UpdateStatusStudent()
begin
drop table if exists TableStudentIdYoung,TableStudentIdOld;

create temporary table TableStudentIdYoung select StudentId from Student where StudentAge<30;
update Student set StudentStatus='Young' where StudentId in (select StudentId from TableStudentIdYoung);

create temporary table TableStudentIdOld select StudentId from Student where StudentAge>=30;
update Student set StudentStatus='OLd' where StudentId in(select StudentId from TableStudentIdOld);

select * from Student;
end //
delimiter ;

call UpdateStatusStudent;
drop procedure UpdateStatusStudent;

-- Tạo view tên là vwStudentTestList hiển thị danh sách học viên và điểm thi,
-- dánh sách phải sắp xếp tăng dần theo ngày thi

create view vwStudentTestList as
select StudentName,NameTest,Mark,DateTest
from Student
join StudentTest on Student.StudentId=StudentTest.StudentId
join Test on StudentTest.TestId=Test.TestId
order by DateTest;

select * from vwStudentTestList;
drop view vwStudentTestList;

-- Tạo một trigger tên là tgSetStatus sao cho khi sửa tuổi của học viên thì
-- trigger này sẽ tự động cập nhật status theo quy tắc sau:
-- Nếu tuổi nhỏ hơn 30 thì Status=’Young’
-- Nếu tuổi lớn hơn hoặc bằng 30 thì Status=’Old’


delimiter //
create trigger tgSetStatus before  update on Student
for each row
begin
    if new.StudentAge<30 then set new.StudentStatus="Young";
    else set new.StudentStatus="Old";
    end if ;
end  //
delimiter ;

drop trigger if exists tdSetStatus;

delimiter //
create procedure UpdateAge(in age tinyint,in id int)
begin 
update Student set StudentAge=age where StudentId=id;
select * from Student;
end //
delimiter ;

call UpdateAge(20,2);

drop procedure UpdateAge;

/*
Tạo một stored procedure tên là spViewStatus, stored procedure này nhận vào 2 tham số:
 +Tham số thứ nhất là tên học viên					
 +Tham số thứ 2 là tên môn học
Nếu tên học viên hoặc tên môn học không tìm thây trong cơ sở dữ liệu thì hiện ra màn hình thông báo: ‘Khong tim thay’
Trường hợp còn lại thi hiển thị trạng thái của học viên đó với môn học đó theo quy tắc sau:
Hiển thị ‘Chua thi’ nếu học viên đó chưa thi môn đó
Hiển thị ‘Do’ nếu đã thi rồi và điểm lơn hơn hoặc bằng 5
Hiển thị ‘Trượt’ nếu đã thi rồi và điểm thi nhỏ hơn 5
*/

delimiter //
create procedure spViewStatus(
in NameStudent varchar(20),
in TestName varchar(20)
)
begin 
set @StudentId=null;
set @TestId=null;
select StudentId into @StudentId from Student where StudentName=NameStudent;
select TestId into @TestId from Test where NameTest=TestName;
select @StudentId,@TestId;
if @StudentId is null or @TestId is null then
    select "Không tìm thấy" ;
else 
    set @Mark=null;
	select Mark into @Mark from StudentTest where (TestId=@TestId and StudentId=@StudentId);
    select @Mark;
    if @Mark is null then select 'Chưa thi';
       else 
          if @Mark>=5 then select 'Đỗ';
         else select 'Trượt';
         end if;
    end if;
end if ;
end //
delimiter ;

call spViewStatus("Dnan Truong","SQL1");
drop procedure spViewStatus;


delete from Test where TestId in(5,6,7,8);

