WITH source AS (
    SELECT
        *
    FROM {{ source('staging', 'custos_mensais') }}
)

SELECT
    id_veiculo,
    TO_DATE('1/' || data, 'DD/MM/YYYY')::DATE as data,
    km_percorridos as kilometros_percorridos,
    CAST(TRIM(REPLACE(REPLACE(custo_fixo, 'R$', ''), ',', '')) AS NUMERIC) AS custo_fixo,
    CAST(TRIM(REPLACE(REPLACE(vlr_manutencao, 'R$', ''), ',', '')) AS NUMERIC) AS vlr_manutencao,
    CAST(TRIM(REPLACE(REPLACE(vlr_abastecimento, 'R$', ''), ',', '')) AS NUMERIC) AS vlr_abastecimento,
    CAST(TRIM(REPLACE(REPLACE(custo_total, 'R$', ''), ',', '')) AS NUMERIC) AS custo_total
FROM source