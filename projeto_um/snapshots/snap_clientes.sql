{% snapshot pedido_snapshot %}
    {{
        config(
            target='clientes',
            target_schema='stg',
            unique_key='id',
            strategy='timestamp',
            updated_at='data_registro'
        )
    }}

    select
        id
        , nome
        , email
        , telefone
        , data_registro
    from {{ ref('stg_clientes') }}

{% endsnapshot %}