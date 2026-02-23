{{config(materialized='table')}}
select 
    invoice_no,
    min(invoice_date) as order_date,
    sum(quantity) as total_items,
    sum(quantity * unit_price) as total_price
from {{ref('stg_retails')}}
group by invoice_no
