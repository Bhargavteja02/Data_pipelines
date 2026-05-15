{{ config(materialized='table') }}

select
    user_id,
    movie_id,
    rating,
    rated_at
from {{ ref('stg_ratings') }}