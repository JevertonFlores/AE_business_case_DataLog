WITH source AS (
    SELECT
        *
    FROM {{ ref('stg_base_dados') }}
),

regioes AS (
    SELECT 
        *
    FROM {{ ref('dim_regioes') }}
),

ocorrencias AS (
    SELECT 
        *
    FROM {{ ref('dim_ocorrencias') }}
),

veiculos AS (
    SELECT 
        *
    FROM {{ ref('dim_veiculos') }}
),

vendas_treated AS (
    SELECT
        v.pedido
        ,TO_CHAR(v.data_pedido, 'YYYYMMDD')::INT AS sk_datetime
        ,ve.sk_veiculo
        ,o.sk_ocorrencia
        ,r.sk_destino
        ,v.data_pedido
        ,v.data_cte
        ,v.data_prevista
        ,v.data_entrega
        ,v.data_entrega - v.data_pedido AS OCT
        ,CASE 
            WHEN v.data_entrega > v.data_prevista THEN 0
            ELSE 1
        END AS ontime
        ,v.kilometragem_viagem
        ,v.peso_kilos
        ,v.peso_cubo
        ,v.vlr_mercadoria
        ,v.vlr_frete
    FROM source v 
    LEFT JOIN regioes r 
        ON v.destino = r.destino
    LEFT JOIN ocorrencias o 
        ON v.ocorrencia_devolucao = o.id_ocorrencia
    LEFT JOIN veiculos ve 
        ON v.id_veiculo = ve.id_veiculo
)

SELECT
    *
FROM vendas_treated