select
    transaction_date,
    amount,

    sum(amount) over (
        order by transaction_date
    ) as running_total

from {{ ref('fct_transactions') }}