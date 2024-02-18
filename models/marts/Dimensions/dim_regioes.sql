WITH source AS (
    SELECT
        *
    FROM {{ ref('stg_regioes') }}
),

treated AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY destino) AS sk_destino
        ,destino
        ,regiao
        ,uf
        ,cidade
    FROM source
)

SELECT
    *
FROM treated