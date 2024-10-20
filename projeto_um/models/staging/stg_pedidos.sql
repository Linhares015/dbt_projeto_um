with source as (
    select
    *
    from {{ source('ecomerce','pedidos') }}
)

select
*
from source