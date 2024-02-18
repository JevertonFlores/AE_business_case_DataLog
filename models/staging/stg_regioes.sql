WITH source AS (
    SELECT
        *
    FROM {{ ref('datalog_BaseDados') }}
),

intemediate AS (
    SELECT DISTINCT
        "Destino" AS destino
    FROM source
),

treated AS (
    SELECT
        destino
        ,SPLIT_PART(destino, '/', 1) AS regiao
        ,SPLIT_PART(SPLIT_PART(destino, '/', 2), '*', 1) AS uf
        ,SPLIT_PART(destino, '*', 2) AS cidade 
    FROM intemediate
)

SELECT
    *
FROM treated