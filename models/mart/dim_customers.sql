select
    c.customer_id,
    c.first_name,
    c.last_name,
    r.city,
    c.signup_date
from {{ ref('stg_customers') }} c
left join {{ ref('stg_regions') }} r
    on c.region_id = r.region_id