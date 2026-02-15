-- ================================================
-- Retail Store Sales Intelligence & Customer Analysis
-- Author: Nitin Baghel
-- ================================================


-- 1. Total Records
SELECT COUNT(*) AS total_transactions
FROM retail_store_sales_clean;


-- 2. Total Revenue
SELECT SUM(total_spent) AS total_revenue
FROM retail_store_sales_clean;


-- 3. Monthly Revenue Trend
SELECT 
    year,
    month,
    SUM(total_spent) AS monthly_revenue
FROM retail_store_sales_clean
GROUP BY year, month
ORDER BY year, month;


-- 4. Running Revenue (Cumulative)
SELECT 
    year,
    month,
    SUM(total_spent) AS monthly_revenue,
    SUM(SUM(total_spent)) OVER (ORDER BY year, month) AS running_total
FROM retail_store_sales_clean
GROUP BY year, month
ORDER BY year, month;


-- 5. Revenue by Category
SELECT 
    category,
    SUM(total_spent) AS revenue
FROM retail_store_sales_clean
GROUP BY category
ORDER BY revenue DESC;


-- 6. Top 3 Revenue Contributing Categories (Pareto Style)
SELECT 
    category,
    SUM(total_spent) AS revenue,
    ROUND(
        SUM(total_spent) /
        (SELECT SUM(total_spent) FROM retail_store_sales_clean) * 100,
        2
    ) AS contribution_percent
FROM retail_store_sales_clean
GROUP BY category
ORDER BY revenue DESC
LIMIT 3;


-- 7. Customer Lifetime Value (Top 5 Customers)
SELECT 
    customer_id,
    SUM(total_spent) AS lifetime_value
FROM retail_store_sales_clean
GROUP BY customer_id
ORDER BY lifetime_value DESC
LIMIT 5;


-- 8. Customer Segmentation (Gold / Silver / Bronze)
SELECT 
    customer_id,
    SUM(total_spent) AS lifetime_value,
    CASE 
        WHEN SUM(total_spent) >= 62000 THEN 'Gold'
        WHEN SUM(total_spent) >= 58000 THEN 'Silver'
        ELSE 'Bronze'
    END AS customer_segment
FROM retail_store_sales_clean
GROUP BY customer_id
ORDER BY lifetime_value DESC;


-- 9. Revenue by Discount Usage
SELECT 
    discount_applied,
    SUM(total_spent) AS revenue,
    COUNT(*) AS total_orders
FROM retail_store_sales_clean
GROUP BY discount_applied;


-- 10. Yearly Revenue
SELECT 
    year,
    SUM(total_spent) AS yearly_revenue
FROM retail_store_sales_clean
GROUP BY year
ORDER BY year;


-- 11. Average Order Value by Year
SELECT 
    year,
    ROUND(SUM(total_spent) / COUNT(*), 2) AS avg_order_value
FROM retail_store_sales_clean
GROUP BY year
ORDER BY year;
