# Select the unique ID from EmployeeUNI
SELECT u.unique_id,
# Select the employee name from Employees
e.name
# Use Employees as the main table
FROM Employees e
# Keep every employee, even if they don't have a unique ID
LEFT JOIN EmployeeUNI u
# Match employees using their ID
ON e.id = u.id;