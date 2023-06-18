use bai2_qlsinhvien;
create table class(
ClassID int auto_increment primary key,
className varchar(60) not null,
startDate datetime not null,
status bit 
);

create table Student(
StudentID int auto_increment primary key,
StudentName varchar(30) not null,
Address varchar(50),
Phone varchar(12),
Status bit ,
ClassID int not null,
foreign key (ClassID) references Class(ClassID)
);

create table Subject_(
SubjectID int auto_increment primary key,
SubjectName varchar(30) not null,
Credit tinyint not null Default 1 check(Credit >=1),
Status bit default 1
);

create table Mark(
MarkID int auto_increment primary key ,
SubID int not null ,
StudentID int not null,
Mark float default 0 check (Mark between 0 and 100),
ExamTimes tinyint default 1,
unique(SubID,StudentID),
foreign key (SubId) references Subject_(SubjectID),
foreign key (StudentID) references Student(StudentID) 
);

use bai2_qlsinhvien;
insert into Class values (1,"A1","2001-08-12",1);
insert into Class values (2,"C1",current_date(),0);
insert into Class values (3,"B1","2022-08-20",1);
insert into Class values (4,"D1","2022-12-01",0);
insert into Class values (5,"E1","2022-12-10",0);

insert into Student values (1,"Hung","Ha Noi","0912113113",1,1);
insert into Student(StudentID,StudentName,Address,Status,ClassID) values (2,"Hoa","Hai Phong",1,1);
insert into Student values (3,"Manh","HCM","1234567891",0,2);
insert into Student values (4,"Ha","Hai Duong","1234567891",0,2);
insert into Student values (5,"hai","Hai Duong","1234567891",0,2);
insert into Student values (6,"Hong","Nam Dinh","1234567891",0,2);
insert into Student values (7,"Hung","Lang Son","0124578541",0,1);

insert into Subject_ values
(1,"CF",5,1),
(2,"C",6,1),
(3,"HDJ",5,1),
(4,"RDBNS",10,1);
insert into Subject_ values
(5,"AB",3,1),
(6,"CD",4,1);

INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
select * from student;
select * from subject_;
select * from class;

select status from Student where status=true;
select status from Student where status=false;

select * from subject_ where Credit <10; 

select Student.StudentID,Student.StudentName,Student.ClassID,Class.className from Student 
join class on Student.ClassID=Class.ClassID
where class.ClassName="A1";

select Student.StudentId, Student.StudentName,Subject_.SubjectName,Mark.Mark from Student 
join Mark on Student.StudentId=Mark.StudentId
join Subject_ on Mark.SubID=Subject_.SubjectID
where Subject_.SubjectName="CF";

 -- Tìm học sinh có tên bắt đầu từ chữ h 
 
 select StudentID,studentName from student where StudentName like "h%";
 select StudentID,studentName from student where substr(StudentName,1,1)="h";
 
 -- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
 
 select startDate from class where month(startDate)=12;
 
 -- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
 
 select SubjectName,credit from Subject_ where credit  between 3 and 5;
 
 -- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
 
select group_concat(StudentID) into  @Ids from student  where studentName="ha" ;
UPDATE Student SET ClassID = 1 WHERE StudentID IN (SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(@Ids, ',', n.digit+1), ',', -1) AS StudentID FROM (SELECT 0 AS digit UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) n WHERE SUBSTRING_INDEX(SUBSTRING_INDEX(@Ids, ',', n.digit+1), ',', -1) <> '');

-- Hiển thị các thông tin: StudentName, SubName, Mark.
-- Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.

select StudentName,SubjectName,Mark 
from student join Mark on student.StudentID=mark.StudentId
             join Subject_ on subject_.SubjectID=mark.SubID
order by mark desc ,StudentName asc;

-- Hiển thị số lượng sinh viên ở từng nơi

select Address, count(Address) from Student
group by address;
 
-- Tính điểm trung bình các môn học của mỗi học viên
select Student.StudentId, Student.StudentName, Subject_.SubjectName,avg(Mark) as DiêmTrungBinh
from Student 
join Mark on Student.StudentID=Mark.StudentId
join Subject_ on Subject_.SubjectId=Mark.SubID
group by Student.StudentId, Student.StudentName, Subject_.SubjectName;


-- Hiển thị những bạn học viên có điểm trung bình các môn học lớn hơn 15

select Student.StudentId, Student.StudentName, avg(Mark.Mark) as DiemTrungBinh
from Student 
join Mark on Student.StudentId=Mark.StudentId
group by Student.StudentId, Student.StudentName
having avg(Mark)>=15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.

select Student.StudentId, Student.StudentName, avg(Mark.Mark) as DiemTrungBinh
from Student 
join Mark on Student.StudentId=Mark.StudentId
group by Student.StudentId, Student.StudentName
having avg(Mark) >=all (select avg(Mark) from Mark group by Mark.StudentId);

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.

select SubjectId,SubjectName,Credit,Status
from Subject_
where Credit=(select max(Credit) from Subject_)
group by SubjectId,SubjectName,Credit,Status;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

select * 
from Subject_
join Mark on Subject_.SubjectId=Mark.SubId
where Mark =(select max(Mark) from Mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, 
-- xếp hạng theo thứ tự điểm giảm dần

select Student.StudentId, Student.StudentName, Student.Address, Student.Phone, Student.Status,ClassId,avg(Mark) as DiemTrungBinh
from Student
join Mark on Student.StudentId=Mark.StudentId
group by Student.StudentId, Student.StudentName, Student.Address, Student.Phone, Student.Status
order by avg(Mark)  desc, Student.StudentName;











