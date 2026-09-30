-- 24/09/2026 




-- 1. Find Employees Earning Above Their Department Average
SELECT e1.first_name, e1.department_id, e1.salary
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);


-- 2. Find Employees Who Are Managers (Using EXISTS)
SELECT e1.employee_id, e1.first_name, e1.last_name
FROM employees e1
WHERE EXISTS (
    SELECT 1 
    FROM employees e2 
    WHERE e2.manager_id = e1.employee_id
);


-- 3. Find the Highest Paid Employee in Each Department
SELECT e1.first_name, e1.department_id, e1.salary
FROM employees e1
WHERE e1.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);


-- 4. Display Employee Details Side-by-Side with Their Department's Average
SELECT e1.first_name, e1.department_id, e1.salary,
       (SELECT ROUND(AVG(e2.salary), 2) 
        FROM employees e2 
        WHERE e2.department_id = e1.department_id) AS dept_avg_salary
FROM employees e1;


-- 5. Find Departments That Have No Employees Assigned (Using NOT EXISTS)
SELECT d.department_id, d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1 
    FROM employees e 
    WHERE e.department_id = d.department_id
);
