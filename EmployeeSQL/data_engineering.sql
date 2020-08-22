CREATE TABLE titles(
	title_id VARCHAR(50) NOT NULL CONSTRAINT title_pk PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	CONSTRAINT title_pk UNIQUE (title_id)
);

CREATE TABLE employees(
	emp_no INT CONSTRAINT emp_pk PRIMARY KEY,
	emp_title_id VARCHAR(50) NOT NULL,
	birth_date DATE  NOT NULL,
	first_name VARCHAR(50)  NOT NULL,
	last_name VARCHAR(50)  NOT NULL,
	sex VARCHAR(1)  NOT NULL,
	hire_date DATE  NOT NULL,
	CONSTRAINT emp_pk UNIQUE (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries(
	emp_no INT  NOT NULL CONSTRAINT salaries_pk PRIMARY KEY,
	salary INT NOT NULL,
	CONSTRAINT salaries_pk UNIQUE (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE departments(
	dept_no  VARCHAR(50) NOT NULL CONSTRAINT dept_pk PRIMARY KEY,
	dept_name VARCHAR(50) NOT NULL,
	CONSTRAINT dept_pk UNIQUE (dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(50) NOT NULL,
	emp_no INT  NOT NULL,
	PRIMARY KEY(dept_no,emp_no),
	CONSTRAINT deptno_fk FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	CONSTRAINT empno_fk FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp(
	emp_no INT  NOT NULL,
	dept_no VARCHAR(50) NOT NULL,
	PRIMARY KEY(dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

