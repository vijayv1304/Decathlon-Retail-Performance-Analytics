# Project 04 – Power BI Dashboard Documentation

## 1. Dashboard Overview

The Decathlon Retail Performance Analytics solution contains three main interactive dashboards and one hidden report-page tooltip.

| Report Page | Purpose |
|---|---|
| Executive Overview | High-level retail business performance |
| Sales Performance | Detailed sales trends and business drivers |
| Detailed Analysis | Region-based drill-through analysis |
| Product Performance Tooltip | Context-sensitive product performance information |

## 2. Executive Overview

**Screenshot:** `Executive_Overview`

### Business Purpose

Provides senior management with a consolidated view of overall retail performance, sales growth, profitability and business contribution.

### KPI Cards

1. Net Sales
2. Net Sales YoY Growth %
3. Gross Profit
4. Gross Margin %
5. Net Units Sold
6. Total Orders

### Visualizations

- Monthly Net Sales Trend – tracks monthly revenue performance.
- Net Sales by Sport – compares revenue across sports.
- Product Type Performance – evaluates product performance using a scatter chart.
- Regional Sales Performance – compares sales across geographical regions.
- Brand Sales Contribution – displays brand-level revenue contribution.

### Interactive Features

- State, Sport, Product Tier, Store and Payment Method slicers.
- Reset Filters bookmark.
- Dynamic reporting period.
- Conditional YoY growth indicators.
- Page navigation.

## 3. Sales Performance

**Screenshot:** `Sales_Performance`

### Business Purpose

Provides deeper insight into sales trends, growth patterns, product contribution and payment-method performance.

### KPI Cards

1. Net Sales
2. Sales Growth %
3. Gross Profit
4. Gross Margin %
5. Units Sold
6. Total Orders

### Visualizations

- Sales by Payment Method – compares revenue across payment methods.
- Sales by Quarter – evaluates quarterly sales trends.
- Sales by Product Type – identifies product-type sales contribution.
- Regional Gross Profit Performance – compares gross profit across regions.
- Net Sales by Product Tier – displays sales contribution by product tier.

### Interactive Features

- State, Sport, Product Tier, Store and Payment Method slicers.
- Reset Filters bookmark.
- Dynamic reporting period.
- Conditional YoY indicators.
- Page navigation.
- Regional drill-through entry point.

## 4. Detailed Analysis

**Screenshot:** `DrillThrough_Detailed_Analysis`

### Business Purpose

Allows users to investigate regional business performance and understand which products contribute to sales and profitability within a selected region.

### KPI Cards

1. Net Sales
2. Gross Profit
3. Gross Margin %
4. Units Sold
5. Total Orders

### Visualizations

- Monthly Net Sales Trend – monitors regional revenue over time.
- Top 10 Product Types by Gross Profit – identifies the leading product types by profit.
- Net Sales by Product Tier – compares revenue contribution across tiers.
- Regional Product Performance – provides product-level sales and profitability details.

### Interactive Features

- Region-based drill-through.
- Dynamic selected Region context.
- State, Sport, Product Tier, Product Type, Payment Method and Year slicers.
- Reset Filters bookmark that preserves the selected Region.
- Back navigation to the source dashboard.
- Dynamic reporting period.

## 5. Product Performance Tooltip

**Screenshot:** `Executive_Overview_Tootip`

### Business Purpose

Provides additional product performance information when users hover over supported product visuals.

### Information Displayed

- Net Sales
- Gross Profit
- Gross Margin %
- Sales by Product Type chart

### Interactive Behaviour

The tooltip receives the context of the hovered data point and displays the corresponding filtered performance information.

## 6. Dashboard Design Standards

The report follows a consistent dark navy and electric blue visual theme.

| Design Element | Colour |
|---|---|
| Main Canvas | #061A33 |
| KPI and Chart Background | #0B2545 |
| Primary Blue | #0878D1 |
| Electric Blue Border | #168BFF |
| Cyan Accent | #38BDF8 |
| Secondary Text | #9CCBFF |
| Primary Text | #FFFFFF |

### Design Principles

- Consistent typography and spacing.
- Clear KPI hierarchy.
- Consistent visual formatting.
- Readable chart labels.
- Interactive navigation.
- Minimal visual clutter.
- Consistent dashboard styling.

## 7. Report-Level Interactivity

The report provides:

1. Cross-filtering through slicers and visual interactions.
2. Bookmark-based filter reset.
3. Regional drill-through.
4. Back navigation.
5. Context-sensitive report-page tooltips.
6. Dynamic reporting-period display.
7. Conditional KPI indicators.
8. Page navigation between the main dashboards.

## 8. Dashboard Validation

The following functionality was tested:

- KPI values and dynamic indicators.
- Slicer interactions.
- Chart filtering.
- Bookmark reset behaviour.
- Region drill-through.
- Back navigation.
- Custom report tooltip.
- Reporting-period updates.
- Main page navigation.

All these features were verified during dashboard development.

## 9. Final Outcome

The completed Power BI report provides an integrated view of Decathlon retail performance across sales, profitability, products and regions.

It enables stakeholders to monitor key business indicators, investigate performance differences and explore detailed information through interactive reporting features.