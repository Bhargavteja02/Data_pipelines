{{ config(materialized='incremental') }}

SELECT
    invoice_no,
    customer_id AS customer_id,
    stockcode AS product_code,
    invoice_date AS order_date,
    quantity AS tot_quantity,
    unit_price AS unit_price,
    quantity * unit_price AS total_amount

FROM {{ ref('stg_retails') }}
WHERE invoice_no IS NOT NULL
  AND is_cancelled = FALSE
