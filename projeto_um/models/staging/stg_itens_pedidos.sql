with source as (
    select
    *
    from {{ source('ecomerce','itens_pedidos') }}
)

select
*
from source