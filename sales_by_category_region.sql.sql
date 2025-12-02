-- sales_by_category_region.sql
-- Initial version: aggregate sales and profit by Category and Region
-- Source: Sample Superstore

SELECT
  region AS Region,
  category AS Category,
  SUM(sales) AS Total_Sales,
  SUM(profit) AS Total_Profit,
  COUNT(DISTINCT order_id) AS Distinct_Orders,
  AVG(sales) AS Avg_Sale
FROM sample_superstore.orders
WHERE order_date >= '2019-01-01'   -- analyze from 2019 onwards
GROUP BY region, category
ORDER BY region, Total_Sales DESC;
