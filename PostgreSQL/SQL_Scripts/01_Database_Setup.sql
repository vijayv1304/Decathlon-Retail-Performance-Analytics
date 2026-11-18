-- =====================================================
-- PROJECT: DECATHLON RETAIL PERFORMANCE ANALYTICS
-- PHASE: POSTGRESQL DATABASE SETUP
-- DATABASE: decathlon_retail_analytics
-- =====================================================

-- 1. Create Products table

CREATE TABLE products (
    product_key VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(150),
    sport VARCHAR(50),
    product_type VARCHAR(100),
    brand_label VARCHAR(50),
    product_tier VARCHAR(30),
    colour VARCHAR(30),
    base_list_price_inr NUMERIC(12,2),
    base_unit_cost_inr NUMERIC(12,2)
);

-- 2. Create Store table

CREATE TABLE store (
    store_key VARCHAR(10) PRIMARY KEY,
    store_name VARCHAR(150),
    city VARCHAR(100),
    state VARCHAR(100),
    region VARCHAR(50),
    country VARCHAR(50),
    store_format VARCHAR(50),
    floor_area_sqm INTEGER
);

-- 3. Create Sales table

CREATE TABLE sales (
    sale_line_id VARCHAR(20) PRIMARY KEY,
    order_id VARCHAR(20),
    purchase_date DATE,
    product_id VARCHAR(10) REFERENCES products(product_key),
    store_id VARCHAR(10) REFERENCES store(store_key),
    channel VARCHAR(30),
    payment_method VARCHAR(50),
    order_hour INTEGER,
    promotion VARCHAR(50),
    quantity INTEGER,
    unit_list_price_inr NUMERIC(12,2),
    unit_cost_inr NUMERIC(12,2),
    discount_pct NUMERIC(5,4),
    gross_sales_inr NUMERIC(14,2),
    discount_inr NUMERIC(14,2),
    sales_before_returns_inr NUMERIC(14,2),
    returned_qty INTEGER,
    refund_inr NUMERIC(14,2),
    net_sales_inr NUMERIC(14,2),
    net_cogs_inr NUMERIC(14,2),
    gross_profit_inr NUMERIC(14,2),
    return_reason VARCHAR(100)
);