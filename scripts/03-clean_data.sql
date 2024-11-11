SELECT nowtime, vendor, product_id, product_name, brand, current_price, old_price, units, price_per_unit, other 
    FROM raw 
    INNER JOIN product 
    ON raw.product_id = product.id 
    WHERE product.product_name LIKE '%White Eggs%' 
    AND price_per_unit IS NOT NULL
    