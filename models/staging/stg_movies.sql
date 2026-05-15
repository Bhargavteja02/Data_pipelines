{{ config(materialized='view') }}

select
    movieid as movie_id,
    title,
    genres
from {{ source('movielens_raw', 'movies') }}