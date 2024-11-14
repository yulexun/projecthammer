#### Preamble ####
# Purpose: Simulates a dataset of egg price data
# Author: Lexun Yu
# Date: 14 November 2024
# Contact: lx.yu@mail.utoronto.ca
# License: MIT


# Load necessary library
library(dplyr)
library(arrow)

# Set seed for reproducibility
set.seed(123)

# Simulate data
raw <- data.frame(
  nowtime = as.POSIXct("2024-01-01") + sample(1:10000, 100, replace = TRUE),
  vendor = sample(c("VendorA", "VendorB", "VendorC"), 100, replace = TRUE),
  product_id = sample(1:50, 100, replace = TRUE),
  current_price = round(runif(100, 2, 6), 2),
  old_price = round(runif(100, 2, 6), 2),
  units = sample(1:12, 100, replace = TRUE),
  price_per_unit = paste0("$", round(runif(100, 0.1, 0.5), 2), "/item")
)

product <- data.frame(
  id = 1:50,
  product_name = sample(c("White Eggs", "Brown Eggs", "Large Eggs", "Free Range Eggs"), 50, replace = TRUE),
  brand = sample(c("BrandX", "BrandY", "BrandZ"), 50, replace = TRUE)
)

# Join the tables to simulate the SQL JOIN operation
dataset <- raw %>%
  inner_join(product, by = c("product_id" = "id")) %>%
  filter((grepl("White Eggs", product_name) | grepl("Brown Eggs", product_name)) &
    !is.na(price_per_unit)) %>%
  mutate(price_per_unit_numeric = as.numeric(gsub("[^0-9.]", "", price_per_unit))) %>%
  select(
    nowtime, vendor, product_id, product_name, brand, current_price, old_price, units,
    price_per_unit_numeric
  )

# View the resulting dataset
write_parquet(dataset, "data/00-simulated_data/simulated_data.parquet")
