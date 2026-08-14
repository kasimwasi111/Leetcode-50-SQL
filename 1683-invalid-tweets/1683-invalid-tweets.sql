# Select the tweet ID
SELECT tweet_id

# Get the data from the Tweets table
FROM Tweets

# Keep tweets whose content is longer than 15 characters
WHERE LENGTH(content) > 15;