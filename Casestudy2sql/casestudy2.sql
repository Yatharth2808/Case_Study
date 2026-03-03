

create database casestudy2;
use casestudy2;

CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');


  CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);


INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);




CREATE TABLE JOB
(JOB_ID INT PRIMARY KEY,
DESIGNATION VARCHAR(20))

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')


CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)


-------------------------------Simple Queries-----------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

-- Q1. . List all the employee details.

Select * from employee;

-- Q2. List all the department details.

Select * from department;

-- Q3. List all job details.

Select * from job;

-- Q4. List all the locations.

Select * from LOCATION;

-- Q5. List out the First Name, Last Name, Salary, Commission for all Employees.

SELECT FIRST_NAME, LAST_NAME, SALARY, COMM 
from Employee;

-- Q6. List out the Employee ID, Last Name, Department ID for all employees and alias
-- Employee ID as "ID of the Employee", Last Name as "Name of the
-- Employee", Department ID as "Dep_id".

Select Employee_id as "ID of the Employee", Last_Name as "Name of the Employee", Department_Id as "Dep_id" from Employee;

-- Q7. List out the annual salary of the employees with their names only.

Select FIRST_NAME, Last_Name, salary from employee;

------------------------------- Where Condition -----------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

-- Q1. List the details about "Smith".

Select * from employee
WHERE Last_Name = 'Smith' ; 

-- Q2. List out the employees who are working in department 20

SELECT * from employee WHERE Department_Id = 20;

-- Q3. List out the employees who are earning salary between 2000 and 3000.

SELECT * from employee WHERE Salary >= 2000 and Salary <= 3000 ;

-- Q4. List out the employees who are working in department 10 or 20.

SELECT * from employee WHERE Department_Id in (10,20);

-- Q5. Find out the employees who are not working in department 10 or 30

SELECT * from employee WHERE Department_Id in (10,30);

-- Q6. List out the employees whose name starts with 'L

Select * from employee
where FIRST_NAME like 'L%';

-- Q7. list out the employees whose name starts with 'L' and ends with 'E

Select * from employee
where FIRST_NAME like 'L%E';

-- Q8. List out the employees whose name length is 4 and start with 'J'.

Select * from employee
where FIRST_NAME like 'J%' and len(FIRST_NAME) = 4 ;

-- Q9. List out the employees who are working in department 30 and draw the salaries more than 2500

SELECT * from employee WHERE Department_Id in (30) and salary >= 2500;

-- Q10. List out the employees who are not receiving commission.

Select * from employee where comm is NULL;

------------------------------- Order BY ------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

-- Q1. List out the Employee ID and Last Name in ascending order based on the
-- Employee ID.

Select Employee_id, LAST_NAME
from EMPLOYEE
order by EMPLOYEE_ID; 

-- Q2. List out the Employee ID and Name in descending order based on salary.

Select Employee_id, LAST_NAME
from EMPLOYEE
order by SALARY desc; 

-- Q3. List out the employee details according to their Last Name in ascending-order.

Select * from EMPLOYEE order by LAST_NAME;

-- Q4. List out the employee details according to their Last Name in ascending
-- order and then Department ID in descending order.

Select * from EMPLOYEE order by LAST_NAME, DEPARTMENT_ID desc;

------------------------------- GROUP BY AND HAVING CLAUSE ----------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

-- Q1. List out the department wise maximum salary, minimum salary and
-- average salary of the employees.

Select max(salary) as MaxSalary, min(salary) as MinSalary, AVG(salary) as AvgSalary from employee 
group by Department_Id;

-- Q2. List out the job wise maximum salary, minimum salary and average
-- salary of the employees.

Select max(salary) as MaxSalary, min(salary) as MinSalary, AVG(salary) as AvgSalary from employee 
group by JOB_ID;

-- Q3. List out the number of employees who joined each month in ascending order.

Select MONTH(HIRE_DATE) as month, Year(HIRE_DATE) as YEAR ,count(*) as joined_each_month from employee 
group by Year(HIRE_DATE), MONTH(HIRE_DATE)
order by Year(HIRE_DATE), MONTH(HIRE_DATE);

-- Q4. List out the number of employees for each month and year in
-- ascending order based on the year and month.

Select MONTH(HIRE_DATE) as month, Year(HIRE_DATE) as YEAR ,count(*) as joined_each_month from employee 
group by Year(HIRE_DATE), MONTH(HIRE_DATE)
order by Year(HIRE_DATE), MONTH(HIRE_DATE);

-- Q5. List out the Department ID having at least four employees.

Select Department_Id from employee
group by Department_Id having count(*) >= 4;

-- Q6. How many employees joined in February month.

Select Count(*) as joined_in_feb from employee
where Month(HIRE_DATE) = 2;

-- Q7. How many employees joined in May or June month.

Select Count(*) as joined_in_june from employee
where Month(HIRE_DATE) = 6;

-- Q8. How many employees joined in 1985?

Select Count(*) as joined_in_1985 from employee
where YEAR(HIRE_DATE) = 1985;

-- Q9. How many employees joined each month in 1985?

Select Month(HIRE_DATE) as month, Count(*) as joined_every_month from employee
group by Month(HIRE_DATE),  Year(HIRE_DATE)
HAVING Year(HIRE_DATE) = 1985;

-- Q10. How many employees were joined in April 1985?

Select Count(*) as joined_in_april from employee
where Month(HIRE_DATE) = 4 and Year(HIRE_DATE) = 1985;

-- Q11. Which is the Department ID having greater than or equal to 3 employees
-- joining in April 1985?

Select department_id from employee
group by department_id, Month(HIRE_DATE), Year(HIRE_DATE)
having Month(HIRE_DATE) = 4 and Year(HIRE_DATE) = 1985 and COUNT(*) >= 3;

------------------------------- Joins ---------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

-- Q1. List out employees with their department names.

Select EMPLOYEE_ID, FIRST_NAME, Last_Name, d.Name 
from EMPLOYEE e join DEPARTMENT d on e.DEPARTMENT_ID = d.Department_Id;

-- Q2. Display employees with their designations.

Select EMPLOYEE_ID, First_name, Last_Name, j.DESIGNATION 
from EMPLOYEE e join JOB j on e.JOB_ID = j.JOB_ID;

-- Q3. Display the employees with their department names and city.

Select EMPLOYEE_ID, First_name, Last_Name, d.Name as department_name, l.city
from EMPLOYEE e join DEPARTMENT d on e.DEPARTMENT_ID = d.Department_Id 
join LOCATION l on d.Location_Id = l.Location_ID;

-- Q4. How many employees are working in different departments? Display with
-- department names.

Select d.Name, Count(*) as total_employees
from DEPARTMENT d left join employee e on d.Department_Id = e.DEPARTMENT_ID
GROUP by e.DEPARTMENT_ID, d.Name;

-- Q5. How many employees are working in the sales department?

Select d.Name, Count(*) as total_employees
from DEPARTMENT d left join employee e on d.Department_Id = e.DEPARTMENT_ID
GROUP by e.DEPARTMENT_ID, d.Name
having d.Name = 'Sales';

-- Q6. Which is the department having greater than or equal to 3
-- employees and display the department names in
-- ascending order.

Select d.Name, Count(*) as total_employees
from DEPARTMENT d left join employee e on d.Department_Id = e.DEPARTMENT_ID
GROUP by e.DEPARTMENT_ID, d.Name
having Count(*) >= 3;

-- Q7. How many employees are working in 'Dallas'?

Select l.city, Count(*) as total_employees
from EMPLOYEE e join DEPARTMENT d on e.DEPARTMENT_ID = d.Department_Id 
join LOCATION l on d.Location_Id = l.Location_ID
group by l.City having l.city = 'Dallas';

-- Q8. Display all employees in sales or operation departments.

Select e.DEPARTMENT_ID, d.Name, EMPLOYEE_ID ,LAST_NAME, FIRST_NAME
from DEPARTMENT d join employee e on d.Department_Id = e.DEPARTMENT_ID
WHERE d.Name in ('Sales', 'operations');


------------------------------- CONDITIONAL STATEMENT -----------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

-- Q1. Display the employee details with salary grades. Use conditional statement to
-- create a grade column.

Select *, (
  Case when salary > 2000 then 'Grade A'
  when salary >= 1000 and salary < 2000 then 'Grade B'
  else 'Grade C' END
) as 'Grade' from employee

-- Q2. List out the number of employees grade wise. Use conditional statement to
-- create a grade column.

Select Grade, Count(*) as total_employees FROM 
(
  select (Case when salary > 2000 then 'Grade A'
  when salary >= 1000 and salary < 2000 then 'Grade B'
  else 'Grade C' END)
  as 'Grade' from employee
) x
group by Grade;

-- Q3. Display the employee salary grades and the number of employees between
-- 2000 to 5000 range of salary.

Select Grade, Count(*) as total_employees FROM 
(
  select (Case when salary > 2000 then 'Grade A'
  when salary >= 1000 and salary < 2000 then 'Grade B'
  else 'Grade C' END)
  as 'Grade' from employee
) x
group by Grade
having grade = 'Grade A';


------------------------------- Subqueries ----------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

-- Q1. Display the employees list who got the maximum salary.

Select * from EMPLOYEE
where salary in (Select max(SALARY) from EMPLOYEE);

-- Q2. Display the employees who are working in the sales department.

Select * from EMPLOYEE
where DEPARTMENT_ID in (Select DEPARTMENT_ID from DEPARTMENT where name = 'Sales');

-- Q3. Display the employees who are working as 'Clerk'.

Select * from EMPLOYEE
where JOB_ID in (Select JOB_ID from JOB where DESIGNATION = 'Clerk');

-- Q4. Display the list of employees who are living in 'Boston'.

Select * from EMPLOYEE
where DEPARTMENT_ID in 
(Select DEPARTMENT_ID from DEPARTMENT d join LOCATION l on d.Location_Id = l.Location_ID 
where city = 'Boston');

-- Q5. Find out the number of employees working in the sales department.

Select Count(*) from EMPLOYEE
where DEPARTMENT_ID in 
(Select DEPARTMENT_ID from DEPARTMENT where Name = 'Sales');

-- Q6. Update the salaries of employees who are working as clerks on the basis of
-- 10%.

BEGIN TRANSACTION;

update Employee
set Salary = Salary * 1.1
where JOB_ID in (Select JOB_ID from JOB where DESIGNATION = 'Clerk')

Select * from EMPLOYEE;

-- Rollback if needed to revert the transaction
ROLLBACK TRANSACTION;

-- Q7. Display the second highest salary drawing employee details.

Select * from 
(
  Select *, DENSE_RANK() over (order by salary desc) as dr from EMPLOYEE
) x 
where dr = 2;

-- Q8. List out the employees who earn more than every employee in department 30.

Select * from EMPLOYEE
where salary > (Select max(SALARY) from employee where EMPLOYEE_ID = 30 )

-- Q9. Find out which department has no employees.

Select Name from DEPARTMENT
where Department_Id not in (Select distinct Department_Id from EMPLOYEE );

-- Q10. Find out the employees who earn greater than the average salary for
-- their department.

Select EMPLOYEE_ID, LAST_NAME, FIRST_NAME, e.DEPARTMENT_ID from EMPLOYEE e join 
(
  Select Department_ID , avg(salary) as avgSalary
  from EMPLOYEE
  GROUP by DEPARTMENT_ID
) x 
on e.DEPARTMENT_ID = x.DEPARTMENT_ID
where e.salary > x.avgSalary;