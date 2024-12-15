SELECT dept_name
FROM (
    SELECT dept_name, SUM(salary) AS value
    FROM instructor
    GROUP BY dept_name
) AS dept_total,
(
    SELECT AVG(value) AS avg_value
    FROM (
        SELECT SUM(salary) AS value
        FROM instructor
        GROUP BY dept_name
    ) AS subquery
) AS dept_total_avg
WHERE dept_total.value >= dept_total_avg.avg_value;