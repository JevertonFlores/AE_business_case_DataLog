# Business Case - Logística - Indicadores de Desempenho

### Contexto:
A DataLog não possui um departamento de Tecnologia da Informação (TI), resultando no ERP sendo a única fonte de informações disponível.

Mensalmente, são gerados arquivos em Excel a partir do sistema para que as diversas gerências possam criar apresentações de resultados. O tratamento da base é realizado de forma repetitiva sempre que uma nova versão da base de dados é baixada, ou quando uma análise diferente precisa ser conduzida. Esse procedimento originou um desafio: múltiplas versões da "informação" existem, levando a situações em que gestores se confrontam com dados discrepantes durante reuniões, devido ao uso de relatórios personalizados.

Agora, a empresa planeja investir no desenvolvimento de uma solução para automatizar o processo de coleta, tratamento e visualização de dados, visando proporcionar acesso a todas as gerências. A expectativa é que essa iniciativa ponha fim às tarefas repetitivas, garantindo que todos tenham acesso à mesma versão da "verdade". O foco será redirecionado para a análise de dados, eliminando divergências e promovendo uma visão unificada das informações.

### Objetivo:
Um dos principais focos na gestão logística do transporte de cargas é a otimização dos custos. Ao ter controle efetivo sobre todas as despesas envolvidas, é viável aprimorar procedimentos e reduzir custos considerados dispensáveis.

Minha contratação como Consultor de Business Intelligence tem o propósito de apoiar a DataLog no desenvolvimento de uma pipeline para automatizar o processo de coleta e tratamento dados, além de um Dashboard com os principais indicadores de desempenho. Isso proporcionará aos gestores a capacidade de monitorar os indicadores cruciais da área, especialmente aqueles relacionados à operação, oferecendo uma visão aprimorada dos custos. Essa abordagem permitirá a identificação de áreas de aprimoramento e viabilizará o aumento da margem operacional, destacando-se como um passo importante para a eficiência financeira.

### Requisitos:
1. O Dashboard deverá ser desenvolvida utilizando o Power BI Deskop. 
2. Utilizar máximo três páginas, sendo a primeira composta pela Capa. 
3. Calcular os seguintes indicadores de acordo com as descrições: 
- Pedidos entregues: Total de pedidos que foram entregues;
- Pedidos devolvidos: Total de pedidos com Ocorrências;
- Custo variável: Soma do Custo Combustível (abastecimento) com o Custo Manutenção; 
- Custo total: Soma do Custo Fixo com o Custo Variável;
- Receita Bruta: Total do Valor Frete ;
- Resultado: diferença entre a Receita Bruta e o Custo Total;
- Margem Operacional: razão entre o Resultado e a Receita Bruta;
- Ticket Médio: razão entre o Receita Bruta e a Quantidade de pedidos;
- Order Cycle Time (OCT): tempo desde a data do pedido até a entrega;
- On Time: percentual de pedidos entregues no prazo previsto ;
- In Full: percentual de pedidos entregues sem ocorrências;
- OTIF: é o produto entre os indicadores OnTime e In Full.
4. Construir uma tabela de resumo dos principais indicadores por filial, tipo, carroceria e placa de forma que seja fácil identificar os valores de % Margem Operacional dentro destes intervalos utilizando ícones.  
- Marem ruim: valores entre o menor valor e 20  
- Marem dentro do esperado: valores de 20% a 40  
- Marem excelente: valores entre 40% e valor mínimo

### Dados:
Os dados são disponibilizados em arquivos .csv, que são extraídos e armazenados diariamente em um diretório pré definido.
Estes dados contém informações de custos, entregas, ocorrências e veículos da empresa.

### Solução proposta:
Para atender as necessidades de maneira eficaz e com um baixo custo tecnológico, serão utilizadas as seguintes ferramentas:
- dbt Core: para o processo de transformação e carga dos dados;
- PostgreSQL: para armazenamento dos dados tratados;
- Power BI: para criação do Dashboard e análise dos dados.

### Modelo de Dados:
![image](https://github.com/JevertonFlores/AE_business_case_DataLog/assets/36814309/eba5e978-bee9-458f-8a17-7e407851fc07)

### Tratamento e modelagem dos dados com dbt Core:
<a href="https://github.com/JevertonFlores/AE_business_case_DataLog/tree/main/modelss">- Models dbt Core;</a>

### Lineage:
![image](https://github.com/JevertonFlores/AE_business_case_DataLog/assets/36814309/60f5816b-a025-4268-9718-bb73d9a5704a)

### Datamart armazenado no PostgreSQL:
![image](https://github.com/JevertonFlores/AE_business_case_DataLog/assets/36814309/632abe2e-09ee-4f04-9f8b-c59b0e70fb03)

### Dashboard:
O dashboard pode ser acessado pelo link --> 
<a href="https://app.powerbi.com/view?r=eyJrIjoiZDQ1NzY2MmYtMjJkOC00YTU0LTlhYzAtNGRjZjA1YmNiMWU5IiwidCI6ImRlYzg2NmVlLWFkZjAtNGIxZC1hMWJhLTdhODZjODY0OTRiZCJ9">- DataLog - Indicadores de Desempenho

### Telas do dashboard:

![image](https://github.com/JevertonFlores/AE_business_case_DataLog/assets/36814309/4beafa17-e5ae-45ff-9e7a-d8b2301f9079)

-----------------------------
![image](https://github.com/JevertonFlores/AE_business_case_DataLog/assets/36814309/32546b36-258a-4646-8a6b-fb703e5bac3d)


