-- =====================================================
-- BUSINESS ANALYSIS 01: OVERALL SALES BASELINE
-- =====================================================

SELECT
    COUNT(*) AS total_sales_lines,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS gross_units_sold,
    SUM(returned_qty) AS returned_units,
    SUM(quantity - returned_qty) AS net_units_sold,
    SUM(net_sales_inr) AS total_net_sales,
    SUM(net_cogs_inr) AS total_net_cogs,
    SUM(gross_profit_inr) AS total_gross_profit,
    ROUND(
        SUM(gross_profit_inr) / NULLIF(SUM(net_sales_inr), 0) * 100,
        2
    ) AS gross_margin_pct
FROM sales;

-- ==============================================================================
-- BUSINESS ANALYSIS 02: CY YTD VS PYTD

SELECT
    CASE
        WHEN purchase_date BETWEEN '2026-01-01' AND '2026-09-15'
            THEN 'CY YTD'
        ELSE 'PYTD'
    END AS reporting_period,

    SUM(net_sales_inr) AS net_sales,
    SUM(gross_profit_inr) AS gross_profit,

    ROUND(
        SUM(gross_profit_inr) / NULLIF(SUM(net_sales_inr), 0) * 100,
        2
    ) AS gross_margin_pct,

    SUM(quantity - returned_qty) AS net_units_sold,
    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(
        SUM(net_sales_inr) / NULLIF(COUNT(DISTINCT order_id), 0),
        2
    ) AS average_order_value

FROM sales

WHERE
    purchase_date BETWEEN '2026-01-01' AND '2026-09-15'
    OR
    purchase_date BETWEEN '2025-01-01' AND '2025-09-15'

GROUP BY reporting_period
ORDER BY reporting_period;

-- ==============================================================================
-- BUSINESS ANALYSIS 03: MONTHLY NET SALES TREND

SELECT
    EXTRACT(YEAR FROM purchase_date) AS sales_year,
    EXTRACT(MONTH FROM purchase_date) AS sales_month,
    TO_CHAR(purchase_date, 'Mon') AS month_name,
    SUM(net_sales_inr) AS net_sales,
    SUM(gross_profit_inr) AS gross_profit,
    COUNT(DISTINCT order_id) AS total_orders

FROM sales

GROUP BY
    EXTRACT(YEAR FROM purchase_date),
    EXTRACT(MONTH FROM purchase_date),
    TO_CHAR(purchase_date, 'Mon')

ORDER BY sales_year, sales_month;

-- ==============================================================================
-- BUSINESS ANALYSIS 04: SALES BY SPORT

SELECT
    p.sport,
    SUM(s.net_sales_inr) AS net_sales,
    SUM(s.gross_profit_inr) AS gross_profit,
    SUM(s.quantity - s.returned_qty) AS net_units_sold,
    COUNT(DISTINCT s.order_id) AS total_orders,

    ROUND(
        SUM(s.gross_profit_inr) /
        NULLIF(SUM(s.net_sales_inr), 0) * 100,
        2
    ) AS gross_margin_pct

FROM sales s

JOIN products p
    ON s.product_id = p.product_key

GROUP BY p.sport

ORDER BY net_sales DESC;

/*
BUSINESS FINDINGS – SALES BY SPORT

1. Hiking generated the highest net sales.
2. Fitness recorded the highest gross margin.
3. Yoga generated the lowest net sales.
4. Cycling recorded the lowest gross margin.
5. Running and Swimming recorded high net unit volumes.

BUSINESS INTERPRETATION:
Hiking is the leading revenue contributor, while
Fitness has the strongest gross margin.

*/
-- ==============================================================================
-- BUSINESS ANALYSIS 05: SALES BY REGION

SELECT
    st.region,
    SUM(s.net_sales_inr) AS net_sales,
    SUM(s.gross_profit_inr) AS gross_profit,
    SUM(s.quantity - s.returned_qty) AS net_units_sold,
    COUNT(DISTINCT s.order_id) AS total_orders,

    ROUND(
        SUM(s.gross_profit_inr) /
        NULLIF(SUM(s.net_sales_inr), 0) * 100,
        2
    ) AS gross_margin_pct

FROM sales s

JOIN store st
    ON s.store_id = st.store_key

GROUP BY st.region

ORDER BY net_sales DESC;

/*
BUSINESS FINDINGS – SALES BY REGION

1. South generated the highest net sales and gross profit.
2. West was the second-highest revenue contributor.
3. Central recorded the highest gross margin.
4. East recorded the second-highest gross margin.
5. South had the highest total order volume.

BUSINESS INTERPRETATION:
South is the leading revenue-generating region,
while Central achieved the highest gross margin.
*/

-- ==============================================================================
-- BUSINESS ANALYSIS 06: PRODUCT TYPE PERFORMANCE

SELECT
    p.product_type,
    SUM(s.net_sales_inr) AS net_sales,
    SUM(s.gross_profit_inr) AS gross_profit,
    SUM(s.quantity - s.returned_qty) AS net_units_sold,
    COUNT(DISTINCT s.order_id) AS total_orders,

    ROUND(
        SUM(s.gross_profit_inr) /
        NULLIF(SUM(s.net_sales_inr), 0) * 100,
        2
    ) AS gross_margin_pct

FROM sales s

JOIN products p
    ON s.product_id = p.product_key

GROUP BY p.product_type

ORDER BY net_sales DESC;

/*
BUSINESS FINDINGS – PRODUCT TYPE PERFORMANCE

1. Camping Tent generated the highest net sales.
2. Hiking Shoes ranked second in net sales.
3. Football Jersey recorded the highest gross margin.
4. Cricket Ball recorded the lowest gross margin.
5. Running Socks recorded the highest net units sold.
6. Resistance Band recorded the highest order count.

BUSINESS INTERPRETATION:
Camping Tent and Hiking Shoes are leading revenue
contributors, while Football Jersey has the strongest
gross margin.

Cricket Ball has a comparatively low gross margin
and may require further pricing or cost analysis.
*/

-- ==============================================================================
-- BUSINESS ANALYSIS 07: SALES GROWTH BY BRAND LABEL

SELECT
    p.brand_label,

    SUM(CASE
        WHEN s.purchase_date BETWEEN '2026-01-01' AND '2026-09-15'
        THEN s.net_sales_inr ELSE 0
    END) AS cy_ytd_net_sales,

    SUM(CASE
        WHEN s.purchase_date BETWEEN '2025-01-01' AND '2025-09-15'
        THEN s.net_sales_inr ELSE 0
    END) AS pytd_net_sales,

    ROUND(
        (
            SUM(CASE
                WHEN s.purchase_date BETWEEN '2026-01-01' AND '2026-09-15'
                THEN s.net_sales_inr ELSE 0
            END)
            -
            SUM(CASE
                WHEN s.purchase_date BETWEEN '2025-01-01' AND '2025-09-15'
                THEN s.net_sales_inr ELSE 0
            END)
        )
        / NULLIF(
            SUM(CASE
                WHEN s.purchase_date BETWEEN '2025-01-01' AND '2025-09-15'
                THEN s.net_sales_inr ELSE 0
            END), 0
        ) * 100,
        2
    ) AS sales_growth_pct

FROM sales s

JOIN products p
    ON s.product_id = p.product_key

WHERE s.purchase_date BETWEEN '2025-01-01' AND '2026-09-15'

GROUP BY p.brand_label

ORDER BY sales_growth_pct DESC;

/*
BUSINESS FINDINGS – SALES GROWTH BY BRAND

1. Nabaiji recorded the highest sales growth at 33.94%.
2. Domyos ranked second with 32.50% growth.
3. Quechua generated the highest CY YTD net sales.
4. Artengo recorded the lowest growth at 12.78%.
5. All 10 brands achieved positive sales growth.

BUSINESS INTERPRETATION:
Nabaiji and Domyos are the fastest-growing brands,
while Quechua remains the largest revenue contributor.

Artengo has the slowest growth and may require
further business investigation.

REPORTING PERIOD:
CY YTD: 01-Jan-2026 to 15-Sep-2026
PYTD:   01-Jan-2025 to 15-Sep-2025
*/
-- ==============================================================================
-- BUSINESS ANALYSIS 08: MONTHLY NET SALES COMPARISON

SELECT
    EXTRACT(MONTH FROM purchase_date) AS sales_month,
    TO_CHAR(purchase_date, 'Mon') AS month_name,

    SUM(CASE
        WHEN EXTRACT(YEAR FROM purchase_date) = 2026
        THEN net_sales_inr ELSE 0
    END) AS cy_ytd_net_sales,

    SUM(CASE
        WHEN EXTRACT(YEAR FROM purchase_date) = 2025
        THEN net_sales_inr ELSE 0
    END) AS pytd_net_sales

FROM sales

WHERE
    purchase_date BETWEEN '2026-01-01' AND '2026-09-15'
    OR
    purchase_date BETWEEN '2025-01-01' AND '2025-09-15'

GROUP BY
    EXTRACT(MONTH FROM purchase_date),
    TO_CHAR(purchase_date, 'Mon')

ORDER BY sales_month;

/*
BUSINESS FINDINGS – MONTHLY NET SALES

1. August recorded the highest monthly net sales
   in both reporting years.
2. May and August were strong sales months in 2026.
3. All nine comparable months showed positive
   year-over-year sales growth.
4. September 2026 exceeded September 2025 sales.

BUSINESS INTERPRETATION:
The business demonstrated consistent monthly
revenue growth across the comparable reporting period.

REPORTING PERIOD:
CY YTD: 01-Jan-2026 to 15-Sep-2026
PYTD:   01-Jan-2025 to 15-Sep-2025
*/
-- ==============================================================================
-- BUSINESS ANALYSIS 09: CY YTD SALES BY SPORT

SELECT
    p.sport,
    SUM(s.net_sales_inr) AS cy_ytd_net_sales,
    SUM(s.gross_profit_inr) AS cy_ytd_gross_profit,
    SUM(s.quantity - s.returned_qty) AS cy_ytd_net_units,
    COUNT(DISTINCT s.order_id) AS cy_ytd_orders

FROM sales s

JOIN products p
    ON s.product_id = p.product_key

WHERE s.purchase_date BETWEEN '2026-01-01' AND '2026-09-15'

GROUP BY p.sport

ORDER BY cy_ytd_net_sales DESC;

/*
BUSINESS FINDINGS – CY YTD SALES BY SPORT

1. Hiking generated the highest CY YTD net sales.
2. Badminton ranked second in net sales.
3. Swimming recorded the highest order count.
4. Running recorded the second-highest order count.
5. Yoga generated the lowest net sales.

BUSINESS INTERPRETATION:
Hiking is the leading revenue contributor, while
Swimming and Running demonstrate strong order activity.
*/
-- ==============================================================================
-- BUSINESS ANALYSIS 10: CY YTD SALES BY REGION

SELECT
    st.region,
    SUM(s.net_sales_inr) AS cy_ytd_net_sales,
    SUM(s.gross_profit_inr) AS cy_ytd_gross_profit,
    ROUND(
        SUM(s.gross_profit_inr) /
        NULLIF(SUM(s.net_sales_inr), 0) * 100,
        2
    ) AS cy_ytd_gross_margin

FROM sales s

JOIN store st
    ON s.store_id = st.store_key

WHERE s.purchase_date BETWEEN '2026-01-01' AND '2026-09-15'

GROUP BY st.region

ORDER BY cy_ytd_net_sales DESC;

/*
BUSINESS FINDINGS – CY YTD SALES BY REGION

1. South generated the highest CY YTD net sales.
2. West ranked second in net sales.
3. East recorded the highest gross margin.
4. Central generated the lowest net sales.
5. Regional gross margins remained relatively consistent.

BUSINESS INTERPRETATION:
South is the leading revenue contributor,
while East achieved the highest gross margin.
*/
-- ==============================================================================
-- BUSINESS ANALYSIS 11: CY YTD PRODUCT TYPE PERFORMANCE

SELECT
    p.product_type,
    SUM(s.net_sales_inr) AS cy_ytd_net_sales,
    SUM(s.gross_profit_inr) AS cy_ytd_gross_profit,

    ROUND(
        SUM(s.gross_profit_inr) /
        NULLIF(SUM(s.net_sales_inr), 0) * 100,
        2
    ) AS cy_ytd_gross_margin,

    SUM(s.quantity - s.returned_qty) AS cy_ytd_net_units,
    COUNT(DISTINCT s.order_id) AS cy_ytd_orders

FROM sales s

JOIN products p
    ON s.product_id = p.product_key

WHERE s.purchase_date BETWEEN '2026-01-01' AND '2026-09-15'

GROUP BY p.product_type

ORDER BY cy_ytd_net_sales DESC;

/*
BUSINESS FINDINGS – CY YTD PRODUCT TYPE PERFORMANCE

1. Camping Tent generated the highest net sales.
2. Hiking Shoes ranked second in net sales.
3. Football Jersey recorded the highest gross margin.
4. Cricket Ball recorded the lowest gross margin.
5. Running Socks recorded the highest net units sold.
6. Resistance Band recorded the highest order count.

BUSINESS INTERPRETATION:
Camping Tent and Hiking Shoes are leading revenue
contributors. Football Jersey has strong profitability,
while Cricket Ball has the lowest gross margin.
*/
-- ==============================================================================



