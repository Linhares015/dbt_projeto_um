with source as (
    select
    *
    from {{ source('ecomerce','clientes') }}
)

select
*
from source