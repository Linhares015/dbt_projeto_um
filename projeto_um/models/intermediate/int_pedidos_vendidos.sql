{{
    config(
        tags=['vendas']
    )
}}

with pedidos as (
    select
        *
    from {{ ref('stg_pedidos') }}
)

, cliente as (
    select
        *
    from {{ ref('stg_clientes') }}
)

, itens_pedidos as (
    select
        *
    from {{ ref('stg_itens_pedidos') }}
)

, produtos as (
    select
        *
    from {{ ref('stg_produtos') }}
)

, pagamentos as (
    select
        *
    from {{ ref('stg_pagamentos') }}
)

, categorias as (
    select
        *
    from {{ ref('stg_categorias') }}
)

, joined as (
    select
        pedidos.data_pedido
        , cliente.nome
        , cliente.email
        , pagamentos.valor
        , pagamentos.metodo
        , pagamentos.status
        , pagamentos.data_pagamento
        , produtos.nome as nome_produto
        , categorias.nome as categoria_produto
        , itens_pedidos.quantidade
        , itens_pedidos.preco_unitario
    from pedidos
    left join cliente on pedidos.cliente_id = cliente.id
    left join pagamentos on pedidos.id = pagamentos.pedido_id
    left join itens_pedidos on pedidos.id = itens_pedidos.pedido_id
    left join produtos on itens_pedidos.produto_id = produtos.id
    left join categorias on produtos.categoria_id = categorias.id
)

select
    *
from joined