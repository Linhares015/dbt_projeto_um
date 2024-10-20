with source as (
    select
    *
    from {{ source('ecomerce','categorias') }}
)

select
*
from source