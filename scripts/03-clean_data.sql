SELECT nowtime, vendor, product_id, product_name, brand, current_price, units,
       CAST(REPLACE(REPLACE(price_per_unit, '$', ''), '/item', '') AS DECIMAL(10, 2)) AS price_per_unit_numeric
FROM raw 
INNER JOIN product 
ON raw.product_id = product.id 
WHERE (product.product_name LIKE '%White Eggs%' OR product.product_name LIKE '%Brown Eggs%')
AND price_per_unit IS NOT NULL;
