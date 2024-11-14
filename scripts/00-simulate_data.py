#### Preamble ####
# Purpose: Simulates a dataset of Australian electoral divisions, including the 
  # state and party that won each division.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: 
  # - `polars` must be installed (pip install polars)
  # - `numpy` must be installed (pip install numpy)


#### Workspace setup ####
import polars as pl
import numpy as np
import pandas as pd
np.random.seed(853)


#### Simulate data ####
# State names


#### Simulate data ####
number_of_rows = 15
vendor_options = ["sixers", "LA Clipper", "NY Knicks", "LA Lakers"]

# Define the product details
product_details = pd.DataFrame({
    'product_id': [1, 2, 3, 4],
    'product_name': ["Ben Simmons egg", "James Harden egg", "NY media egg", "Lebron James egg"],
    'brand': ["Nike", "Adidas", "NYT", "Nike"],
    'current_price': [0.99, 100, 0.01, 9.9],
    'units': ["1 per pack", "1 per pack", "12 per pack", "1 per pack"]
})

# Set probabilities for product selection
product_probability = [0.25, 0.25, 0.25, 0.25]

# Generate data
data = pd.DataFrame({
    'nowtime': pd.to_datetime('now') + pd.to_timedelta(np.sort(np.random.uniform(0, number_of_rows * 60, number_of_rows)), unit='s'),
    'vendor': np.random.choice(vendor_options, number_of_rows, replace=True),
    'product_info': np.random.choice(product_details['product_id'], number_of_rows, p=product_probability)
})

# Merge the product details with the simulated data
data = pd.merge(data, product_details, left_on='product_info', right_on='product_id', how='left')

# Select and order columns
data = data[['nowtime', 'vendor', 'product_id', 'product_name', 'brand', 'current_price', 'units']]

# Display the dataset
print(data)

# df.to_parquet('data.parquet', engine='pyarrow')



states = [
    "New South Wales", "Victoria", "Queensland", "South Australia", 
    "Western Australia", "Tasmania", "Northern Territory", 
    "Australian Capital Territory"
]

# Political parties
parties = ["Labor", "Liberal", "Greens", "National", "Other"]

# Probabilities for state and party distribution
state_probs = [0.25, 0.25, 0.15, 0.1, 0.1, 0.1, 0.025, 0.025]
party_probs = [0.40, 0.40, 0.05, 0.1, 0.05]

# Generate the data using numpy and polars
divisions = [f"Division {i}" for i in range(1, 152)]
states_sampled = np.random.choice(states, size=151, replace=True, p=state_probs)
parties_sampled = np.random.choice(parties, size=151, replace=True, p=party_probs)

# Create a polars DataFrame
analysis_data = pl.DataFrame({
    "division": divisions,
    "state": states_sampled,
    "party": parties_sampled
})


#### Save data ####
analysis_data.write_csv("data/00-simulated_data/simulated_data.csv")
