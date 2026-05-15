{{config(materialized='table')}}
select 
    customer_id,
    sum(quantity) as total_purchase,
    sum(unit_price) as total_revenue,
    min(invoice_date) as first_order,
    max(invoice_date) as last_order
from {{ref('stg_retails')}}
group by customer_id
