select
    loan_id,
    customer_id,
    loan_amount,
    loan_status,
    cast(start_date as date) as start_date
from {{ ref('raw_loans') }}
where loan_id is not null