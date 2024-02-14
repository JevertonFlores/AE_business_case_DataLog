WITH source AS (
    SELECT
        *
    FROM {{ source('staging', 'base_dados') }}
),

regioes AS (
    SELECT 
        *
    FROM {{ source('staging', 'regioes') }}
),

vendas_treated AS (
    SELECT
        v.pedido
        ,v.id_veiculo
        ,v.ocorrencia_devolucao as id_ocorrencia
        ,r.sk_destino
        ,v.data_pedido
        ,v.data_cte
        ,v.data_prevista
        ,v.data_entrega
        ,v.kilometragem_viagem
        ,v.peso_kilos
        ,v.peso_cubo
        ,v.vlr_mercadoria
        ,v.vlr_frete
    FROM source v 
    LEFT JOIN regioes r 
        ON v.destino = r.destino
)

SELECT
    *
FROM vendas_treated