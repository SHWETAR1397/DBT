#Assignment – 11 SUBQUERIES

create database asgn9;
use asgn9;
create table SALESPEOPLE
(
Snum int(4),
Sname varchar(10),
City varchar(10),
Comm float(3,2)
);
create table CUSTOMERS
(
Cnum int(4),
Cname varchar(10),
City varchar(10),
Rating int(4),
Snum int(4)
);
create table ORDERS
(
Onum int(4),
Amt float(7,2),
Odate date,
Cnum int(4),
Snum int(4)
);
insert into SALESPEOPLE values 
('1001','Peel','London','.12'),
('1002','Serees','San Jose','.13'),
('1004','Motika','London','.11'),
('1007','Rifkin','Barcelona','.15'),
('1003','Axelrod','New York','.10');
select *from SALESPEOPLE;

insert into CUSTOMERS values
('2001','Hoffman','London','100','1001'),
('2002','Giovanni','Rome ','200','1003'),
('2003','Liu','San Jose','200','1002'),
('2004','Grass','Berlin ','300','1002'),
('2006','Clemens','London ','100','1001'),
('2008','Cisneros','San Jose','300','1007'),
('2007','Pereira','Rome ','100','1004');
select * from CUSTOMERS;

insert into ORDERS values  
(3001,18.69,'1990-10-03',2008,1007),
(3003,767.19,'1990-10-03',2001,1001),
(3002,1900.10 ,'1990-10-03',2007,1004),
 (3005,5160.45 ,'1990-10-03',2003,1002),
 (3006,1098.16 ,'1990-10-03',2008,1007),
(3009,1713.23,'1990-10-04',2002,1003),
(3007,75.75,'1990-10-04',2004,1002),
 (3008,4723.00,'1990-10-05',2006,1001), 
(3010,1309.95,'1990-10-06',2004,1002),
(3011,9891.88,'1990-10-06',2006,1001);
select *from ORDERS;

-- 1) Write a query that uses a subquery to obtain all orders for the customer named Cisneros.Assume you do not know his customer number (cnum). 

select * from CUSTOMERS
where Cnum = (select cnum from CUSTOMERS WHERE Cname='Cisneros');

-- 2) Write a query that produces the names and ratings of all customers 
-- who have above-average orders. 
select Cname,Rating from ORDERS a, CUSTOMERS b
where a.Cnum=b.Cnum
group by a.Cnum
having count(a.Cnum)> (select avg(Cnos)from (select count(Cnum) as Cnos from ORDERS group by Cnum)as temp); 




















 
















