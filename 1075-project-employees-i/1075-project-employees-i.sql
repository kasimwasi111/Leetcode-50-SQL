# Select each project
SELECT 
    p.project_id,
    # Calculate the average experience of employees
    # ROUND(..., 2) keeps the answer to 2 decimal places
    ROUND(
        AVG(e.experience_years),
        2
    ) AS average_years
# Start with the Project table
FROM Project p
# Keep every project, even if there is no matching employee
LEFT JOIN Employee e
# Match the employee from Project with Employee
ON p.employee_id = e.employee_id
# Create one group for each project
# AVG() will calculate the average experience separately for each project
GROUP BY p.project_id;