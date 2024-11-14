#### Preamble ####
# Purpose: test the dataset of egg price data
# Author: Lexun Yu
# Date: 14 November 2024
# Contact: lx.yu@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(arrow)
library(testthat)

dataset <- read_parquet("data/02-analysis_data/cleaned_data.parquet")

test_that("Dataset structure and values", {
  # Check if dataset has the expected columns
  expect_true(all(c(
    "nowtime", "vendor", "product_id", "product_name", "brand",
    "current_price", "units", "price_per_unit_numeric"
  ) %in% colnames(dataset)))

  # Check that there are no missing values in essential columns
  expect_false(any(is.na(dataset$nowtime)))
  expect_false(any(is.na(dataset$vendor)))
  expect_false(any(is.na(dataset$product_id)))
  expect_false(any(is.na(dataset$product_name)))
  expect_false(any(is.na(dataset$brand)))
  expect_false(any(is.na(dataset$current_price)))
  expect_false(any(is.na(dataset$units)))
  expect_false(any(is.na(dataset$price_per_unit_numeric)))

  # Check that price_per_unit_numeric is numeric
  expect_type(dataset$price_per_unit_numeric, "double")

  # Check if price_per_unit_numeric is greater than 0
  expect_true(all(dataset$price_per_unit_numeric >= 0))
})
