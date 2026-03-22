select
    merchant_id,
    merchant_name,
    category,
    region_id
from {{ ref('raw_merchants') }}