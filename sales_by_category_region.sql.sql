-- sales_by_category_region.sql
-- Version: add state, profit margin, and average order value
-- Source: Sample Superstore

WITH orders_agg AS (
  SELECT
    order_id,
    region,
    state,
    category,
    SUM(sales) AS order_total,
    SUM(profit) AS order_profit
  FROM sample_superstore.orders
  WHERE order_date >= '2019-01-01'
  GROUP BY order_id, region, state, category
)

SELECT
  region AS Region,
  state AS State,
  category AS Category,
  SUM(order_total) AS Total_Sales,
  SUM(order_profit) AS Total_Profit,
  COUNT(DISTINCT order_id) AS Distinct_Orders,
  ROUND(SUM(order_profit) / NULLIF(SUM(order_total),0), 4) AS Profit_Margin,
  ROUND(AVG(order_total), 2) AS Avg_Order_Value
FROM orders_agg
-- optional filter: uncomment the next line to limit categories
-- WHERE category IN ('Furniture', 'Office Supplies')
GROUP BY region, state, category
ORDER BY region, Total_Sales DESC;
