#EMPLOYEES TABLE
create table Employee
(
Id int unique not null,
Firstname varchar(30) not null,
Lastname varchar(30),
Age int check(age>18),
PhoneNo int,
Salary int not null,
Address varchar(30)
);

ID | FIRSTNAME | LASTNAME | AGE | PHONENO | SALARY | ADDRESS | Dept_id
----------------------------------------------------------------------
1 | Sachin | Tendulkar | 40 | 11111 | 100000 | Mumbai | 10
-----------------------------------------------------------
2 | Rahul | Dravid | 40 | 22222 | 80000 | Bengaluru | 20
---------------------------------------------------------
3 | MS | Dhoni | 35 | 33333 | 150000 | Ranchi | 20
---------------------------------------------------
4 | Yuvraj | Singh | 34 | 44444 | 120000 | Punjab | 30
-------------------------------------------------------
5 | Virat | Kohli | 28 | 55555 | 200000 | Delhi | 30
-----------------------------------------------------


#DEPARTMENTS TABLE
create table Department
(
dept_id int unique not null,
department_name varchar(30),
manager_id int,
location_id int
);

Dept_id | Department_name | Manager_id | Location_id
-----------------------------------------------------
10 | Executive | 100 | 1100
20 | Marketing | 200 | 2200
30 | IT | 300 | 3300
