/*
Canadian City Affordability Analysis
File: 02_data_analysis.sql

Purpose:
Document the final analytical dataset and the calculations used to
compare affordability across eight Canadian cities.

IMPORTANT:
The original temporary BigQuery Sandbox tables expired after the project
was completed.

The final analytical dataset was preserved as City_rank.csv. The analysis
below therefore uses the documented final table structure and calculations
that can still be verified.

The original formula used to calculate Affordability_Score was not preserved.
For transparency, no replacement formula has been invented.
*/


-- ============================================================
-- 1. FINAL ANALYTICAL DATASET
-- ============================================================

/*
The final dataset contains the following fields:

City
Province
Average_Employment_Income
Monthly_Rent_2025
Unemployment_Rate
Cost_of_Living_index
Salary_to_Rent_Ratio
Affordability_Score

The analysis contains eight Canadian cities.
*/


-- ============================================================
-- 2. SALARY-TO-RENT RATIO
-- ============================================================

/*
Purpose:
Compare average employment income with monthly rent.

The ratio was calculated as:

Average Employment Income / Monthly Rent

A higher ratio indicates that annual employment income is larger relative
to the monthly rent value.

Example:
Quebec City

55,400 / 1,377 = 40.23
*/

SELECT
    City,
    Average_Employment_Income,
    Monthly_Rent_2025,
    ROUND(
        Average_Employment_Income / Monthly_Rent_2025,
        2
    ) AS Salary_to_Rent_Ratio
FROM final_city_data
ORDER BY Salary_to_Rent_Ratio DESC;


/*
Expected ranking from the preserved final dataset:

Quebec City
Edmonton
Winnipeg
Calgary
Montreal
Ottawa
Vancouver
Toronto
*/


-- ============================================================
-- 3. CITY ECONOMIC INDICATORS
-- ============================================================

/*
Purpose:
Compare the four primary economic indicators used in the project:
employment income, rent, unemployment, and cost of living.

This query provides the core city-level dataset used for comparison
and visualization.
*/

SELECT
    City,
    Province,
    Average_Employment_Income,
    Monthly_Rent_2025,
    Unemployment_Rate,
    Cost_of_Living_index
FROM final_city_data
ORDER BY City;


/*
These indicators were interpreted together rather than using salary alone
as a measure of affordability.
*/


-- ============================================================
-- 4. AFFORDABILITY SCORE RESULTS
-- ============================================================

/*
The original project included an Affordability_Score that combined
multiple affordability and employment factors.

However, the exact SQL formula used to construct this score was not
preserved before the original BigQuery Sandbox tables expired.

For transparency and reproducibility, this repository does not reconstruct
or invent an unsupported formula.

The preserved final dataset contains the following calculated scores:

Quebec City : 42.14
Edmonton    : 37.75
Winnipeg    : 35.04
Calgary     : 31.12
Montreal    : 27.65
Ottawa      : 22.98
Vancouver   : 18.36
Toronto     : 18.18
*/


-- ============================================================
-- 5. AFFORDABILITY RANKING
-- ============================================================

/*
Purpose:
Rank the cities using the Affordability_Score already contained in the
preserved final analytical dataset.

This query does NOT recalculate the score.
*/

SELECT
    City,
    Average_Employment_Income,
    Monthly_Rent_2025,
    Unemployment_Rate,
    Cost_of_Living_index,
    Salary_to_Rent_Ratio,
    Affordability_Score
FROM final_city_data
ORDER BY Affordability_Score DESC;


/*
The preserved results show Quebec City at the top of the affordability
ranking, followed by Edmonton and Winnipeg.

Toronto and Vancouver appear at the bottom of the ranking.

These results describe the selected indicators in this dataset and should
not be interpreted as a universal ranking of the best Canadian cities
for every individual.
*/
