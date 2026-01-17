-- =====================================================
-- Retail Sales Analysis Project
-- Author: Nitin Baghel
-- Role: Data Analyst (SQL Project)
-- Database: company_v
-- Table Used: retail_sales
-- =====================================================

/*
BUSINESS PROBLEM:
Analyze retail sales data to understand:
- Revenue trends
- Store performance
- Customer behavior
- High & low performing days
*/

-- =====================================================
-- 1. Total Revenue by Store Type
-- =====================================================
SELECT
    store_type,
    SUM(total_amount) AS total_revenue,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY store_type
ORDER BY total_revenue DESC;

-- =====================================================
-- 2. Average Bill Value by Store Type
-- =====================================================
SELECT
    store_type,
    SUM(total_amount) / COUNT(*) AS avg_bill_value
FROM retail_sales
GROUP BY store_type
ORDER BY avg_bill_value DESC;

-- =====================================================
-- 3. Daily Revenue Trend
-- =====================================================
SELECT
    visit_date,
    SUM(total_amount) AS daily_revenue
FROM retail_sales
GROUP BY visit_date
ORDER BY visit_date;

-- =====================================================
-- 4. Highest Revenue Day
-- =====================================================
SELECT
    visit_date,
    SUM(total_amount) AS daily_revenue
FROM retail_sales
GROUP BY visit_date
ORDER BY daily_revenue DESC
LIMIT 1;

-- =====================================================
-- 5. Top 5 Customers by Lifetime Value
-- =====================================================
SELECT
    customer_name,
    SUM(total_amount) AS lifetime_value
FROM retail_sales
GROUP BY customer_name
ORDER BY lifetime_value DESC
LIMIT 5;

-- =====================================================
-- 6. Customer Visit Frequency
-- =====================================================
SELECT
    customer_name,
    COUNT(*) AS total_visits
FROM retail_sales
GROUP BY customer_name
ORDER BY total_visits DESC;

-- =====================================================
-- END OF PROJECT
-- =====================================================
/*
=================================================
KEY INSIGHTS SUMMARY
=================================================
1. Mall stores generated the highest total revenue.
2. Top 5 customers contribute a significant portion of overall sales.
3. Certain dates show revenue spikes, indicating high footfall days.
4. Average bill value varies across different store types.

=================================================
BUSINESS RECOMMENDATIONS
=================================================
- Focus marketing efforts on high-performing store types.
- Introduce loyalty programs for top customers.
- Optimize staffing and inventory on peak sales days.
- Improve strategies for low-performing store types.
*/
