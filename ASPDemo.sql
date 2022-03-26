create database ASPDemo
go 
use ASPDemo
go 
create table Department
( 
DeptId int identity primary key,
DeptName varchar(30) not null
) 
go 
insert into Department values('Sales')
insert into Department values('IT')
insert into Department values('HR')
insert into Department values('Admin')
go 
delete from Department
go
select * from Department
--DeptId DeptName
--1 	Sales
--2 	IT
--3	    HR
--4		Admin

go
create table Userlogin
(
LoginID int identity primary key,
EnpID int references Employees(EmpID),
UserName varchar(30) not null,
Passwd varchar(30) not null,
DeptId int not null references Department(DeptId)
)
go
insert into Userlogin values(8,'pqr','pqr',1)
insert into Userlogin values(1,'raj','raj',1)
insert into Userlogin values(2,'neha','neha',1)
insert into Userlogin values(9,'admin','admin',4)
go
select * from Userlogin
--LoginID Username Passwwd DeptID
--1	    raj    	 raj	 1
--2		neha	 neha	 1
--3		admin	 admin	 4
go
--deleting data of userLogin
delete from Userlogin
go
--change/update password
update UserLogin set Passwd='asd' where UserName='asd' and Passwd='asda'
go
--already exist user 
select UserName from Userlogin
go

create table Employees
(
EmpID int identity primary key,
EmpName varchar(30) not null,
EmailID varchar(100) not null,
Mobile varchar(12) not null,
PanCard varchar(20) not null unique,
Age int not null,
DeptId int not null references Department(DeptID)
)
go
alter table Employees
add constraint unique_pancard unique(PanCard)

go
--adding unique key for pan card
alter table Employees
add constraint unique_pancard unique(PanCard)
go
--drop employees table
drop table Employees
go

insert into Employees values('Neha','neha@gmail.com','9284562536','FAS4152',20,1)
insert into Employees values('Raj','raj@gmail.com','9284562036','FAS4152',22,1)
go
select * from Employees 
--EmpID EmpName EmailID			Mobile      PanCard Age DeptID
--1		Neha	neha@gmail.com	9284562536	FAS4152	20	1
go
--deleting data from Employees
delete from Employees
go
--selecting pan card
select EmpId from Employees where panCard='ASDFG1234D'
go 
--showing all data to admin
select d.DeptId,d.DeptName,e.EmpID,EmpName,e.EmailID,e.Mobile,e.PanCard from Department d inner join Employees e on d.DeptId=e.DeptId order by e.EmpName
go
-- Show data of specific employee
select d.DeptId,d.DeptName,e.EmpID,e.EmpName,e.EmailID,e.Mobile,e.PanCard,e.Age from Department d,Employees e where e.DeptId=d.DeptId and e.PanCard='FAS4152'
go
--insert data into Employees table /employess data insertion
insert into Userlogin values('himanshu','himanshu',1)  --UserLogin table
insert into Employees values('Himanshu','himanshu@gmail.com','9284562636','FAS4154',25,1) --Employees table
go 
select * from ( select * from Userlogin where UserName='neha' and Passwd='neha') u inner join Employees e on u.DeptId=e.DeptId
go
--get pancard num
select e.PanCard from Employees e, Userlogin u where e.EmpId=u.EnpID and u.UserName='zxc'
go
--show employee details comes under same department
select d.DeptId,d.DeptName,e.EmpID,e.EmpName,e.EmailID,e.Mobile,e.PanCard,e.Age from Department d,Employees e where e.DeptId=d.DeptId
go
--update employee information
select * from Employees e,Userlogin u where e.DeptID=u.DeptId
go
update Employees set EmpName='asda' where EmpID=(select EnpID from Userlogin)

go
--show all emp data
select d.DeptId,d.DeptName,e.EmpID,e.EmpName,e.EmailID,e.Mobile,e.PanCard,e.Age from Department d,Employees e where e.DeptId=d.DeptId
go 
--get empid where user name=""
update Employees set EmpName='asd',EmailID='asda@gmail.com',Mobile='4152639685',PanCard='ASDFG1234S',Age=14,DeptId=10 where EmpID=15
--get dept id where emp id= from dept
select DeptId from Userlogin where EnpID=19
go
--
go
select DeptName from Department where DeptId=10
go
select d.DeptId,d.DeptName,e.EmpID,e.EmpName,e.EmailID,e.Mobile,e.PanCard,e.Age from Department d,Employees e where e.DeptId=d.DeptId and d.DeptName='IT' order by d.DeptId




