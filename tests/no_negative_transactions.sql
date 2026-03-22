select *
from {{ ref('fct_transactions') }}
where transaction_type = 'credit' and amount < 0