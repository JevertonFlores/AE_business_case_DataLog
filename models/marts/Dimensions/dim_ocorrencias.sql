WITH source AS (
    SELECT
        *
    FROM {{ source('staging', 'motivos_ocorrencias') }}
)

SELECT
    *
FROM source