/*
Canadian City Affordability Analysis
File: 01_data_cleaning.sql

Purpose:
Document the data cleaning and standardization process used to prepare
four datasets for the Canadian City Affordability Analysis.

IMPORTANT:
The original BigQuery Sandbox tables expired after the project was completed.
This script was reconstructed from the documented project workflow.

The original raw column names are no longer available. Therefore, this file
documents the verified transformations without inventing unsupported raw
table or column names.

Final cleaned tables used in the original project:
- salary_clean
- City_rent_monthly_clean
- cost_of_living_clean
- unemployment_rate_clean
*/


-- ============================================================
-- 1. SALARY DATA
-- ============================================================

/*
Source:
Statistics Canada

Data period:
2023

Final table:
salary_clean

Purpose:
Prepare average employment income data so that city names and province
values are consistent with the other datasets.

Verified cleaning steps:
1. Replace "Ottawa-Gatineau" with "Ottawa".
2. Replace the province value "Ontario/Quebec" with "Ontario".
3. Keep only cities represented across all four datasets.
4. Verify that employment income values are numeric.

The original executable query is not reproduced because the raw table
and its original column names are no longer available.
*/


-- ============================================================
-- 2. MONTHLY RENT DATA
-- ============================================================

/*
Source:
Canada Mortgage and Housing Corporation (CMHC)
Rental Market Survey

Data period:
2025

Final table:
City_rent_monthly_clean

Purpose:
Standardize city names and convert monthly rent values into a numeric
format suitable for analysis.

Verified cleaning steps:
1. Remove the first incorrect row that was imported as data.
2. Replace "Ottawa-Gatineau (Ont. part)" with "Ottawa".
3. Replace "Montréal" with "Montreal".
4. Replace "Québec" with "Quebec City".
5. Remove commas from rent values.
6. Convert monthly rent values to FLOAT64.
7. Remove missing values represented by "**".
8. Keep only cities represented across all four datasets.

Example of the numeric transformation:

"2,891" -> 2891
*/


-- ============================================================
-- 3. COST OF LIVING DATA
-- ============================================================

/*
Source:
Numbeo

Data period:
Early 2026

Final table:
cost_of_living_clean

Purpose:
Prepare cost-of-living information for integration with the other
economic indicators.

Verified cleaning steps:
1. The dataset was already clean and correctly formatted.
2. Keep only cities represented across all four datasets.

Variables documented in the original project included:
- City
- Cost of Living Index
- Groceries Index
- Local Purchasing Power

The final affordability dataset uses the Cost of Living Index.
*/


-- ============================================================
-- 4. UNEMPLOYMENT DATA
-- ============================================================

/*
Source:
Statistics Canada

Data period:
2025

Final table:
unemployment_rate_clean

Purpose:
Prepare unemployment-rate information for city-level comparison.

Verified cleaning steps:
1. The dataset was already clean.
2. The dataset was already restricted to 2025 values.
3. Remove cities not represented across all four datasets.
4. Keep only the final cities used in the analysis.
*/


-- ============================================================
-- 5. FINAL DATA CONSISTENCY
-- ============================================================

/*
After cleaning, all four datasets contained the same eight cities:

- Calgary
- Edmonton
- Montreal
- Ottawa
- Quebec City
- Toronto
- Vancouver
- Winnipeg

This common city set allowed the four datasets to be merged into one
analytical dataset for SQL analysis and Tableau visualization.
*/
