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
