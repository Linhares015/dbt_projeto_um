with source as (
    select
    *
    from {{ source('ecomerce','pagamentos') }}
)

select
*
from source