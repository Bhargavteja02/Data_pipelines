{{config(materialized='table')}}
select
    stock_code as product_code,
    COALESCE(description, 'UNKNOWN') AS product_name,
    count(distinct invoice_no) as product_sales,
    sum(quantity) as quantity_sold,
    sum(quantity * unit_price) as revenue_per_product
from {{ref('stg_retails')}}
where is_cancelled=false
group by product_code, description
