#### Preamble ####
# Purpose: Downloads and saves the data from https://jacobfilipp.com/hammer/.
# Author: Lexun Yu
# Date: 19 October 2024
# Contact: lx.yu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)

#### Download data ####
# Specify the download URL from FiveThirtyEight
url <- "https://jacobfilipp.com/hammerdata/hammer-3-compressed.zip"

# Save the data zip
download.file(url, "data/01-raw_data/hammer.zip")

# Unzip
unzip("data/01-raw_data/hammer.zip", exdir = "data/01-raw_data/")
