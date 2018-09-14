CREATE DATABASE lab2;

CREATE TABLE countries(
country_id SERIAL PRIMARY KEY,
country_name VARCHAR(50),
region_id INTEGER,
population INTEGER
);

SELECT * FROM countries;

INSERT INTO countries VALUES (DEFAULT, 'Kazakhstan', 1, 18000000);

SELECT * FROM countries;

INSERT INTO countries(country_id, country_name) VALUES(DEFAULT , 'Sweden');

INSERT INTO countries(region_id) VALUES (NULL );

INSERT INTO countries VALUES
                             (DEFAULT, 'Russia', 2, 1800),
                             (DEFAULT , 'China', 3, 1900),
                             (DEFAULT , 'Japan', 4, 2000);

ALTER TABLE countries
    ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries(country_name) VALUES (DEFAULT );

INSERT INTO countries VALUES (DEFAULT );

CREATE TABLE countries_new(
  LIKE countries
);

SELECT * FROM countries_new;

INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries_new SET region_id=1 WHERE region_id ISNULL ;

UPDATE countries_new SET population = population * 1.1
RETURNING  country_name, population AS "New Population";

DELETE FROM countries_new WHERE population < 100000;

DELETE FROM countries_new AS cn USING countries AS c
WHERE cn.country_id =c.country_id
RETURNING *;

DELETE FROM countries
RETURNING *;
