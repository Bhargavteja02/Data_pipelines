{{ config(materialized='table') }}

SELECT
    COUNTRY,
    SUM(UNIT_PRICE * QUANTITY) AS TOT_SALES
FROM {{ ref('stg_retails') }}
GROUP BY COUNTRY
ORDER BY TOT_SALES DESC