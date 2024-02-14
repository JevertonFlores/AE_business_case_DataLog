WITH source AS (
    SELECT
        *
    FROM {{ source('staging', 'regioes') }}
)

SELECT
    *
FROM source