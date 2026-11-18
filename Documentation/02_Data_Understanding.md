# Project 04 – Data Understanding & Data Preparation

## 1. Data Sources Overview

The project uses three Excel source files containing retail sales, product and store information.

| Source File | Purpose |
|---|---|
| sales.xlsx | Transaction-level retail sales information |
| products.xlsx | Product master information |
| store.xlsx | Store and geographical information |

All three source files are maintained in the project's `Data/Raw` folder.

## 2. Initial Dataset Inspection

### 2.1 Sales Dataset

| Attribute | Details |
|---|---|
| Source File | sales.xlsx |
| Worksheet | sales |
| Initial Row Count | 84,000 |
| Initial Column Count | 22 |
| Data Granularity | Sales line / transaction detail |

Important identified columns:

- `Sale_Line_ID`
- `Order_ID`
- `Product_ID`
- `Store_ID`
- `Purchase_Date`

The sales dataset serves as the primary transactional dataset for analysing sales and profitability.

### 2.2 Products Dataset

| Attribute | Details |
|---|---|
| Source File | products.xlsx |
| Worksheet | products |
| Initial Row Count | 240 |
| Initial Column Count | 9 |
| Data Granularity | Product master record |

Important identified columns:

- `Product_Key`
- `Product_Name`
- `Sport`
- `Product_Type`
- `Brand_Label`

The product dataset provides descriptive information for analysing product and category performance.

### 2.3 Store Dataset

The store dataset provides geographical and operational information.

Identified columns:

- `Store_Key`
- `Store_Name`
- `City`
- `State`
- `Region`
- `Country`
- `Store_Format`
- `Floor_Area_Sqm`

The store dataset supports geographical analysis and store-level performance reporting.

*Note: Final row counts, complete column counts and validation results for this dataset will be documented after verification.*

## 3. Data Understanding Approach

The datasets are examined to understand:

1. Dataset structure and granularity.
2. Column names and business meaning.
3. Data types and formatting.
4. Potential primary and foreign keys.
5. Relationships between sales, products and stores.
6. Data quality issues requiring attention.

## 4. Data Preparation Workflow

The project follows this preparation sequence:

1. Inspect the original Excel datasets.
2. Examine column structures and data types.
3. Identify missing and duplicate records.
4. Validate key columns and relationships.
5. Identify inconsistent values and formatting issues.
6. Apply required cleaning and transformation.
7. Validate the prepared datasets before analytical use.

## 5. Technology Stack

| Tool | Purpose |
|---|---|
| Python | Data inspection, cleaning, validation and transformation |
| PostgreSQL | Database storage and SQL analysis |
| Microsoft Power BI | Data modelling, DAX and interactive dashboards |

## 6. Data Quality and Validation

The following checks are part of the project validation process:

- Missing-value checks.
- Duplicate-record checks.
- Data type validation.
- Key-column validation.
- Referential integrity checks.
- Date and numeric-value validation.
- Consistency checks across datasets.

Detailed validation results and actual transformation decisions will be documented after reviewing the completed preparation work.

## 7. Data Preparation Outcome

The objective of this phase is to produce reliable, consistent and analysis-ready datasets for PostgreSQL analysis and Power BI reporting.

The final preparation results, including actual record counts, transformation details and validation statistics, will be documented using the completed project outputs.