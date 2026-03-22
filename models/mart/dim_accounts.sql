select
    {{ surrogate_key(['account_id','customer_id']) }} as account_sk,
    account_id,
    customer_id,
    account_type
from {{ ref('stg_accounts') }}