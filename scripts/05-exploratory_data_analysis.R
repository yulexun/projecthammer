#### Preamble ####
# Purpose: Clean the data in the sqlite file and test basic summary statistics
# Author: Lexun Yu
# Date: 11 November 2024
# Contact: lx.yu@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(DBI)
library(RSQLite)
library(arrow)

#### Read data ####
con <- dbConnect(RSQLite::SQLite(), "data/01-raw_data/hammer-2-processed.sqlite")

tables <- dbListTables(con)
print(tables)

sql_code <- readLines("scripts/03-clean_data.sql")

# Execute the SQL code
dbExecute(con, paste(sql_code, collapse = "\n"))

# Import cleaned data
data <- dbGetQuery(con, "
    SELECT nowtime, vendor, product_id, product_name, brand, current_price, units,
       CAST(REPLACE(REPLACE(price_per_unit, '$', ''), '/item', '') AS DECIMAL(10, 2)) AS price_per_unit_numeric
FROM raw
INNER JOIN product
ON raw.product_id = product.id
WHERE (product.product_name LIKE '%White Eggs%' OR product.product_name LIKE '%Brown Eggs%')
AND price_per_unit IS NOT NULL;
")

# Omit rows with NA in any column
data <- data %>% drop_na()

# Save Cleaned Data
write_parquet(data, "data/02-analysis_data/cleaned_data.parquet")
