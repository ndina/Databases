CREATE database lab9;
CREATE FUNCTION sum_of_two_numbers(m integer, n integer)
RETURNS integer AS $$
        BEGIN
                RETURN m + n;
        END;
$$ LANGUAGE plpgsql;
SElECT sum_of_two_numbers(5,6) AS "MySUM";

CREATE FUNCTION TODAY_IS () RETURNS CHAR(22) AS  '
BEGIN
  RETURN ''Today''''is '' || CAST(CURRENT_DATE AS CHAR(10));
END;
'
LANGUAGE PLPGSQL;
SELECT today_is();

CREATE FUNCTION FUN_TO_TEST(dt DATE, ing INTEGER)
RETURNS DATE AS $test$
DECLARE ss     ALIAS FOR $1;
        ff     ALIAS FOR $2;
BEGIN
   RETURN ss + ff * INTERVAL '2 DAY';
END;
$test$
LANGUAGE PLPGSQL;
SELECT FUN_TO_TEST(CURRENT_DATE, 5);

CREATE OR REPLACE FUNCTION ifstat()
RETURNS text AS $$
DECLARE
ss integer;
BEGIN
ss:= 0;
IF ss = 0 THEN
RETURN 'You have declared zero';
END IF;
END;
$$
  LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION ifstat2 (date)
RETURNS text AS $$
BEGIN
   IF EXTRACT(DAY FROM current_date) = 1
   THEN
      RETURN '1st day of the Month';
   ELSE
      RETURN 'Other day';
   END IF;
END;
$$
LANGUAGE plpgsql;



CREATE FUNCTION ret_date (crdate date) RETURNS text AS $$
BEGIN
   IF EXTRACT (MONTH FROM crdate)= 1
   THEN RETURN 'January';
   ELSIF EXTRACT (MONTH FROM crdate)= 2
   THEN RETURN 'February';
   ELSIF EXTRACT (MONTH FROM crdate)= 3
   THEN RETURN 'March';
   ELSIF EXTRACT (MONTH FROM crdate)= 4
   THEN RETURN 'April';
   ELSIF EXTRACT (MONTH FROM crdate)= 5
   THEN RETURN 'May';
   ELSIF EXTRACT (MONTH FROM crdate)= 6
   THEN RETURN 'June';
   ELSIF EXTRACT (MONTH FROM crdate)= 7
   THEN RETURN 'July';
   ELSIF EXTRACT (MONTH FROM crdate)= 8
   THEN RETURN 'August';
   ELSIF EXTRACT (MONTH FROM crdate)= 9
   THEN RETURN 'September';
   ELSIF EXTRACT (MONTH FROM crdate)= 10
   THEN RETURN 'October';
   ELSIF EXTRACT (MONTH FROM crdate)= 11
   THEN RETURN 'November';
   ELSIF EXTRACT (MONTH FROM crdate)= 12
   THEN RETURN 'December';
   END IF;
END;
$$
LANGUAGE 'plpgsql';



CREATE OR REPLACE FUNCTION myfunc1 (x integer) RETURNS text AS $$
DECLARE
msg text;
BEGIN
CASE
    WHEN x IN(2,4,6,8,10) THEN
        msg := 'value even number';
    WHEN x IN(3,5,7,9,11) THEN
        msg := 'value is odd number';
END CASE;
RETURN msg;
END;
$$
LANGUAGE 'plpgsql';



CREATE OR REPLACE FUNCTION myfunction(integer)
RETURNS integer AS '
  DECLARE
    nm ALIAS FOR $1;
    cub integer;
  BEGIN
    cub := nm;
    LOOP
      cub := cub * cub * cub;
      EXIT WHEN cub >= 10000;
    END LOOP;
    RETURN cub;
  END;
' LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION myfunction(integer)
RETURNS integer AS '
  DECLARE
   nm ALIAS FOR $1;
    cub INTEGER;
  BEGIN
   cub:=nm;
    WHILE cub <=10000 LOOP
      cub := cub * cub * cub;
    END LOOP;
    RETURN cub;
  END;
' LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION myfunction(integer)
RETURNS integer AS '
  DECLARE
   nm ALIAS FOR $1;
    cub INTEGER;
  BEGIN
   cub :=nm;
   FOR i IN 0..10000 LOOP
      cub := cub * cub * cub;
    END LOOP;
    RETURN cub;
  END;
' LANGUAGE 'plpgsql';



CREATE OR REPLACE FUNCTION myfunction(dt DATE)
RETURNS INTEGER
AS
$$
DECLARE ddt DATE;
        num  INTEGER;
        x  INTEGER;
BEGIN
   ddT := dt;
   x := EXTRACT(MONTH FROM dt);
   FOR i IN 1 .. 31
   LOOP
      num := i;
      EXIT WHEN EXTRACT(MONTH FROM ddt + i * INTERVAL '1 DAY') <> x;
   END LOOP;
   RETURN num-1;
END;
$$
LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION myfunction(integer) RETURNS text AS '
  DECLARE
      depid ALIAS FOR $1;
    output_txt TEXT :=''\n'';
    row_data employees%ROWTYPE;
  BEGIN
    FOR row_data IN SELECT * FROM employees
    WHERE department_id = depid  ORDER BY first_name LOOP
      output_txt := output_txt || row_data.first_name || row_data.last_name || ''\n'';
    END LOOP;
    RETURN output_txt;
  END;
' LANGUAGE 'plpgsql';