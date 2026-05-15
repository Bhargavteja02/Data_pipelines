{{ config(materialized='view') }}

select
    userid as user_id,
    movieid as movie_id,
    tag,
    to_timestamp_ntz(timestamp) as tagged_at
from {{ source('movielens_raw', 'tags') }}