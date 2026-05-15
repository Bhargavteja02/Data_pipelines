{{ config(materialized='view') }}

SELECT
    invoice_no,
    stockcode AS stock_code,
    description,
    quantity,
    TRY_TO_TIMESTAMP_NTZ(invoice_date) AS invoice_date,
    unit_price,
    customer_id,
    country,
    quantity * unit_price AS total_amount,

    CASE 
        WHEN UPPER(invoice_no) LIKE 'C%' THEN TRUE
        ELSE FALSE
    END AS is_cancelled

FROM {{ source('retail_raw_tab', 'online_retail_tab') }}
WHERE customer_id IS NOT NULL