/*
Business Case 005

Business Question:
Find the top 3 highest-paid current employees
in each department.
*/

WITH ranked_salaries AS (
    SELECT
        e.emp_no,
        e.first_name,
        e.last_name,
        d.dept_name,
        s.salary,
        ROW_NUMBER() OVER (
            PARTITION BY de.dept_no
            ORDER BY s.salary DESC
        ) AS salary_rank
    FROM employees e
    JOIN dept_emp de
        ON e.emp_no = de.emp_no
    JOIN departments d
        ON d.dept_no = de.dept_no
    JOIN salaries s
        ON e.emp_no = s.emp_no
    WHERE s.to_date = '9999-01-01'
      AND de.to_date = '9999-01-01'
)

SELECT
    emp_no,
    first_name,
    last_name,
    dept_name,
    salary,
    salary_rank
FROM ranked_salaries
WHERE salary_rank <= 3
ORDER BY dept_name, salary_rank;