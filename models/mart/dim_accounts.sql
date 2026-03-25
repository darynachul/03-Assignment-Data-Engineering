select
    account_id,
    customer_id,
    account_type
from {{ ref('stg_accounts') }}