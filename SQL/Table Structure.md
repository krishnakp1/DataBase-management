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


--DML FOR EMPLOYEES
INSERT INTO EMPLOYEE (ID , FIRSTNAME ,LASTNAME , AGE, PHONENO ,SALARY , ADDRESS) 
VALUES (001, 'Sachin', 'Tendulkar', 40, 11111, 100000, 'Mumbai');

INSERT INTO EMPLOYEE (ID , FIRSTNAME ,LASTNAME , AGE, PHONENO ,SALARY , ADDRESS) 
VALUES (002, 'Rahul', 'Dravid', 40, 22222, 80000, 'Bangalore');

INSERT INTO EMPLOYEE (ID , FIRSTNAME ,LASTNAME , AGE, PHONENO ,SALARY , ADDRESS) 
VALUES (003, 'MS', 'Dhoni', 35, 33333, 150000, 'Ranchi');

INSERT INTO EMPLOYEE (ID , FIRSTNAME ,LASTNAME , AGE, PHONENO ,SALARY , ADDRESS) 
VALUES (004, 'Yuvraj', 'Singh', 34, 44444, 120000, 'Punjab');

INSERT INTO EMPLOYEE (ID , FIRSTNAME ,LASTNAME , AGE, PHONENO ,SALARY , ADDRESS) 
VALUES (005, 'Virat', 'Kohli', 28, 55555, 200000, 'Delhi');
