# Select each user's ID
SELECT 
    s.user_id,

    # Count how many actions are 'confirmed'
    # TRUE = 1, FALSE = 0
    # Divide confirmed actions by total confirmation records
    # IFNULL() changes NULL to 0
    # ROUND() keeps the result to 2 decimal places
    ROUND(
        IFNULL(
            SUM(action = 'confirmed') / COUNT(c.user_id),
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
GROUP BY s.user_id;