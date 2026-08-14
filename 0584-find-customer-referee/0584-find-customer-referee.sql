SELECT name
-- Selects the 'name' column that we want to display

FROM Customer
-- Gets the data from the Customer table

WHERE referee_id != 2
-- Keeps customers whose referee_id is NOT 2

OR referee_id IS NULL;
-- Also keeps customers who have no referee
-- because NULL cannot be compared using !=