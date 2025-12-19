/* USDA Agricultural Analysis 
Author: Milan Patel
Tools: SQLite
Description: A collection of queries designed to extract strategic insights 
from national agricultural production datasets.
*/

-- 1. Total Milk Production for 2023 Yearly Report
-- Answer: 91,812,000,000
SELECT 
    SUM(Value) AS total_milk_production
FROM 
    milk_production
WHERE 
    year = 2023;


-- 2. States with Cheese Production > 100M (April 2023)
-- Strategic Goal: Identify high-output states for marketing focus.
SELECT 
    *
FROM 
    cheese_production	
WHERE 
    value >= 100000000 
    AND year = 2023 
    AND period = 'APR';


-- 3. Coffee Production Value for 2011
-- Answer: 7,600,000
SELECT
    SUM(value) AS total_coffee_value,
    year
FROM 
    coffee_production
WHERE 
    year = 2011
GROUP BY 
    year;


-- 4. Average Honey Production (2022)
-- Prepared for the Honey Council Meeting.
SELECT
    AVG(value) AS average_honey_production
FROM 
    honey_production
WHERE 
    year = 2022;


-- 5. ANSI Code Lookup for State Relations
-- Requirement: List state names with corresponding ANSI codes.
SELECT 
    *
FROM 
    state_lookup
WHERE 
    State = 'FLORIDA';


-- 6. Cross-Commodity Report: Cheese Production by State (Including Nulls)
-- Ensuring all states are listed even if April 2023 production was zero.
SELECT 
    s.state,
    COALESCE(SUM(c.Value), 0) AS total_cheese_production
FROM 
    state_lookup s
LEFT JOIN 
    cheese_production c ON s.State_ANSI = c.State_ANSI 
    AND c.year = 2023 
    AND c.Period = 'APR'
GROUP BY 
    s.State;


-- 7. High-Value Planning: 2022 Yogurt Production in 2023 Cheese-Producing States
-- Logic: Cross-referencing current dairy leaders with historical yogurt output.
SELECT 
    SUM(y.Value) AS total_yogurt_production
FROM 
    yogurt_production y
WHERE 
    y.year = 2022 
    AND y.State_ANSI IN (
        SELECT DISTINCT c.state_ANSI 
        FROM cheese_production c 
        WHERE c.year = 2023
    );


-- 8. Gap Analysis: States missing from 2023 Milk Production records
-- Helping the Data Integrity team identify missing reports.
SELECT
    COUNT(*) AS missing_states_count
FROM 
    state_lookup s
WHERE 
    s.State_ANSI NOT IN (
        SELECT m.State_ANSI 
        FROM milk_production m 
        WHERE m.year = 2023 
        AND m.State_ANSI IS NOT NULL
    );


-- 9. Comprehensive Cheese Production Review (All States)
-- Question: Did Delaware produce cheese in April 2023? (Answer: No/0)
SELECT 
    s.state,
    COALESCE(SUM(c.Value), 0) AS cheese_value
FROM 
    state_lookup s
LEFT JOIN 
    cheese_production c ON s.State_ANSI = c.State_ANSI 
GROUP BY 
    s.State;


-- 10. Advanced Insight: Average Coffee Production during High-Honey Years
-- Logic: Finding average coffee output for years where honey exceeded 1M.
SELECT
    AVG(c.value) AS avg_coffee_output
FROM 
    coffee_production c
WHERE 
    c.year IN (
        SELECT h.year 
        FROM honey_production h 
        GROUP BY h.year 
        HAVING SUM(h.value) > 1000000
    );