-- ================================================
-- Retail Store Sales Intelligence & Customer Analysis
-- Author: Nitin Baghel
-- ================================================


-- 1. Total Records
select count(*) as total_transactions
from retail_store_sales_clean;


-- 2. Total Revenue
select SUM(total_spent) as total_revenue
from retail_store_sales_clean;


-- 3. Monthly Revenue Trend
select 
    year,
    month,
    sum(total_spent) as monthly_revenue
FROM retail_store_sales_clean
group by year, month
order by year, month;


-- 4. Running Revenue (Cumulative)
select 
    year,
    month,
    sum(total_spent) as monthly_revenue,
    sum(sum(total_spent)) over(order by year, month) as running_total
from retail_store_sales_clean
group by year, month
order by year, month;


-- 5. Revenue by Category
select 
    category,
    sum(total_spent) as revenue
from retail_store_sales_clean
group by category
order by revenue desc;


-- 6. Top 3 Revenue Contributing Categories (Pareto Style)
select 
    category,
    SUM(total_spent) as revenue,
    round(
        sum(total_spent) /
        (select sum(total_spent) from retail_store_sales_clean) * 100,
        2
    ) as contribution_percent
from retail_store_sales_clean
group by category
order by revenue desc
limit 3;


-- 7. Customer Lifetime Value (Top 5 Customers)
select 
    customer_id,
    sum(total_spent) as lifetime_value
from retail_store_sales_clean
group by customer_id
order by lifetime_value desc
limit 5;


-- 8. Customer Segmentation (Gold / Silver / Bronze)
select 
    customer_id,
    sum(total_spent) as lifetime_value,
    case 
        when sum(total_spent) >= 62000 then 'Gold'
        when sum(total_spent) >= 58000 then 'Silver'
        else 'Bronze'
    end as customer_segment
from retail_store_sales_clean
group by customer_id
order by lifetime_value desc;


-- 9. Revenue by Discount Usage
select 
    discount_applied,
    sum(total_spent) as revenue,
    count(*) as total_orders
from retail_store_sales_clean
group by discount_applied;


-- 10. Yearly Revenue
select 
    year,
    sum(total_spent) as yearly_revenue
from retail_store_sales_clean
group by year
order by year;


-- 11. Average Order Value by Year
select 
    year,
    roung(sum(total_spent) / count(*), 2) as avg_order_value
from retail_store_sales_clean
group by year
order by year;
