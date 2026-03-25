select
    region_id,
    region_name as city,
    country
from {{ ref('raw_regions') }}
where region_id is not null