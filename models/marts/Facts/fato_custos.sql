WITH source AS (
    SELECT
        *
    FROM {{ ref('stg_custos_mensais') }}
),

custos_intermediate AS (
SELECT
    id_veiculo,
    data,
    km_percorridos as kilometros_percorridos,
    CAST(TRIM(REPLACE(REPLACE(custo_fixo, 'R$', ''), ',', '')) AS NUMERIC) AS custo_fixo,
    CAST(TRIM(REPLACE(REPLACE(vlr_manutencao, 'R$', ''), ',', '')) AS NUMERIC) AS vlr_manutencao,
    CAST(TRIM(REPLACE(REPLACE(vlr_abastecimento, 'R$', ''), ',', '')) AS NUMERIC) AS vlr_abastecimento,
    CAST(TRIM(REPLACE(REPLACE(custo_total, 'R$', ''), ',', '')) AS NUMERIC) AS custo_total
FROM source
),

veiculos AS (
    SELECT 
        *
    FROM {{ ref('dim_veiculos') }}
),

treated AS (
    SELECT
        TO_CHAR(c.data, 'YYYYMMDD')::INT AS sk_datetime
        ,ve.sk_veiculo
        ,c.kilometros_percorridos
        ,c.custo_fixo
        ,c.vlr_manutencao
        ,c.vlr_abastecimento
        ,c.custo_total
    FROM custos_intermediate c 
    LEFT JOIN veiculos ve 
        ON c.id_veiculo = ve.id_veiculo
)

SELECT
*
FROM treated