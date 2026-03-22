with source as (

    select * from {{ ref('raw_accounts') }}

)

select
    account_id,
    customer_id,
    account_type,
    cast(created_at as date) as created_at
from source