with source as (
    select
    *
    from {{ source('ecomerce','carrinho') }}
)

select
*
from source