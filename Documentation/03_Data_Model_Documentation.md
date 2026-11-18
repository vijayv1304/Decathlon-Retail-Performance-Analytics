# Project 04 – Data Model Documentation

## 1. Overview

The Decathlon Retail Performance Analytics project uses a dimensional data model in Power BI to support sales, product, store and time-based analysis.

The model is designed around a central sales fact table supported by descriptive dimension tables.

## 2. Data Model Architecture

The model contains the following tables:

| Table | Model Role | Purpose |
|---|---|---|
| sales | Fact Table | Stores retail sales transactions |
| products | Dimension Table | Provides product attributes |
| store | Dimension Table | Provides store and geographical attributes |
| Dim_Date | Date Dimension | Supports calendar-based analysis |

### 2.1 Fact Table – sales

The `sales` table is the central transactional table.

Important columns include:

- Sale_Line_ID
- Order_ID
- Product_ID
- Store_ID
- Purchase_Date

It supports calculations involving sales, gross profit, units sold and orders.

### 2.2 Product Dimension – products

The `products` table provides descriptive product information.

Important attributes include:

- Product_Key
- Product_Name
- Sport
- Product_Type
- Brand_Label

It enables product-level and category-level performance analysis.

### 2.3 Store Dimension – store

The `store` table contains store and geographical information.

Important attributes include:

- Store_Key
- Store_Name
- City
- State
- Region
- Country
- Store_Format
- Floor_Area_Sqm

It supports regional, state and store-level reporting.

### 2.4 Date Dimension – Dim_Date

The `Dim_Date` table provides calendar attributes for time-based reporting.

It supports:
- Monthly sales trends.
- Quarterly sales analysis.
- Year-based filtering.
- Year-over-year comparisons.
- Dynamic reporting-period selection.

The exact date columns and relationship configuration should be recorded after model verification.

## 3. Confirmed Relationship

The following relationship was established in the Power BI model:

| One Side | Many Side | Cardinality | Filter Direction |
|---|---|---|---|
| store[Store_Key] | sales[Store_ID] | One-to-many (1:*) | Single: store → sales |

This relationship enables store and regional attributes to filter sales transactions.

## 4. Relationship Verification

The remaining relationships must be verified against the actual Power BI Model view before their configuration is documented:

- sales ↔ products
- sales ↔ Dim_Date

For each relationship, verify:
- Primary and foreign key columns.
- Cardinality.
- Cross-filter direction.
- Active or inactive status.

Do not assume a relationship configuration without checking the model.

## 5. Model Design Benefits

The dimensional model supports:

1. Centralized sales analysis.
2. Product and category comparisons.
3. Regional and store-level reporting.
4. Calendar-based trend analysis.
5. Consistent filtering across dashboard visuals.
6. Reusable DAX measures.
7. Interactive drill-through analysis.

## 6. Power BI Model Validation

The model should be validated for:

- Correct key-column mapping.
- Referential integrity.
- Appropriate relationship cardinality.
- Correct filter propagation.
- Active date relationship.
- Absence of unintended ambiguous filter paths.

## 7. Final Model Documentation Status

The central sales fact table and dimension tables have been identified. The store-to-sales relationship is confirmed.

The remaining relationship details will be added after verifying the Power BI Model view.