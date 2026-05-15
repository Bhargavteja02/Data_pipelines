{{ config(materialized='view') }}

select
    movieid as movie_id,
    tagid as tag_id,
    relevance
from {{ source('movielens_raw', 'genome_scores') }}