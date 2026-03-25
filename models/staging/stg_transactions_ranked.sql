select
    *,
    row_number() over (
        partition by account_id
        order by transaction_date desc
    ) as transaction_rank
from {{ ref('stg_transactions') }}