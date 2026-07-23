/*
=========================================================
Business Case 004
Employees Who Have Ever Worked in Finance
=========================================================

Business Question:
Find all employees who have ever worked
in the Finance department.

Skills Used:
- EXISTS
- Correlated Subquery
- INNER JOIN

Database:
employees
=========================================================
*/


SELECT 
    e.emp_no, e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            1
        FROM
            departments de
                JOIN
            dept_emp d ON de.dept_no = d.dept_no
        WHERE
            e.emp_no = d.emp_no
                AND de.dept_name = 'Finance')