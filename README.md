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


### Modelagem Lógica

Criação da modelagem lógica do banco de dados 'Financeiro'.

![tb_execucao_financeira_LIGHT](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/396ecba4-1211-4da9-a5de-2722e1c87e03)


### Análise Exploratória dos Dados

Aqui, vamos mostrar como podemos utilizar o Python para a Análise Exploratória de Dados.

A análise exploratória de dados ou, em resumo, EDA (do inglês: Exploratory Data Analysis) é uma abordagem para analisar dados para resumir as principais características dos dados, obter uma melhor compreensão do conjunto de dados, descobrir relacionamentos entre diferentes variáveis ​​e extrair variáveis ​​importantes. EDA, é um passo importante em qualquer projeto de Análise de Dados ou Ciência de Dados.

O principal objetivo da EDA é detectar quaisquer erros ou discrepâncias, bem como entender diferentes padrões nos dados. Ele permite que os analistas entendam melhor os dados antes de fazer qualquer suposição e também descubram relacionamentos entre variáveis. Os resultados da EDA ajudam as empresas a conhecer seus clientes, expandir seus negócios e tomar melhores decisões.

#### Instalando e importando as bibliotecas necessárias

Instalando o xlrd e importando as bibliotecas que usaremos na análise.

```python
# instalando a xlrd
!pip install xlrd --upgrade
```

```python
# importando libs
import sqlalchemy as sal
import pandas as pd
```

#### Conectando com banco de dados

Conectando com banco SQL Server local

```python
# conectando ao banco de dados
link = 'mssql+pyodbc://hugojunior:hugojunior@192.168.56.101:1433/Financeiro?driver=ODBC Driver 18 for SQL Server&Encrypt=no'
conn = sal.create_engine(link)
```

#### Criando um DataFrame

Criando um dataframe com o resultado da nossa consulta SQL

```python
# criando o dataFrame
df = pd.read_sql('SELECT TOP 100000 * FROM tb_execucao_financeira', conn)
```

#### Visualizando as primeiras linhas

```python
df.head()
```

 #|id|num_ano|cod_ne|codigo_orgao|dsc_orgao|cod_credor|dsc_nome_credor|cod_fonte|dsc_fonte|cod_funcao|	...|cod_np|vlr_empenho|vlr_liquidado|valor pago|	vlr_resto_pagar|	dth_empenho|dth_pagamento|dth_liquidacao|dth_processamento|	num_ano_np|
| ------------- | ------------- | ------------- |------------- | ------------- |------------- | ------------- |------------- | ------------- |------------- | ------------- |------------- | ------------- |------------- | ------------- |------------- | ------------- |------------- | ------------- |------------- | ------------- |------------- |
0|2021552683|2020|00028092|220001|SECRETARIA DA EDUCACAO|00805489|COOP.AGROPECUARIA E DE SERV.N.S.APARECIDA COOP...|73|TRANSFERÊNCIAS DIRETAS DO FNDE|	12|...|2022OB011158|41770.60|None|0.0|2254.90|2020-10-23|2022-03-02|None|2022-10-27|2022
1|2021510082|2020|00028092|241281|HOSPITAL GERAL DE FORTALEZA|00827904|JB FARMA COMERCIO DE MEDICAMENTOS E REPRESENTA...|91|RECURSOS PROVENIENTES DO SUS|10|...|00006273|233.92|None|0.0|233.92|2020-07-29|2021-03-03|	None|	2022-10-27|2021
2|2021552684|2020|00028093|220001|SECRETARIA DA EDUCACAO|00826182|WORLD SOLUCOES TECNOLOGICAS E SERVICOS EIRELI|00|RECURSOS ORDINÁRIOS|12|...|00059685|2520.00|None|0.0|2520.00|2020-10-23|2021-09-06|	None|	2022-10-27|2021
3|2020784292|2020|00028093|240401|FUNDO ESTADUAL DE SAUDE|00010200|INSTITUTO NACIONAL DO SEGURO SOCIAL|86|CONVÊNIOS COM ÓRGÃOS MUNICIPAIS - ADMINISTRAÇÃ...|10|...|00047943|2373.00|None|2373.0|0.00|2020-07-29|2020-08-06|None|2022-10-27|2020
4|2021552685|2020|00028094|220001|SECRETARIA DA EDUCACAO|0881449|DAMIÃO HONORIO DE LIMA JUNIOR 03348195390|00|RECURSOS ORDINÁRIOS|12 |...|00086965|695.94|None|0.0|347.97|2020-10-23|2021-11-17|None|2022-10-27|2021

5 rows × 37 columns

#### Visualizando as informações de colunas do Dataframe

```python
df.info()
```

![Captura de tela 2023-12-06 135801](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/d1a3d628-6a15-43b3-b11a-5e04f823666d)


#### Informações estatísticas das colunas Dataframe

```python
df.describe()
```

![Captura de tela 2023-12-06 140256](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/596eb2f6-8550-4510-8fa8-cbf644aac2d2)

#### Consultando dados nulos ou Missing Values no Dataframe

```python
df.isnull().sum()
```

![Captura de tela 2023-12-06 140347](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/9c91e16a-a5fa-4f40-baeb-398adf252556)

#### Visualizando as análises

```python
# Importando bibliotecas que usaremos para visualizar as análises
import seaborn as sns
from matplotlib import pyplot as plt
import warnings
warnings.filterwarnings('ignore')
```

#### Define um estilo para nossos plots

```python
plt.style.use('ggplot')
```

#### Plota a distribuição da variável valor_pago

Essa é a variável que contem o valor pago

```python
%matplotlib inline
sns.displot(df['valor_pago'], color='green', kde=False)
plt.title('Distribuição da coluna valor_pago')
```

![Captura de tela 2023-12-06 140623](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/721e8068-e875-4107-8c7d-f39667695a97)


#### Plota a distribuição da variável num_ano

Essa é a variável que contem o ano

```python
%matplotlib inline
sns.displot(df['num_ano'],color='red', kde=False)
plt.title('Distribuição da coluna num_ano')
```

![Captura de tela 2023-12-06 140718](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/f618d9b7-1e72-4dd1-99d7-4a812ae5d5c3)

