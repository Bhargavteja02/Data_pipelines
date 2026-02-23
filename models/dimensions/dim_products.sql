{{config(materialized='table')}}
select 
    stockcode,
    min(description) as description,
    sum(quantity) as total_units_sold,
    sum(unit_price) as total_revenue
from {{ref('stg_retails')}}
where customer_id is not null
and is_cancelled = false 
group by stockcode
