# Write your MySQL query statement below
# Select the customer ID
SELECT v.customer_id,
# Count the visits where no transaction was made
COUNT(v.visit_id) AS count_no_trans
# Start with Visits because we need every visit
FROM Visits v
# Match each visit with its transactions
LEFT JOIN Transactions t
# Join using visit_id
ON v.visit_id = t.visit_id
# Keep only visits that have no transaction
WHERE t.transaction_id IS NULL
# Group visits by customer
GROUP BY v.customer_id;
