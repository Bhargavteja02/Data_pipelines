{{ config(materialized='table') }}

WITH base AS (

    SELECT
        CUSTOMER_ID,
        INVOICE_DATE,
        (UNIT_PRICE * QUANTITY) AS revenue
    FROM {{ ref('stg_retails') }}
    WHERE CUSTOMER_ID IS NOT NULL
      AND QUANTITY > 0
      AND UNIT_PRICE > 0

),

customer_agg AS (

    SELECT
        CUSTOMER_ID,
        MAX(INVOICE_DATE) AS last_purchase_date,
        COUNT(DISTINCT INVOICE_DATE) AS frequency,
        SUM(revenue) AS monetary
    FROM base
    GROUP BY CUSTOMER_ID

),

rfm AS (

    SELECT
        CUSTOMER_ID,

        -- Recency (days since last purchase)
        DATEDIFF(
            day,
            last_purchase_date,
            (SELECT MAX(INVOICE_DATE) FROM {{ ref('stg_retails') }})
        ) AS recency,

        frequency,
        monetary

    FROM customer_agg
)

SELECT * FROM rfm