{{
    config(materialized = 'table')
}}

select *
from {{ ref('customer')}}