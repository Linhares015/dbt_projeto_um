{{
    config(
        tags=['vendas']
    )
}}

with pedidos as (
    select
        *
    from {{ ref('int_pedidos_vendidos') }}
)

select
    *
from pedidos