--1

CREATE DATABASE lab5;
--2
CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  cust_name   VARCHAR,
  city        VARCHAR,
  grade       INTEGER,
  salesman_id INTEGER REFERENCES salesmen(salesman_id)
);
CREATE TABLE orders (
  ord_no      INTEGER PRIMARY KEY,
  purch_amt   DOUBLE PRECISION,
  ord_date    date,
  customer_id INTEGER REFERENCES customers(customer_id),
  salesman_id INTEGER REFERENCES salesmen(salesman_id)

);
CREATE TABLE salesmen(
  salesman_id INTEGER PRIMARY KEY,
  name VARCHAR,
  city VARCHAR,
  commission DOUBLE PRECISION
);
--3
SELECT sum(purch_amt) from orders;
--4
SELECT avg(purch_amt) from orders;
--5
SELECT count(*) from customers WHERE cust_name IS NOT NULL;
--6
SELECT min(purch_amt) from orders;
--7
SELECT * FROM customers WHERE substring(cust_name from 0 for position(' ' in cust_name)) LIKE '%b';
--8
SELECT * FROM orders WHERE customer_id IN(SELECT customer_id FROM customers WHERE city='New York');
--9
SELECT * FROM customers WHERE customer_id IN(SELECT customer_id from orders WHERE purch_amt>10);
--10
SELECT sum(grade) from customers;
--11
SELECT * FROM customers WHERE cust_name IS NOT NULL;
--12
SELECT max(grade) from customers;

----
INSERT INTO customers VALUES
                             (3002,'Nick Rimando','New York',100,5001),
                             (3005,'Graham Zusi','California',200,5002),
                             (3001,'Brad Guzan','London',NULL,5005),
                             (3004,'Fabian Johns','Paris',300,5006),
                             (3007,'Brad Davis','New York',200,5001),
                             (3009,'Geoff Camero','Berlin',100,5003),
                             (3008,'Julian Green','London',300,5002);
INSERT INTO orders VALUES
                             (70005,150.5,'2012-10-05',3007,5002),
                             (70006,270.65,'2012-09-10',3007,5005);
SELECT * from customers;
SELECT * from orders;
