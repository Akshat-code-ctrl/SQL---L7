-- Windows 

create database windowsdb;
use windowsdb;


-- ============================================
--  Create the employees table
-- ============================================
CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);
 
-- ============================================
--  Insert sample data (12 employees)
-- ============================================
INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2020),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);



select *, sum(salary) over(partition by hire_year order by salary) from employees;
select *, max(salary) over(partition by dept order by hire_year) from employees;


use windowsdb;
select * from employees;

select *, row_number() over(order by salary), rank() over(order by salary), dense_rank() over(order by salary) from employees;

select *, dense_rank() over(partition by dept order by salary) from employees;

select *, dense_rank() over(partition by dept order by hire_year) from employees;

-- correlated
select * from employees as e
where salary=(select max(salary) from employees where dept = e.dept);

-- max
select *, max(salary) over(partition by dept) as deptSalary from employees;

-- correlated 
select * from
(select *, max(salary) over(partition by dept) as deptSalary from employees) as trh
where salary = deptSalary;

select * from
(select *, rank() over(partition by dept order by salary desc) as rnk from employees) as temp
where rnk = 1;

select * from
(select *, dense_rank() over(order by salary desc) as drank from employees) as xyz
where drank = 2;

-- second highest
select max(salary) from employees where salary < (select max(salary) from employees);

-- find out the fourth lowest salary, find out person's name
select * from
(select *, dense_rank() over(order by salary) as rnk from employees ) as temp
where rnk = 4;

-- Home work -> Rows between
-- Unbounded preceding
-- n preceding
-- etc