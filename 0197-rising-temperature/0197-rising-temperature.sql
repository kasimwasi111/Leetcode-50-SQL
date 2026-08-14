# Select today's ID because we want the ID of the rising-temperature day
SELECT today.id
# Use Weather table and call this copy "today"
FROM Weather today
# Use Weather table AGAIN and call this copy "yesterday"
JOIN Weather yesterday
# Make sure today is exactly one day after yesterday
ON today.recordDate = DATE_ADD(yesterday.recordDate, INTERVAL 1 DAY)
# Check whether today's temperature is higher than yesterday's
WHERE today.temperature > yesterday.temperature;