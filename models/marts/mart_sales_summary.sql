{{ config(materialized='table') }}

SELECT 
    CAST(invoice_date AS DATE) AS order_date,

    SUM(quantity * unit_price) AS total_revenue,

    COUNT(DISTINCT invoice_no) AS total_orders,

    SUM(quantity * unit_price)
    / NULLIF(COUNT(DISTINCT invoice_no), 0) AS avg_order_value,

    COUNT(DISTINCT customer_id) AS total_customers

FROM {{ ref('stg_retails') }}

WHERE customer_id IS NOT NULL 
  AND is_cancelled = FALSE

GROUP BY CAST(invoice_date AS DATE)
