# Sports Footwear Retail Analysis

## Overview
Analysis of a global sports footwear sales dataset, built to demonstrate business/reporting analyst skills for roles in sports apparel/footwear and food retail. The project covers the full analytics workflow: data cleaning, business question framing, dashboarding, and SQL analysis.

## Tools Used
- **Excel Online** — data cleaning, pivot tables, dashboard
- **Google Sheets** — data source bridge for Looker Studio
- **SQLite / DB Browser** — SQL queries and analysis
- **Looker Studio** — interactive dashboard

## Data Source
[Sports Footwear Sales & Consumer Behavior](https://www.kaggle.com/datasets/aliiihussain/sports-footwear-sales-and-consumer-behavior) — Kaggle dataset by aliiihussain (30,000 rows)

## Data Cleaning
- Standardized headers and formatting; converted text-stored numbers to true numeric values
- Trimmed and standardized casing across text columns (brand, category, etc.)
- Caught and corrected a brand-casing inconsistency: ASICS and PUMA are stylized in all caps, unlike other brands (Nike, Adidas, Reebok) which follow standard title case — verified via pivot table unique-value check
- Checked for duplicate Order IDs — none found
- Checked for missing values across all columns — none found
- Checked for negative and $0 values across price, revenue, and units — none found
- Verified price range ($60–$219) and units-per-order range (1–4) were realistic, with no outliers

## Business Questions & Key Findings

**1. Which brands drive the most revenue vs. units sold?**
ASICS leads on both total revenue and units sold, but Nike leads on revenue per unit ($122.15) — showing Nike commands the highest price per sale despite lower total volume. Puma ranks 4th on total revenue but 2nd on revenue per unit, revealing stronger per-unit economics than its total revenue ranking suggests.

**2. Does discount level move units, or just cut into margin?**
Units sold stayed in a tight, flat range (12,366–12,712) across all discount tiers (0–30%), showing no meaningful volume lift from discounting. Revenue per unit steadily declined as discount increased. Puma stood out: strongest revenue per unit at low discount tiers, but dropped toward the bottom of the pack at high discount tiers — suggesting more discount-sensitive customers than other brands.

**3. Does customer income level correlate with brand or price point chosen?**
No meaningful differentiation — average price paid (~$120–122) and order volume were nearly identical across all income tiers.

**4. Retail store vs. online — which drives more volume or value?**
No meaningful differentiation — revenue, average order value, and brand mix were nearly identical across both channels.

**5. Does customer rating correlate with price or discount level?**
No meaningful differentiation — average price and discount level were consistent across all rating tiers.

## Key Takeaway
**Brand identity, not customer segment, drives pricing and purchasing behavior in this dataset.** Income level, sales channel, and customer rating showed no meaningful influence on price or brand choice — but real differentiation exists at the brand level, with Nike showing premium positioning, ASICS leading on volume, and Puma showing distinct discount sensitivity.

### Excel Dashboard

<p align="center">
  <<img width="1066" height="462" alt="Dashboard_Image_01" src="https://github.com/user-attachments/assets/3078fc77-151e-44d6-9433-0c7357a6af59" />>
  <em>Title, KPI cards, and brand comparison charts</em>
</p>

<p align="center">
  <<img width="617" height="371" alt="Dashboard_Image_02" src="https://github.com/user-attachments/assets/88168c5b-8973-413e-9da6-20440e31a5e9" />><br>
  <em>Discount vs. revenue trend</em>
</p>

<p align="center">
  <<img width="720" height="184" alt="Dashboard_Image_03" src="https://github.com/user-attachments/assets/16d63f38-a739-4c8b-b102-211ac2ee6379" />><br>
  <em>Segment consistency summary</em>
</p>
    
### Looker Studio Dashboard
[View live dashboard](https://datastudio.google.com/reporting/11e25417-b3dd-40de-8d1a-10d91a2d6c12/page/8r75F)

**Page 1 — Brand Overview**
![Looker Page 1] <img width="1185" height="650" alt="looker-page1-brand-overview" src="https://github.com/user-attachments/assets/0e46c939-2649-4229-a66d-99358f74b2f7" />

**Page 2 — Discount & Segment Analysis**
![Looker Page 2] <img width="1193" height="882" alt="looker-page2-discount-segments" src="https://github.com/user-attachments/assets/4cdbe840-8cf7-4374-a3b6-3828dc3dfe97" />

## SQL Analysis
Full queries: [queries.sql](./queries.sql)

Includes 5 core queries mapped to each business question above, plus a bonus query using a **CTE and window functions (`RANK()`)** to rank brands by total revenue and revenue-per-unit side by side — directly surfacing the Nike/ASICS positioning mismatch found in Question 1.

**Data note:** price and revenue columns were imported from CSV with embedded currency symbols (e.g., `"$245.50"`), which caused aggregate functions to silently return 0. Diagnosed using `typeof()` and `hex()`, then resolved with `REPLACE()` + `CAST()` before analysis.

## Limitations & Next Steps
- Country-level analysis (6 countries in the dataset) was not a core focus but could be a natural extension of this project
- Future iterations could incorporate time-based trend analysis using `order_date`, which wasn't part of the current business questions
