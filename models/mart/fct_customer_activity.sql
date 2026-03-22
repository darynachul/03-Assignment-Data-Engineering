{{ config(
    materialized='incremental',
    unique_key='customer_id'
) }}

select
    a.customer_id,
    max(t.transaction_date) as last_activity_date
from {{ ref('fct_transactions') }} t
join {{ ref('stg_accounts') }} a
    on t.account_id = a.account_id
group by a.customer_id