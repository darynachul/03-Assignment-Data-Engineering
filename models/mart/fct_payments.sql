{{ config(
    materialized='incremental',
    unique_key='payment_id'
) }}

select * from {{ ref('stg_payments') }}

{% if is_incremental() %}
where payment_date >= current_date - interval '7 days'
{% endif %}