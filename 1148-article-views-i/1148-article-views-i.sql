# Select unique author IDs and rename the column as id
SELECT DISTINCT author_id AS id

# Get the data from the Views table
FROM Views

# Find authors who viewed their own articles
WHERE author_id = viewer_id

# Sort the result by id in ascending order
ORDER BY id;