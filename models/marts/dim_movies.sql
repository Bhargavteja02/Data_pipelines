{{ config(materialized='table') }}

select
    m.movie_id,
    m.title,
    m.genres,
    l.imdbid,
    l.tmdbid
from {{ ref('stg_movies') }} m
left join {{ ref('stg_links') }} l
    on m.movie_id = l.movie_id