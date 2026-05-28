create database rajdb;
use rajdb;
create table raj45(id int);
insert into raj45 values(10);
select * from raj45;

-- tcl
start transaction;
insert into raj45 values(100), (99);
select * from raj45;
commit; -- durability


-- to  use start transaction or begin 
-- when the transaction end we use commit or rollback or ddl statement execution


start transaction;
update raj45 set id=500;
select * from raj45;
rollback;

start transaction;
insert into raj45 values(10), (11), (56), (68);
delete from raj45 where id=10;
                                      
start transaction;
insert into raj45 values(768), (500), (400);
select * from raj45;
savepoint raj45_savepoint_ins;
