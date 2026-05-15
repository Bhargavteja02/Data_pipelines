{{ config(materialized='view') }}

select
    tagid as tag_id,
    tag
from {{ source('movielens_raw', 'genome_tags') }}