//Displays annual salary of employees.
select firstname, salary*12 as "yearly salary" from employees;

//This command uses concatination operator to display employees salary in a sentenced fomat.
select lastname ||' '||'gets'||' '||salary||' '||'as salary' as "salary details" from employees;

//Displays the rows from employees table for all the employees whose salary is greater than 100000.
select * from employees where salary>=100000;

//Displays all the details of the employees whose lastname contains the substring '%Dho%'.
select * from employees where lastname like '%Dho%';

//Displays substring 'Dra' from the string 'RahulDravid'.
select substr('RahulDravid', 6,3) from dual;

//Displays the modulus of the number 120 by dividing it by 2.
select mod(120,2) from dual;

//Displays the distinct salaries from employees.
select distinct salary from employees;

//Displays lastname, salary from employees whose salary is in between 100000 and 150000.
select lastname, salary from employees where salary between 100000 and 150000;

//Displays the firstname, salary for all employees who are getting 80000, 100000, 150000 as the salary.
select firstname, salary from employees where salary in(80000, 100000,150000);

//Displays firstname, lastname of the employees whose lastname contains the substring 'Ten%'.
select firstname, lastname from employees where lastname like 'Ten%';

//Displays the age and the sum of the salary for all the employees by grouping the age.
select age, sum(salary) from employees group by age;

//Displays the age, the maximum of salary for all the employees where maximum salary is greater than 100000.
select age, max(salary) from employees having max (salary)>100000 group by age;

//Displays all the lastname of employees in ascending order.
select lastname from employees order by lastname asc;

//Displays all the lastname of employees in descending order.
select lastname from employees order by lastname asc;

//Displays the firstname, lastname, salary of all the employees whose salary is greater than 80000 and their firstname doesn't start with 's'.
select firstname, lastname, salary from employees where salary>80000 AND firstname not like 'S%';

//Displays all the lastnames of the employees in uppercase where lastname is 'Tendulkar'.
select upper(lastname) from employees where lastname='Tendulkar';

//Concatinates data of firstname and lastname of all the employees.
select concat(firstname, lastname) as "full name" from employees;

//Displays the length of all the firstnames.
select length(firstname) from employees;

//Displays the length of the string 'Sachin'.
select length('Sachin') from dual;

//Displays the substring 'dul' from the lastname where lastname is 'Tendulkar' (using both substring and instring).
select substr(lastname, instr(lastname, 'd'),3) from employees where lastname='Tendulkar';

//Trims the trailing 'm' in the string 'madam'.
select trim(trailing 'm' from 'madam') from dual;

//Trims the leading 'm' in the string 'madam'.
select trim(leading 'm' from 'mmmadam) from dual;

//Trims the both 'm' in the string 'madam'.
select trim(both 'm' from 'madam') from dual;

//Displays the number of months between the dates 18-jan-2017 and 14-feb-2014.
select months_between('18-jan-2017', '18-jan-2016') from dual;

//Adds 12 months for the date 18-jan-2016 and displays.
select add_months('18-jan-2016', 12) from dual;

//Query to display the dept_id and the sum of the salary for all the employees in each department.
select dept_id, sum(salary) from employees group by dept_id;

//Query to display the dept_id and the least salary of each department.
select dept_id, min(salary) from employees group by dept_id;

//Displaying the dept_id and heighest salary of each department for all departments whose dept_id is>30.
select dept_id, max(salary) from employees where dept_id>20 group by dept_id;

//Query to display the dept_id , the maximum salary for all the employees where maximum salary is greater than 100000.
select dept_id, max(salary) from employees having max(salary)>100000 group by dept_id;

//Query to display dept_id and maximum salary of all employees whose dept_id is greater than 10 and having maximum salary greater than 120000 for each department, while displaying display the date in descending order with respect to dept_id.
select dept_id, max(salary) from employees where dept_id>10 having max(salary)>120000 group by dept_id order by dept_id desc;

//Query to display the lastname, firstname and salary of all employees who earns more than tendulkar.
select lastname, firstname from employees where salary>(select salary from employee where lastname='Tendulkar');

//Query to display the employee id of all employees whose dept_id in employees table is equal to dept_id in departments table.
select id from employees where dept_id in (select dept_id from departments);

//Query to display the employees id and the department name for all the employees whose dept_id in the employees table is equal to the department id in the department table.
select id, dept_id from employese, departments where employee.dept_id=department.dept_id;
select id, dept_id from employees e, departments d where employee.dept_id=department.dept_id;

//Query to display the employees id and the department name for all the employees whose dept_id in the employees table is equal to the department id in the department table using 'inner join' keyword.
select id, dept_id from employees inner join departments on employee.dept_id=department.dept_id;

//Query to display all the details from employee table and department table by using natural join keyword.
select * from employees natural join departments;

//Query to display employees table cross join with departments table.
select * from employees cross join departments;

//Employees table left outer join with Department table
select * from employees left outer join departments on employee.dept_id=department.dept_id;

//Employees table right outer join with Department table
select * from employees right outer join departments on employee.dept_id=department.dept_id;

//Employees table full outer join with Department table
select * from employees full outer join departments on employee.dept_id=department.dept_id;

//Query to display all the rows from employees and departments table.
select * from employees, departments;

//Query to delete the rows form employees table where employees dept_id is 30 and lastname of the employee is 'Kohli'.
delete from employees where dept_id=30 and lastname='Kohli';

//Query to set department name to 'EXECUTIVE' where dept_id=10;
update departments set department_name='EXECUTIVE' where dept_id=10;

