select
    payment_id,
    loan_id,
    payment_amount,
    cast(payment_date as date) as payment_date,
    status
from {{ ref('raw_payments') }}