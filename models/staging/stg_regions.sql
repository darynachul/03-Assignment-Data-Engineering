select
    region_id,
    region_name,
    country
from {{ ref('raw_regions') }}