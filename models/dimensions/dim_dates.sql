{{config(materialized='table')}}
select distinct
    cast(invoice_date as date) as order_date,
    day(invoice_date) as day,
    month(invoice_date) as month,
    year(invoice_date) as year,
    dayname(invoice_date) as weekday
from {{ref('stg_retails')}}
where invoice_date is not null