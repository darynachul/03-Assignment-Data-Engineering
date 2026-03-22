with source as (

    select * from {{ ref('raw_transactions') }}

)

select
    transaction_id,
    account_id,
    amount,
    case 
        when amount > 0 then 'credit'
        else 'debit'
    end as transaction_type,
    cast(transaction_date as date) as transaction_date,
    merchant_id
from source