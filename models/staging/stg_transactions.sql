with source as (
    select * from {{ ref('raw_transactions') }}
)
select
    transaction_id,
    account_id,
    amount,
    {{ transaction_type('amount') }} as transaction_type,
    cast(transaction_date as date) as transaction_date,
    merchant_id
from source
where transaction_id is not null