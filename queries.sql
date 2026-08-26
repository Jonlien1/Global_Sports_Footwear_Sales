-- Sports Footwear Retail Analysis\
-- SQL Queries (SQLite / DB Browser)\
-- ============================================\
\
-- Note: base_price_usd, final_price_usd, and revenue_usd were imported\
-- from CSV as text with embedded "$" symbols. Cleaned and cast to REAL\
-- before running the queries below:\
-- UPDATE footwear_sales SET revenue_usd = CAST(REPLACE(revenue_usd, '$', '') AS REAL);\
-- (repeated for base_price_usd, final_price_usd)\
\
\
-- --------------------------------------------\
-- Q1: Which brands drive the most revenue vs. units sold?\
-- Also calculates revenue per unit to reveal premium vs. volume positioning.\
-- --------------------------------------------\
SELECT brand,\
       SUM(revenue_usd) AS total_revenue,\
       SUM(units_sold) AS total_units,\
       SUM(revenue_usd) / SUM(units_sold) AS revenue_per_unit\
FROM footwear_sales\
GROUP BY brand\
ORDER BY revenue_per_unit DESC;\
\
\
-- --------------------------------------------\
-- Q2: Does discount level actually move units sold, or just cut into margin?\
-- AVG(final_price_usd) shows typical price paid at each discount tier;\
-- SUM(units_sold) shows total volume moved at each tier.\
-- --------------------------------------------\
SELECT discount_percent,\
       AVG(final_price_usd) AS avg_price_paid,\
       SUM(units_sold) AS total_units\
FROM footwear_sales\
GROUP BY discount_percent\
ORDER BY discount_percent ASC;\
\
\
-- --------------------------------------------\
-- Q3: Does customer income level correlate with brand or price point chosen?\
-- AVG(final_price_usd) shows typical spend per income tier;\
-- COUNT(order_id) shows order volume/distribution across tiers.\
-- --------------------------------------------\
SELECT customer_income_level,\
       AVG(final_price_usd) AS avg_price_paid,\
       COUNT(order_id) AS order_count\
FROM footwear_sales\
GROUP BY customer_income_level;\
\
\
-- --------------------------------------------\
-- Q4: Retail store vs. online \'97 which drives more volume, revenue,\
-- or higher order value?\
-- SUM(revenue_usd) shows total revenue by channel;\
-- AVG(final_price_usd) shows typical order value by channel.\
-- --------------------------------------------\
SELECT sales_channel,\
       SUM(revenue_usd) AS total_revenue,\
       AVG(final_price_usd) AS avg_order_value\
FROM footwear_sales\
GROUP BY sales_channel;\
\
\
-- --------------------------------------------\
-- Q5: Does customer rating correlate with price or discount level?\
-- --------------------------------------------\
SELECT customer_rating,\
       AVG(final_price_usd) AS avg_price_paid,\
       AVG(discount_percent) AS avg_discount\
FROM footwear_sales\
GROUP BY customer_rating\
ORDER BY customer_rating;\
\
\
-- --------------------------------------------\
-- Bonus: CTE + Window Function\
-- Ranks brands by total revenue vs. revenue per unit side by side,\
-- surfacing the mismatch between volume leaders (e.g. ASICS) and\
-- premium-positioned brands (e.g. Nike).\
-- --------------------------------------------\
WITH brand_summary AS (\
    SELECT brand,\
           SUM(revenue_usd) AS total_revenue,\
           SUM(units_sold) AS total_units,\
           SUM(revenue_usd) / SUM(units_sold) AS revenue_per_unit\
    FROM footwear_sales\
    GROUP BY brand\
)\
SELECT brand,\
       total_revenue,\
       total_units,\
       revenue_per_unit,\
       RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank,\
       RANK() OVER (ORDER BY revenue_per_unit DESC) AS revenue_per_unit_rank\
FROM brand_summary\
ORDER BY revenue_rank;}
