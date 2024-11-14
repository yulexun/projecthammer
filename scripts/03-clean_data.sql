SELECT nowtime, vendor, product_id, product_name, brand, CAST(current_price AS DECIMAL) AS current_price, units,
       CAST(REPLACE(REPLACE(price_per_unit, '$', ''), '/item', '') AS DECIMAL(10, 2)) AS price_per_unit_numeric,
       CAST(SUBSTR(units, 1, 
        CASE 
            WHEN INSTR(units || ' ', ' ') > 0 THEN INSTR(units || ' ', ' ') - 1 
            ELSE LENGTH(units) 
        END
    ) AS INTEGER) AS numerical_units
FROM raw 
INNER JOIN product 
ON raw.product_id = product.id 
WHERE (product.product_name LIKE '%White Eggs%' OR product.product_name LIKE '%Brown Eggs%')
AND price_per_unit IS NOT NULL;
