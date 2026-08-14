# Select the product name
SELECT p.product_name,
# Select the year of the sale
s.year,
# Select the sale price
s.price
# Sales is the main table because we need the sales records
FROM Sales s
# Join Product to get the product name
LEFT JOIN Product p
# Match rows using product_id
ON s.product_id = p.product_id;