{{ config(
    materialized='incremental',
    unique_key='loan_id'
) }}

select * from {{ ref('stg_loans') }}

{% if is_incremental() %}
where start_date > (select max(start_date) from {{ this }})
{% endif %}