# Project 04 – KPI & DAX Documentation

## 1. Overview

Key Performance Indicators (KPIs) are used to evaluate retail sales performance, profitability, growth and operational activity.

The Power BI solution uses reusable DAX measures to provide consistent calculations across the Executive Overview, Sales Performance and Detailed Analysis dashboards.

## 2. Business KPI Definitions

| KPI | Business Definition | Business Purpose |
|---|---|---|
| Net Sales | Revenue after applicable deductions and adjustments | Measures actual sales performance |
| Gross Profit | Difference between net sales and associated product costs | Measures financial contribution |
| Gross Margin % | Gross profit expressed as a percentage of net sales | Evaluates profitability efficiency |
| Net Units Sold | Net quantity of products sold | Measures sales volume |
| Total Orders | Number of distinct orders | Measures transaction activity |
| Net Sales YoY Growth % | Percentage change in net sales compared with the previous year | Measures annual sales growth |
| Average Order Value | Average net sales generated per order | Measures average transaction value |
| Average Order Value YoY Growth % | Year-over-year percentage change in average order value | Evaluates changes in average transaction value |

## 3. KPI Business Interpretation

### Net Sales
Measures the revenue generated from retail transactions after applicable deductions.

### Gross Profit
Indicates the financial contribution remaining after accounting for the associated cost of goods sold.

### Gross Margin %
Shows how much gross profit is generated for each unit of net sales revenue.

### Net Units Sold
Measures the net quantity of products sold during the selected reporting period.

### Total Orders
Measures the number of distinct customer orders.

### Net Sales YoY Growth %
Compares current-period net sales with the corresponding previous-year period.

A positive value indicates growth, while a negative value indicates a decline.

### Average Order Value
Measures the average sales value generated per order.

### Average Order Value YoY Growth %
Evaluates whether average order value has increased or decreased compared with the previous year.

## 4. DAX Development Approach

The project uses DAX measures to support:

- Financial KPI calculations.
- Sales growth analysis.
- Profitability analysis.
- Time intelligence.
- Dynamic reporting periods.
- Interactive visual filtering.
- Conditional increase/decrease indicators.

Measures are reused across multiple report pages wherever possible to maintain consistency and avoid unnecessary duplication.

## 5. Dynamic Reporting Period

The `Reporting Period` measure dynamically displays the selected date range.

It uses the selected date context from the Calendar table and formats the minimum and maximum selected dates into a readable reporting-period label.

This value is displayed on all three main dashboard pages.

## 6. Conditional KPI Indicators

Year-over-year KPI indicators use conditional formatting to communicate performance direction.

- Green with an upward arrow: Positive movement.
- Red with a downward arrow: Negative movement.
- Neutral indicator: No meaningful movement, where applicable.

The indicators help management identify performance changes quickly.

## 7. DAX Validation Approach

Measures are validated by checking:

1. Results against underlying source data.
2. Aggregation behavior.
3. Date-filter behavior.
4. Slicer interactions.
5. Regional drill-through behavior.
6. Consistency across dashboard pages.

## 8. Measure Inventory

The final measure inventory should contain the exact DAX measure names, formulas, formats and business descriptions from the Power BI model.