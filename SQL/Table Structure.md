#EMPLOYEES TABLE
create table Employee
(
Id int unique not null,
FirstName varchar(30) not null,
LastName varchar(30),
Age int check(age>18),
PhoneNo int,
Salary int not null,
Address varchar(30)
);

##Database:
Id | FirstName | LastName | Age | PhoneNo | Salary | Address | Dept_Id
|:--:|:--------:|:--------:|:---:|:-------:|:------:|:-------:|:-----:|
1 | Sachin | Tendulkar | 40 | 11111 | 100000 | Mumbai | 10 |
2 | Rahul | Dravid | 40 | 22222 | 80000 | Bengaluru | 20 |
3 | MS | Dhoni | 35 | 33333 | 150000 | Ranchi | 20 |
4 | Yuvraj | Singh | 34 | 44444 | 120000 | Punjab | 30 |
5 | Virat | Kohli | 28 | 55555 | 200000 | Delhi | 30 |


#DEPARTMENTS TABLE
create table Department
(
Dept_Id int unique not null,
Department_Name varchar(30),
Manager_Id int,
Location_Id int
);

##Database:
Dept_Id | Department_Name | Manager_Id | Location_Id
|:------:|:---------------:|:----------:|:---------:|
10 | Executive | 100 | 1100 |
20 | Marketing | 200 | 2200 |
30 | IT | 300 | 3300 |
