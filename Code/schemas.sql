--Creating tables for PH-EmployeeDB
CREATE TABLE departments(
dept_no VARCHAR(4) NOT NULL,
dept_name VARCHAR (40) NOT NULL,
PRIMARY KEY (dept_no),
UNIQUE (dept_name)
);

CREATE TABLE employees (
emp_no int NOT NULL,
birth_date Date NOT NULL,
first_name VARCHAR not null,
last_name VARCHAR not null,
gender varchar not null,
hire_date date not null,
PRIMARY KEY (emp_no)
);

Create table dept_manager (
dept_no varchar(4) NOT NULL,
	emp_no int not null,
	from_date date not null,
	to_date date not null,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) references departments (dept_no),
	Primary key (emp_no, dept_no)
);


CREATE TABLE salaries (
emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
	FOREIGN KEY (emp_no) references employees (emp_no),
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
dept_no varchar not null,
emp_no int not null,
from_date date not null,
to_date date not null,
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
foreign key (emp_no) references employees (emp_no),
	primary key (dept_no, emp_no)
);

CREATE TABLE titles (
emp_no int not null,
title varchar not null,
from_date date not null,
to_date date not null,
FOREIGN KEY (emp_no) references employees (emp_no),
	primary key (emp_no)
	);