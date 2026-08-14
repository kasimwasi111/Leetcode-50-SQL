# Select the machine ID
SELECT s.machine_id,
# Calculate the average processing time
# Processing time = end timestamp - start timestamp
# ROUND(..., 3) keeps 3 decimal places
ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
# Use Activity table as the start-time table
FROM Activity s
# Use Activity table again as the end-time table
JOIN Activity e
# Match records belonging to the same machine
ON s.machine_id = e.machine_id
# Match records belonging to the same process
AND s.process_id = e.process_id
-- # Make sure s is the start record
AND s.activity_type = 'start'
-- # Make sure e is the end record
AND e.activity_type = 'end'
-- # Calculate the average separately for each machine
GROUP BY s.machine_id;