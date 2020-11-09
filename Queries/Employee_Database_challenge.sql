--Deliverable 1: The Number of Retiring Employees by Title

SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirment_titles
FROM employees as e INNER JOIN
title as t on (e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')

--Retirement Titles Table 
SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Unique Titles of Retiring Employees Table
SELECT * FROM unique_titles

SELECT Count(title) as cnt, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY cnt DESC;

--Table of total number of counts of retired employees based on title
SELECT * FROM retiring_titles

