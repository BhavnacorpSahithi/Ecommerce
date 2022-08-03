use Bhavnacorp

create table ProductEcom(pid int identity(1,1),prodname nvarchar(20) primary key,prodqty int,price int);
create table CustomerEcom(cid int ,cname nvarchar(30) primary key,address nvarchar(50),phonenumber int,age int,gender nvarchar(10));
create table OrderEcom(Oid int primary key,customername nvarchar(30) Foreign Key REFERENCES CustomerEcom(cname),productname nvarchar(20) Foreign Key REFERENCES ProductEcom(prodname),Qtyordered int,totalprice int);

insert into ProductEcom values('laptop',100,40000),('chairs',50,500),('mixer',100,22000),('mobiles',95,27000),('juicer',100,13000),('bottles',100,40),('kurti',100,1000),('spects',100,12000)
insert into CustomerEcom values(1,'vyshnavi','hyd',6757877,50,'female'),(2,'srikanth','hyd',5467566,25,'male'),(3,'naarsimha','delhi',6575767,23,'male'),(4,'rajnikanth','us',656786,40,'male'),(5,'satish','khanpur',9686765,35,'female'),(6,'usha','hyd',126895,65,'female'),(7,'yamuna','uk',446474,26,'female'),(8,'jaanu','badrachalam',535464,23,'female'),(9,'keerthy','vijayawada',1223425,21,'female')
insert into OrderEcom values(1,'vyshnavi','laptop',5,1500000),(2,'naarsimha','mixer',4,2000),(3,'rajnikanth','juicer',1,12000),(4,'satish','kurti',6,700),(5,'usha','spects',2,5000),(6,'vyshnavi','mobiles',3,45000),(7,'yamuna','bottles',7,300),(8,'jaanu','juicer',1,3400),(9,'keerthy','chairs',5,5000)

--order by
select * from ProductEcom order by pid
select * from CustomerEcom order by cid 
select * from OrderEcom 

--group by
select sum(age),gender from CustomerEcom group by gender
select gender,count(cid) from CustomerEcom group by gender

--distinct
select distinct(customername) from  OrderEcom where customername like '%a'
select distinct(cname) from  CustomerEcom where cname like '%[ek]%'

--having
select cname,count(cid) as id from CustomerEcom group by cname having count(cid) < 2 order by cname desc
select productname,sum(totalprice) as id from OrderEcom group by productname having sum(totalprice) > 20000 order by productname desc

--where
select distinct(customername) from  OrderEcom where productname='mixer'





