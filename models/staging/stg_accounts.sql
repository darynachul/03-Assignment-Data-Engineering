select
    account_id,
    customer_id,
    account_type,
    cast(created_at as date) as created_date
from {{ ref('raw_accounts') }}
where account_id is not null