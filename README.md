# [BDII-AV2] Projeto de Análise e Construção de Data Warehouse - Execução Financeira V4

## Descrição do projeto

O objetivo deste projeto é realizar uma análise aprofundada do banco de dados denominado 'Execução Financeira V4' e, a partir desses dados, construir um Data Warehouse (DW) que permita uma visão consolidada e otimizada para análise das informações da base de dados. Posteriormente, será desenvolvida uma visualização no Power BI com base no DW construído, proporcionando insights sobre os dados analisados.

## Fonte de dados

Base: [Execução Financeira V4](https://drive.google.com/file/d/1h-6UtjhyjqG1TqWoiwOzZPCb_qS1n0Bp/view?usp=sharing)

Essa base é referente a pagamentos de empenhos. A chave única é num_ano, cod_ne,
codigo_orgao.

Tuplas: 2.025.116

Campos:id, num_ano, cod_ne, codigo_orgao, dsc_orgao, cod_credor, dsc_nome_credor,
cod_fonte, dsc_fonte, cod_funcao, dsc_funcao, cod_item, dsc_item, cod_item_elemento,
dsc_item_elemento, cod_item_categoria, dsc_item_categoria, cod_item_grupo,
dsc_item_grupo, dsc_modalidade_licitacao, cod_item_modalidade, dsc_item_modalidade,
cod_programa, dsc_programa, cod_subfuncao, dsc_subfuncao, num_sic, cod_np,
vlr_empenho, vlr_liquidado, valor_pago, vlr_resto_pagar, dth_empenho, dth_pagamento,
dth_liquidacao, dth_processamento, num_ano_np

## Extração dos dados

### Importação do banco de dados

Importação do backup do banco de dados para o SQL Server Management Studio.

1. Selecionar 'Bancos de Dados' e com o botão direito clicar na opção 'Restaurar Banco de Dados...'
   
  ![Captura de tela 2023-12-06 114927](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/84567c0f-2187-42ef-b72b-3d0c35640fe5)


2. Clicar em 'Dispositivo' e depois clicar em '...'
   
  ![Captura de tela 2023-12-06 115350](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/2d6e3d93-e995-41fb-91e1-a9c8bd3f93c3)

   
3. Clicar em 'Adicionar'.

  ![Captura de tela 2023-12-06 115826](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/61163d01-ccb8-47f6-9185-94b1a70a2f4b)


4. Localize e selecione o arquivo que deseja restaurar, depois nas páginas seguintes clique em 'OK'.

  ![Captura de tela 2023-12-06 120404](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/3b6a048e-081e-46db-a1d1-beeace5d9020)

  ![Captura de tela 2023-12-06 120608](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/e6c3f67b-7ca6-4524-ae6e-e5217d23423e)

  ![Captura de tela 2023-12-06 120843](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/823c45ed-976e-4cf1-80eb-30892a862bf3)


5. Aguarde a finalização da restauração.

  ![Captura de tela 2023-12-06 121152](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/5973a5bb-7eab-4d75-8924-28595a7b38a5)
