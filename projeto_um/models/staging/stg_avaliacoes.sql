with source as (
    select
    *
    from {{ source('ecomerce','avaliacoes') }}
)

select
*
from source