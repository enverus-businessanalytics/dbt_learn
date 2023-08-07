{{-
    config(materialized = 'view')
-}}

select 
    date_trunc('month', canceled_at) as month, 
    sum(si.mrr_value) as new_revenue
from
    {{ ref('stg_subscription') }} s
    join {{ ref('stg_subscription_item') }} si 
        on s.id = si.subscription_id
where
    s.status = 'canceled'
group by 1