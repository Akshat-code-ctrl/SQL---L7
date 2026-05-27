-- ddl statement
create table test10(id int, name varchar(20));
insert into test10 values(1, 'abhi'), (2, 'shimi'), (3, 'yash');
select * from test10;

-- ddl drop statement (drop will delete both structure and table)
drop table test10;

-- truncate (ddl statement)
truncate test10;       -- data will deleted but not the table structure
select * from test10;

alter table test10 add column (salary int);         -- to add column
alter table test10 add column (age int default 18);
alter table test10 drop column salary;               -- to delete column
alter table test10 rename column age to newage;      -- rename
alter table test10 add constraint primary key(id);
desc test10;

-- add a column before a name column
-- change the datatype of name column to integer
-- add a not null constraint to the name and age column
-- add a foreign key of a column name with the dept id and make it as a foreign key which 


select database();

-- CTAS (create table as select)
create table tushar985 as 
select actor_id, first_name from sakila.actor;

select * from tushar985;

select * from tushar985;
insert into tushar985 values(19999, 'Japan'); -- DML
SET SQL_SAFE_UPDATES = 0;
update tushar985 set first_name = 'Sam' where actor_id=2;
update tushar985 set first_name = 'Sam';
delete from tushar985;


-- What is dml and ddl 
-- difference between truncate, delete and drop
-- what is normalization
-- difference between char and var char datatype.0oij12