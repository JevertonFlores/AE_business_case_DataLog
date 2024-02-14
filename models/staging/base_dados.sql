WITH source AS (
    SELECT
        *
    FROM {{ source('seeds', 'datalog_BaseDados') }}
)

SELECT
    "NroPedido" AS pedido 
    ,"Destino" AS destino     
    ,TO_DATE("DataCTE", 'MM/DD/YYYY') AS data_cte
    ,TO_DATE("DataPedido", 'MM/DD/YYYY') AS data_pedido
    ,TO_DATE("DataPrevista", 'MM/DD/YYYY') AS data_prevista
    ,TO_DATE("DataEntrega", 'MM/DD/YYYY') AS data_entrega
    ,"ID_Veiculo" AS id_veiculo
    ,"ValorFrete" AS vlr_frete
    ,"PesoKg" AS peso_kilos
    ,"PesoCubo" AS peso_cubo
    ,"OcorrenciaDevolucao" AS ocorrencia_devolucao
    ,"ValorMercadoria" AS vlr_mercadoria
    ,"KMViagem" AS kilometragem_viagem
FROM source