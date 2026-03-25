-- Revenue by region
select
    c.city,
    round(sum(r.total_revenue),2) as total_revenue
from {{ ref('fct_customer_revenue') }} r
join {{ ref('dim_customers') }} c
    on r.customer_id = c.customer_id
group by c.city
order by total_revenue desc;

-- Top 10 customers by revenue
select
    r.customer_id,
    c.first_name,
    c.last_name,
    round(r.total_revenue, 2) as total_revenue
from {{ ref('fct_customer_revenue') }} r
join {{ ref('dim_customers') }} c
    on r.customer_id = c.customer_id
order by total_revenue desc
limit 10;

-- Customer transaction frequency
select
    c.first_name,
    c.last_name,
    count(*) as transaction_count
from {{ ref('fct_transactions') }} t
join {{ ref('stg_accounts') }} a
    on t.account_id = a.account_id
join {{ ref('stg_customers') }} c
    on a.customer_id = c.customer_id
group by
    c.first_name,
    c.last_name,
    a.customer_id
order by transaction_count desc;

-- Top regions by number of customers
select
    city,
    count(*) as customers_count
from {{ ref('dim_customers') }}
group by city
order by customers_count desc;

-- Volume by Transaction Type
select
    t.transaction_type,
    count(*) as transaction_count,
    sum(t.amount) as total_volume,
    round(avg(t.amount), 2) as avg_transaction_amount
from {{ ref('fct_transactions') }} t
group by t.transaction_type
order by total_volume desc;