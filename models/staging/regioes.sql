WITH source AS (
    SELECT
        *
    FROM {{ source('staging', 'base_dados') }}
),

intemediate AS (
    SELECT DISTINCT
        destino
    FROM source
),

treated AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY destino) AS sk_destino
        ,destino
        ,SPLIT_PART(destino, '/', 1) AS regiao
        ,SPLIT_PART(SPLIT_PART(destino, '/', 2), '*', 1) AS uf
        ,SPLIT_PART(destino, '*', 2) AS cidade 
    FROM intemediate
)

SELECT
    *
FROM treated