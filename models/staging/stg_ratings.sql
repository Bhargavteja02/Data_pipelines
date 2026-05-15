{{ config(materialized='view') }}

select
    userid as user_id,
    movieid as movie_id,
    rating,
    to_timestamp_ntz(timestamp) as rated_at
from {{ source('movielens_raw', 'ratings') }}