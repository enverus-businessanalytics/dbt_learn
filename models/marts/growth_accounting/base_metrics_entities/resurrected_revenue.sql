{{-
    config(materialized = 'view')
-}}

select 
    date_trunc('month', started_at) as month, 
    sum(si.mrr_value) as new_revenue
from
    {{ ref('stg_subscription') }} s
    join {{ ref('stg_subscription_item') }} si 
        on s.id = si.subscription_id
where
    s.status = 'active'
    and s.type = 'resurrected'
group by 1