-- =====================================================
-- PROJECT: DECATHLON RETAIL PERFORMANCE ANALYTICS
-- PHASE: DATA IMPORT AND VALIDATION
-- DATABASE: decathlon_retail_analytics
-- =====================================================

-- 1. Verify imported record counts

SELECT 'sales' AS table_name, COUNT(*) AS total_records
FROM sales

UNION ALL

SELECT 'products', COUNT(*)
FROM products

UNION ALL

SELECT 'store', COUNT(*)
FROM store;


-- 2. Verify Sales-to-Products relationship

SELECT COUNT(*) AS unmatched_products
FROM sales sa
LEFT JOIN products p
    ON sa.product_id = p.product_key
WHERE p.product_key IS NULL;


-- 3. Verify Sales-to-Store relationship

SELECT COUNT(*) AS unmatched_stores
FROM sales sa
LEFT JOIN store st
    ON sa.store_id = st.store_key
WHERE st.store_key IS NULL;


-- 4. Verify total relationship matches

SELECT
    COUNT(*) AS total_sales_lines,
    COUNT(p.product_key) AS matched_products,
    COUNT(st.store_key) AS matched_stores
FROM sales sa
LEFT JOIN products p
    ON sa.product_id = p.product_key
LEFT JOIN store st
    ON sa.store_id = st.store_key;