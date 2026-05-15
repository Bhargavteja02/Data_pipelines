{{ config(materialized='table') }}

SELECT
    product_code,
    product_name,

    SUM(quantity_sold) AS total_quantity_sold,
    SUM(revenue_per_product) AS total_revenue,

    RANK() OVER (
        ORDER BY SUM(revenue_per_product) DESC
    ) AS revenue_rank

FROM {{ ref('int_products') }}

GROUP BY
    product_code,
    product_name
