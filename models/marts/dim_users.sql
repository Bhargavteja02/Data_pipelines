{{ config(materialized='table') }}

select distinct
    user_id
from {{ ref('stg_ratings') }}