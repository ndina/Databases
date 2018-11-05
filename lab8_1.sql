CREATE INDEX name_index ON countries (name);

CREATE INDEX surname_index ON countries (name, surname);

CREATE UNIQUE INDEX salary_index ON employees (salary);

CREATE INDEX substr_index ON employees (substring(name from 1 to 4));

CREATE INDEX depart_index ON employees (department_id, salary);

CREATE INDEX budget_index ON departments (department_id, budget);