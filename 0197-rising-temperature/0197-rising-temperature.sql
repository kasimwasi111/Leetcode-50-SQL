-- # Select today's ID because we want the ID of the rising-temperature day
SELECT today.id
# Use Weather table and call this copy "today"
FROM Weather today
# Use Weather table AGAIN and call this copy "yesterday"
JOIN Weather yesterday
# Make sure today is exactly one day after yesterday
ON datediff(today.recordDate,yesterday.recordDate)=1
# Check whether today's temperature is higher than yesterday's
WHERE today.temperature > yesterday.temperature;
-- select id 
-- from (select id,recordDate ,temperature ,
-- lag(temperature) over (order by recordDate) as previoustemp,
-- lag(recordDate) over (order by recordDate) as prevRecordDate
-- from weather) w
-- where temperature>previoustemp
-- and datediff(recordDate,prevRecordDate)=1
-- ;