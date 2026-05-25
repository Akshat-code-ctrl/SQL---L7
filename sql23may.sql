create database cons_db;
use cons_db;
select database();

-- DDL (data definition language) create
create table test1 ( id int, age int);
-- DML (data manipulation language) insert
insert into test1 values(101, 32), (102, null);
select * from test1;

-- constraint are the rules which are applied to the table column to prevent invalid data in the table

create table if not exists test2(id int, age int not null);
insert into test2 values(101, 32);
select * from test2;
insert into test2 values(102, null); -- in valid data entry


create table if not exists test3(id int unique, age int not null);
insert into test3 values(101, 32);
select * from test3;
insert into test3 values(101, 32); -- duplicate entry, nahi daal sakte
insert into test3 values(null, 40);
-- ek unique constraint me multiple value aa sakti hai

create table if not exists test5(id int default 100, age int);
insert into test5(age) values(20);
select * from test5;


create table if not exists test6(id int primary key, age int); -- primary key can not be null and it should always be unique
insert into test6 values(80,23);
insert into test6 values(null,27); -- can not be null
select * from test6;

create table if not exists test7(id int, age int, salary int);
insert into test7 values(1, 50, 5000000), (2, 40, 20000), (1, 51, 6000000), (3,50,100);
select * from test7;


create table if not exists test8(id int, age int, salary int, primary key (id, age));
insert into test8 values(1,50,5000000), (2,40,2000), (1,51,6000000), (3,50,100);
select * from test8;
desc test8;

-- check constraint
create table if not exists test9(id int, age int check (age>18));
insert into test9 values(1,20);
insert into test9 values(1,10);
select * from test9;
-- check me koi function bhi lag sakta hai aur kuch bhi lag sakta hai, in between


create table student(id int, name varchar(20), cname varchar(20));
insert into student values(1, 'naina', '10'), (2, 'abhi', 12);


-- parent table
create table s_class( cname varchar(20) primary key); -- 7a,8b,8c
insert into s_class values(10), (8), (9);
select * from s_class;

-- child table
create table student(id int, name varchar(20), cname varchar(20), foreign key (cname) references s_class(cname));
insert into student values(1, 'naina', '10');
insert into student values(2, 'abhi', '12'); -- will give an error
select * from student; 

-- drop database rjdb;

