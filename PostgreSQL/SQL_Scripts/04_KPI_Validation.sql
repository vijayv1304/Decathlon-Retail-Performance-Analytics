/*
PROJECT 04: DECATHLON RETAIL PERFORMANCE ANALYTICS

FILE: 04_KPI_Validation.sql

PURPOSE:
Validate the six dashboard KPI cards against
the approved CY YTD and PYTD reporting periods.

KPI LIST:
1. Net Sales YTD
2. Gross Profit YTD
3. Gross Margin YTD %
4. Units Sold YTD
5. Total Orders YTD
6. Average Order Value YTD

REPORTING CUTOFF: 15-Sep-2026
CY YTD: 01-Jan-2026 to 15-Sep-2026
PYTD:   01-Jan-2025 to 15-Sep-2025
*/
-- ==============================================================================

-- KPI VALIDATION 01: CY YTD vs PYTD

SELECT
    'Net Sales' AS kpi,
    SUM(CASE
        WHEN purchase_date BETWEEN '2026-01-01' AND '2026-09-15'
        THEN net_sales_inr ELSE 0
    END) AS cy_ytd,
    SUM(CASE
        WHEN purchase_date BETWEEN '2025-01-01' AND '2025-09-15'
        THEN net_sales_inr ELSE 0
    END) AS pytd
FROM sales

UNION ALL

SELECT
    'Gross Profit',
    SUM(CASE
        WHEN purchase_date BETWEEN '2026-01-01' AND '2026-09-15'
        THEN gross_profit_inr ELSE 0
    END),
    SUM(CASE
        WHEN purchase_date BETWEEN '2025-01-01' AND '2025-09-15'
        THEN gross_profit_inr ELSE 0
    END)
FROM sales

UNION ALL

SELECT
    'Gross Margin %',
    ROUND(
        SUM(CASE WHEN purchase_date BETWEEN '2026-01-01' AND '2026-09-15'
            THEN gross_profit_inr ELSE 0 END) /
        NULLIF(SUM(CASE WHEN purchase_date BETWEEN '2026-01-01' AND '2026-09-15'
            THEN net_sales_inr ELSE 0 END), 0) * 100, 2
    ),
    ROUND(
        SUM(CASE WHEN purchase_date BETWEEN '2025-01-01' AND '2025-09-15'
            THEN gross_profit_inr ELSE 0 END) /
        NULLIF(SUM(CASE WHEN purchase_date BETWEEN '2025-01-01' AND '2025-09-15'
            THEN net_sales_inr ELSE 0 END), 0) * 100, 2
    )
FROM sales

UNION ALL

SELECT
    'Net Units Sold',
    SUM(CASE
        WHEN purchase_date BETWEEN '2026-01-01' AND '2026-09-15'
        THEN quantity - returned_qty ELSE 0
    END),
    SUM(CASE
        WHEN purchase_date BETWEEN '2025-01-01' AND '2025-09-15'
        THEN quantity - returned_qty ELSE 0
    END)
FROM sales

UNION ALL

SELECT
    'Total Orders',
    COUNT(DISTINCT CASE
        WHEN purchase_date BETWEEN '2026-01-01' AND '2026-09-15'
        THEN order_id END),
    COUNT(DISTINCT CASE
        WHEN purchase_date BETWEEN '2025-01-01' AND '2025-09-15'
        THEN order_id END)
FROM sales

UNION ALL

SELECT
    'Average Order Value',
    ROUND(
        SUM(CASE WHEN purchase_date BETWEEN '2026-01-01' AND '2026-09-15'
            THEN net_sales_inr ELSE 0 END) /
        NULLIF(COUNT(DISTINCT CASE
            WHEN purchase_date BETWEEN '2026-01-01' AND '2026-09-15'
            THEN order_id END), 0), 2
    ),
    ROUND(
        SUM(CASE WHEN purchase_date BETWEEN '2025-01-01' AND '2025-09-15'
            THEN net_sales_inr ELSE 0 END) /
        NULLIF(COUNT(DISTINCT CASE
            WHEN purchase_date BETWEEN '2025-01-01' AND '2025-09-15'
            THEN order_id END), 0), 2
    )
FROM sales;

/*
KPI VALIDATION FINDINGS

1. All six CY YTD and PYTD KPI values match the
   established business analysis baseline.

2. Net Sales increased by 24.33%.

3. Gross Profit increased by 25.32%.

4. Gross Margin improved by 0.31 percentage points.

5. Net Units Sold increased by 23.14%.

6. Total Orders increased by 23.02%.

7. Average Order Value increased by 1.07%.

BUSINESS INTERPRETATION:
Sales growth was primarily volume-driven, supported
by increased orders and units sold. Profitability
also improved slightly.

VALIDATED REPORTING PERIOD:
CY YTD: 01-Jan-2026 to 15-Sep-2026
PYTD:   01-Jan-2025 to 15-Sep-2025
*/
-- ==============================================================================