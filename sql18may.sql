use shadidb;

select * from employees;
select max(salary) from employees;
select *, sum(salary) over() from employees;
select *, sum(salary) over(), sum(salary) over(order by salary) from employees;

-- partition by
select *, sum(salary) over(partition by department), sum(salary) over() from employees;

select *, sum(salary) over(partition by name), sum(salary) over() from employees;

select *, sum(salary) over(partition by manager_id), sum(salary) over() from employees;

select *, sum(salary) over(partition by department order by salary) from employees;

select name, department, salary, sum(salary) over(partition by department),
(salary / sum(salary) over(partition by department))*100 from employees;





