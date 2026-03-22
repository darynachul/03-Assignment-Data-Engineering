{{ config(
    materialized='incremental',
    unique_key='customer_id'
) }}

select
    a.customer_id,
    sum(t.amount) as total_revenue
from {{ ref('fct_transactions') }} t
join {{ ref('stg_accounts') }} a
    on t.account_id = a.account_id
group by a.customer_id