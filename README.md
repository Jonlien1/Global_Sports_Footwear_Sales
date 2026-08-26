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


<img width="1066" height="462" alt="Screen Shot 2026-08-24 at 2 34 23 PM" src="https://github.com/user-attachments/assets/328da947-e692-4d74-bd42-b4c417d07fe9" /> <img width="617" height="371" alt="Screen Shot 2026-08-24 at 5 43 49 PM" src="https://github.com/user-attachments/assets/9700d27e-85f4-403f-ad2f-fdcd937af037" />
<img width="720" height="184" alt="Screen Shot 2026-08-24 at 5 47 22 PM" src="https://github.com/user-attachments/assets/513afc6c-6002-4757-9dad-5758fe8e9d33" />


