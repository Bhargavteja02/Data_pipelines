{{ config(materialized='view') }}

select
    movieid as movie_id,
    imdbid,
    tmdbid
from {{ source('movielens_raw', 'links') }}