
{{ config(materialized='table') }}

select
    m.movie_id,
    m.title,
    count(r.rating) as total_ratings,
    avg(r.rating) as avg_rating
from {{ ref('dim_movies') }} m
left join {{ ref('fct_ratings') }} r
    on m.movie_id = r.movie_id
group by 1,2