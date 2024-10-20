with source as (
    select
    *
    from {{ source('ecomerce','produtos') }}
)

select
*
from source