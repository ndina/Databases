CREATE DATABASE   db1;

CREATE TABLE userss(
  id SERIAL PRIMARY KEY ,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL
);

ALTER TABLE userss
  ADD COLUMN isadmin INT;

SELECT * FROM userss;

ALTER TABLE userss ALTER COLUMN isadmin TYPE BOOLEAN using isadmin:: BOOLEAN;

ALTER TABLE userss
    ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE userss ADD CONSTRAINT userss_pkey PRIMARY KEY(id);

CREATE TABLE tasks(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  user_id INT
);
SELECT * FROM tasks;
DROP TABLE tasks;
DROP DATABASE db1;


