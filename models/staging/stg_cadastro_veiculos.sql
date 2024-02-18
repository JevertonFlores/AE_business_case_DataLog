WITH source AS (
    SELECT
        *
    FROM {{ ref('datalog_CadastroVeiculo') }}
)

SELECT
	"ID_Veiculo" AS id_veiculo
	,"Placa" AS placa
	,"Carroceria" AS carroceria
	,"TipoVeiculo" AS tipo_veiculo
	,"Filial" AS filial
FROM source