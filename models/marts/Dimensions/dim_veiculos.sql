WITH source AS (
    SELECT DISTINCT
        *
    FROM {{ source('staging', 'cadastro_veiculos') }}
),

treated AS(
SELECT
    ROW_NUMBER() OVER (ORDER BY id_veiculo) AS sk_veiculo
    ,id_veiculo
    ,placa
    ,carroceria
    ,tipo_veiculo
    ,filial
FROM source
)

SELECT
    *
FROM treated