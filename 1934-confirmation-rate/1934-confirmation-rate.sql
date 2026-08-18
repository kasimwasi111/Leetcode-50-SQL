# Select each user's ID
SELECT 
    s.user_id,
# Check whether action is 'confirmed'
# TRUE = 1, FALSE = 0
# AVG() gives the confirmation rate
# IFNULL() changes NULL to 0
# ROUND() keeps the result to 2 decimal places
    ROUND(
        IFNULL(
            AVG(action = 'confirmed'),
            0
        ),
        2
    ) AS confirmation_rate
# Start with all users from Signups
FROM Signups s
# Bring confirmation records for each user
# LEFT JOIN keeps users even if they have no confirmation
LEFT JOIN Confirmations c
# Match records using user_id
ON s.user_id = c.user_id
# Create one group for each user
# So AVG() is calculated separately for every user
GROUP BY s.user_id;