USDA Agricultural Production Analysis (SQL)

1. Project Overview

This project simulates the role of a Data Scientist at the United States Department of Agriculture (USDA). The objective was to analyse production trends across multiple commodities (Milk, Cheese, Coffee, Honey, and Yogurt) to support strategic planning and state-level decision-making.

The Problem: The USDA manages vast datasets across disparate tables. Converting this raw data into actionable insights for specific stakeholders (e.g. the Honey Council or Cheese Department) requires complex relational queries.

The Solution: Developed a suite of SQL queries to extract KPIs, identify production anomalies, and perform cross-commodity analysis using joins and subqueries.

2. Technical Toolkit

Database: SQLite

SQL Techniques:

Aggregations: Utilised SUM, AVG, and COUNT for yearly and state-level reporting.

Relational Joins: Implemented LEFT JOINs to ensure data integrity for states with zero production.

Subqueries: Used for cross-referencing multi-year data (e.g. identifying yogurt production in states with active cheese data).

Data Handling: Utilised COALESCE to manage NULL values and ensure professional reporting.

3. Business Questions Answered

Yearly Reporting: Calculated total milk production for 2023 (~91.8 Billion) for the USDA yearly report.

Targeted Marketing: Identified specific states producing >100M units of cheese in April 2023 to assist the Cheese Department’s marketing strategy.

Trend Analysis: Tracked the evolution of coffee and honey production to identify growth sectors.

Infrastructure Planning: Cross-referenced historical yogurt production with current cheese leaders to help the Dairy Division plan future investments.

4. Repository Structure

usda_analysis.sql: Contains the full collection of documented queries.

README.md: Project documentation and executive summary.

5. How to Run

These queries are designed for any SQL environment containing the USDA commodity schema.

The logic follows SQLite standards but is easily adaptable for PostgreSQL or MySQL.
