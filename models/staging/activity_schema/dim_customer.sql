{{
    config(materialized = 'table')
}}

select *, substring(date_trunc('month', first_contract_signed_date)::text, 1, 7) as cohort
from {{ ref('src_dim_customer')}}