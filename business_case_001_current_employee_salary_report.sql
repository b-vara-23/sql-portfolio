/*
=========================================================
Business Case 001
Current Employee Salary Report
=========================================================

Business Question:
Retrieve all current employees with their department
and current salary.

Skills Used:
- INNER JOIN
- Filtering
- ORDER BY

Database:
employees
=========================================================
*/


SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_name, s.salary
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
        JOIN
    departments d ON de.dept_no = d.dept_no
        JOIN
    salaries s ON s.emp_no = e.emp_no
WHERE
    s.to_date = '9999-01-01'
        AND de.to_date = '9999-01-01'
ORDER BY s.salary DESC;
