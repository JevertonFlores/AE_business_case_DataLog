WITH source AS (
    SELECT DISTINCT
        *
    FROM {{ source('staging', 'cadastro_veiculos') }}
)

SELECT
    *
FROM source