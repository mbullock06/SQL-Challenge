-- Employee Database Schema

CREATE TABLE titles (
    title_id VARCHAR NOT NULL, -- Title ID (Primary Key)
    title VARCHAR NOT NULL,    -- Title name
    PRIMARY KEY (title_id)
);

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL, -- Department number (Primary Key)
    dept_name VARCHAR NOT NULL, -- Department name
    PRIMARY KEY (dept_no)
);

CREATE TABLE employees (
    emp_no INT NOT NULL, -- Employee number (Primary Key)
    emp_title_id VARCHAR NOT NULL, -- Foreign Key to titles
    birth_date DATE NOT NULL, -- Date of birth
    first_name VARCHAR NOT NULL, -- First name
    last_name VARCHAR NOT NULL, -- Last name
    sex CHAR(1) NOT NULL, -- Sex ('M', 'F')
    hire_date DATE NOT NULL, -- Hire date
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
    emp_no INT NOT NULL, -- Employee number (Primary Key, Foreign Key)
    salary INT NOT NULL, -- Salary amount
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL, -- Employee number (Foreign Key)
    dept_no VARCHAR NOT NULL, -- Department number (Foreign Key)
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL, -- Department number (Foreign Key)
    emp_no INT NOT NULL, -- Employee number (Foreign Key)
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);