{{
    config(materialized = 'table')
}}

select *
from {{ ref('subscription')}}