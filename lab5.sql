CREATE DATABASE laaab5
 CREATE TABLE "Warehouses"(
   Code INTEGER,
   Location VARCHAR(255),
   Capacity INTEGER
 );
CREATE TABLE "Boxes" (
  Code     CHAR(4),
  Contents VARCHAR(255),
  Value REAL,
  Warehouse INTEGER
);
DROP TABLE "Boxes","Warehouses";
SELECT * from "Warehouses";
SELECT * from "Boxes";
INSERT INTO "Warehouses"(code,location,capacity) VALUES(1,'Chicago',3),
                                                       (2,'Chicago',4),
                                                       (3,'New York',7),
                                                       (4,'Los Angeles',2),
                                                       (5,'San Francisco',8);

 INSERT INTO "Boxes"(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3),
 ('4H8P','Rocks',250,1),('4RT3','Scissors',190,4),('7G3H','Rocks',200,1),
                                                          ('8JN6','Papers',75,1),
                                                          ('8Y6U','Papers',50,3),
                                                          ('9J6F','Papers',175,2),
                                                          ('LL08','Rocks',140,4),
                                                          ('P0H6','Scissors',125,1),
                                                          ('P2T6','Scissors',150,2),
                                                          ('TU55','Papers',90,5);

SELECT * FROM "Warehouses";
SELECT * FROM "Boxes" where value BETWEEN 50 AND 100;
SELECT DISTINCT ON(Warehouse) * FROM "Boxes";
SELECT Contents,count(*) FROM "Boxes" GROUP by Contents;
SELECT Warehouse,count(*) AS paper_num from "Boxes" WHERE Contents='Papers' GROUP BY Warehouse;
INSERT INTO "Warehouses" VALUES(6,'New York',3);
INSERT INTO "Boxes" VALUES('H5RT','Papers',200,2);
UPDATE "Boxes" SET Value=Value*0.8 WHERE Value=(SELECT Value from "Boxes" ORDER BY Value ASC LIMIT 1 OFFSET 2);
DELETE FROM "Boxes" WHERE value <150;
DELETE FROM "Boxes" WHERE Warehouse IN (SELECT Code from "Warehouses" WHERE Location='New York') returning code, Warehouse;