# Vendor-Based Pricing Dynamics of Eggs in Canada

## Overview

This study provides an empirical analysis of the price dynamics of various eggs across various brand and vendors in Canada, derived from a robust dataset obtained through Project Hammer. By meticulously cleaning and processing the data with advanced statistical techniques in R, we uncover significant insights into the pricing variations between different egg types and vendors. 
This study provides an empirical analysis of the price dynamics of various eggs across various brand and vendors in Canada, derived from a robust dataset obtained through Project Hammer. By meticulously cleaning and processing the data with advanced statistical techniques in R, we uncover significant insights into the pricing variations between different egg types and vendors. 


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from X.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

we use the ChatGPT to generate the example SQL code for us to understand how to extract the eggs number in unit column and the entire chat history is available in other/llm_usage/usage.txt.
we use the ChatGPT to generate the example SQL code for us to understand how to extract the eggs number in unit column and the entire chat history is available in other/llm_usage/usage.txt.

## Note

This R project is setup with [Positron](https://positron.posit.co/), the new IDE by Posit PBC. The properties of this project is stored in `/renv/settings.json`. We use renv for reproducibility and portability. With the metadata from the lockfile, other researchers can install exactly the same version of every package.
You can run 
```sh
renv::restore()
```
to restore the R project emvironment. We also included a .Rproj file for RStudio users. For more information, see [this Github Issue](https://github.com/posit-dev/positron/discussions/3967) and [renv](https://rstudio.github.io/renv/articles/renv.html).
