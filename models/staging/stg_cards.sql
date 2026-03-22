select
    card_id,
    account_id,
    card_type,
    is_active,
    cast(issued_date as date) as issued_date
from {{ ref('raw_cards') }}