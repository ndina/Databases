create database lab6;

create table locations (
  location_id serial primary key,
  street_add varchar(255),
  postal_code varchar(12),
  city varchar(30),
  state_province  varchar(12)
);

create table department(
  dep_id serial primary key ,
  dep_name varchar(50) unique ,
  budget integer,
  location_id integer references locations
);

create table employee(
  employee_id serial primary key ,
  first_name varchar(50),
  last_name varchar(50),
  email varchar(50),
  phone_num varchar(20),
  salary integer,
  manager_id integer references  employee,
  department_id integer references department
);

create table job_grades(
  grade char(1),
  lowest_salary integer,
  highest_salary integer
);

INSERT INTO locations VALUES (default,'A','A','A','A'),
                             (default,'B','B','B','B'),
                             (default,'C','C','C','C');
INSERT INTO department VALUES (default,'a',100,1),
                               (default,'b',100,2);
INSERT INTO department VALUES (40,'c',100,1);
INSERT INTO department VALUES (4,'ds',100,2);
INSERT INTO employee VALUES (DEFAULT,'Alex', 'Lee','mail','098',100,1),
                             (DEFAULT ,'Sam','O','gmail','87',123,2);
INSERT INTO employee VALUES (DEFAULT ,'Forty','num','dsf','asdf',32,40);
INSERT INTO employee VALUES (DEFAULT ,'Fifth','nu','dsf','asdf',32,40);
INSERT INTO employee VALUES (DEFAULT ,'Fifth','nu','dsf','asdf',32,NULL);

select * from locations;
select * from employee;
select *
from department;

select first_name,
       last_name,
       department.dep_id,
       department.dep_name
from employee inner join department on employee.department_id = department.dep_id;


select first_name,
       last_name,
       salary,
       grade
from employee  inner join job_grades on employee_id is not null ;

select employee.first_name,
       employee.last_name,
       employee.salary
from employee inner join employee e on e.employee_id = 120
where employee.salary > e.salary;

select employee.first_name
from employee
inner join employee e on e.employee_id = e.manager_id;

select first_name,
       last_name,
       department.dep_id
from employee left join department on employee.employee_id = department.dep_id;






