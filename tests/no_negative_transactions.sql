select * from {{ ref('fct_transactions') }}
where transaction_type = 'debit' and amount < 0