with source as (

    select * from {{ ref('raw_customers') }}

),

cleaned as (

    select
        customer_id,
        first_name,
        last_name,
        cast(signup_date as date) as signup_date,
        region_id

    from source

)

select * from cleaned