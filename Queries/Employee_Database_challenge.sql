--retirement_titles

SELECT employees.emp_no,
employees.first_name,
employees.last_name,
titles.title, 
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no ASC;
SELECT * FROM retirement_titles

--unique_titles

SELECT DISTINCT ON (retirement_titles.emp_no) retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title
INTO "unique_titles"
FROM retirement_titles
INNER JOIN employees ON (retirement_titles.emp_no = employees.emp_no)
WHERE (retirement_titles.to_date = '9999-01-01')
ORDER BY emp_no ASC;
SELECT * FROM unique_titles

--retiring_titles

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;
SELECT * FROM retiring_titles

--Deliverable 2
--mentorship_eligibilty

SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept_emp.from_date,
dept_emp.to_date,
titles.title
INTO mentorship_eligibilty
FROM dept_emp
INNER JOIN employees 
ON (dept_emp.emp_no = employees.emp_no)
INNER JOIN titles 
ON (employees.emp_no = titles.emp_no)
WHERE (dept_emp.to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no
SELECT * FROM mentorship_eligibilty