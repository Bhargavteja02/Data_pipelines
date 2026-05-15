{{config(materialized='table')}}
select 
    customer_id,
    min(country) as country,
    min(invoice_date) as first_order_date,
    max(invoice_date) as last_order_date,
    sum(distinct invoice_no) as total_orders,
    sum(quantity * unit_price) as lifetime_value
from {{ref('stg_retails')}}
where customer_id is  not null 
and is_cancelled = False
group by customer_id