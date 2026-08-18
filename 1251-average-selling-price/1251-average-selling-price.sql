# Select each product
SELECT 
    p.product_id,
    # Calculate weighted average selling price
    # price * units = total money earned for that sale
    # SUM(price * units) = total revenue
    # SUM(units) = total units sold
    # Revenue / Units = average selling price
    # ROUND(..., 2) = keep 2 decimal places
    # IFNULL(..., 0) = if there are no sales, return 0
    IFNULL(
        ROUND(
            SUM(p.price * u.units) / SUM(u.units),
            2
        ),
        0
    ) AS average_price
# Start with all products and their prices
FRoM Prices p
# LEFT JOIN is important
# It keeps products even when they have no sales
LEFT JOIN UnitsSold u
# Match the same product
ON p.product_id = u.product_id
# Only consider purchases made while this price was active
AND u.purchase_date BETWEEN p.start_date AND p.end_date
# Create one group for each product
GROUP BY p.product_id;