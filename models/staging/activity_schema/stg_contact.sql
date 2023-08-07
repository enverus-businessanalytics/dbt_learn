{{
    config(materialized = 'table')
}}

select *
from {{ ref('contact')}}