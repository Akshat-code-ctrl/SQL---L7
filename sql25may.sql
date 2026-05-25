create database if not exists datatypedb;
use datatypedb;

-- numeric
-- tinyint
create table test1(id tinyint);
insert into test1 values(-1), (10);
insert into test1 values(128); -- out of range, will give an error (1 bytes = 8 bits)
select * from test1;

-- small int -> 2 byte medium int -> 3 byte
-- int -> 4
-- bigint -> 8
-- mediumint 

create table test2(age tinyint unsigned);
insert into test2 value(250);
select * from test2;


create table test3(salary float, salary2 double);
insert into test3 values(1983.93012, 1989.930193);
select * from test3;


create table test4(price double(6,2)); -- returns 2 decimal values, 4 values
insert into test4 values(0.7034234423); -- only 2 decimal values
insert into test4 values(44.09823);
insert into test4 values(4453.79823);
insert into test4 values(38923);
insert into test4 values(23433); -- 5 integer values
select * from test4;


create table test5(countrycode char(3));
insert into test5 values('IND');
insert into test5 values('INDIA'); -- will give an error
insert into test5 values('he       '); -- char ignores space
select *, char_length(countrycode) from test5;

create table test6(countrycode char(3));
insert into test6 values('IND');
insert into test6 values('INDIA'); -- will give an error
insert into test6 values('he       '); -- char ignores space
select *, char_length(countrycode) from test6;
