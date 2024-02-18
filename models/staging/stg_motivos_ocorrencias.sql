WITH source AS (
    SELECT
        *
    FROM {{ ref('datalog_MotivosOcorrencia') }}
)

SELECT
	"idOcorrencia" AS id_ocorrencia
	,"Motivo" AS motivo
	,"Responsabilidade" AS responsabilidade
FROM source