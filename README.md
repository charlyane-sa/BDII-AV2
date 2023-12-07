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

A análise exploratória dos dados foi realizada utilizando somente uma amostragem dos dados. Foi utilizada a ferramenta jupyter notebook.


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

### Limpeza Inicial e criação do bancos ODS e DW

#### Criação do banco 'ODS'
Para dar suporte à área de stage (ODS - Operational Data Store), onde realizaremos os tratamentos e transformações preliminares nos dados antes de enviá-los para o Data Warehouse (DW), vamos criar o banco 'ODS'

```sql
USE master;
CREATE DATABASE ODS;
```

#### Criação do banco 'DW'
Agora, criaremos o Data Warehouse (DW), que será a base consolidada e otimizada para análise das informações provenientes da base 'Financeiro'

```sql
USE master;
CREATE DATABASE DW;
```

#### Enviando tabela da base 'Financeiro' para o 'ODS'
Para iniciar o processo de tratamento e transformação dos dados, enviaremos a tabela 'tb_execucao_financeira' da base 'Financeiro' para o banco 'ODS'

```sql
USE ODS;

-- Apagar a tabela se ela existir
DROP TABLE IF EXISTS ODS..tb_execucao_financeira;

-- Enviar a tabela para o ODS
USE Financeiro;
SELECT * 
	INTO ODS..tb_execucao_financeira
FROM tb_execucao_financeira;
```

#### Duplicando a tabela 'tb_execucao_financeira' no 'ODS' para realizar os tratamentos

Agora, duplicaremos a tabela 'tb_execucao_financeira' no banco 'ODS' para realizar os tratamentos necessários

```sql
USE ODS;

-- Duplicar a tabela para tratamentos
SELECT * 
	INTO ODS..tb_exec_fin_tratada
FROM tb_execucao_financeira;
```



#### Limpeza inicial da base de dados tb_exec_fin_tratada
Para aprimorar a qualidade dos dados na tabela 'tb_exec_fin_tratada' no ODS, iremos remover as colunas 'vlr_liquidado' e 'dth_liquidacao' que contêm valores nulos

```sql
USE ODS;

-- Remove a coluna vlr_liquidado
ALTER TABLE tb_exec_fin_tratada DROP COLUMN vlr_liquidado;

-- Remove a coluna dth_liquidacao
ALTER TABLE tb_exec_fin_tratada DROP COLUMN dth_liquidacao;

```
#### Ajustar tipos de dados das colunas
Para trabalharmos melhor com os dados que estão com as colunas, vamos converter os tipos de dados de algumas colunas

```sql
-- 2.1 Ajustar a coluna 'num_ano' de 'text' para 'int'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN num_ano VARCHAR(MAX);
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN num_ano INT;


-- 2.2 Ajustar a coluna 'codigo_orgao' de 'text' para 'int'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN codigo_orgao VARCHAR(MAX);
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN codigo_orgao INT;


-- 2.3 Ajustar a coluna 'cod_fonte' de 'text' para 'int'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_fonte VARCHAR(MAX);
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_fonte INT;


-- 2.4 Ajustar a coluna 'cod_funcao' de 'text' para 'int'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_funcao VARCHAR(MAX);
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_funcao INT;


-- 2.5 Ajustar a coluna 'cod_item' de 'text' para 'int'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_item VARCHAR(MAX);
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_item INT;


-- 2.6 Ajustar a coluna 'cod_item_elemento' de 'text' para 'int'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_item_elemento VARCHAR(MAX);
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_item_elemento INT;


-- 2.7 Ajustar a coluna 'cod_item_categoria' de 'text' para 'int'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_item_categoria VARCHAR(MAX);
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_item_categoria INT;


-- 2.8 Ajustar a coluna 'cod_item_grupo' de 'text' para 'int'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_item_grupo VARCHAR(MAX);
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_item_grupo INT;


-- 2.9 Ajustar a coluna 'cod_item_modalidade' de 'text' para 'int'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_item_modalidade VARCHAR(MAX);
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_item_modalidade INT;


-- 2.10 Ajustar a coluna 'cod_programa' de 'text' para 'int'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_programa VARCHAR(MAX);
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_programa INT;


-- 2.11 Ajustar a coluna 'cod_subfuncao' de 'text' para 'int'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_subfuncao VARCHAR(MAX);
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_subfuncao INT;


-- 2.12 Ajustar a coluna 'num_sic' de 'text' para 'int'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN num_sic VARCHAR(MAX);
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN num_sic INT;


-- 2.13 Ajustar a coluna 'num_ano_np' de 'text' para 'int'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN num_ano_np VARCHAR(MAX);
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN num_ano_np INT;

-- 2.14 Ajustar a coluna 'dsc_orgao' de 'text' para 'VARCHAR'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN dsc_orgao VARCHAR(MAX);


-- 2.15 Ajustar a coluna 'cod_credor' de 'text' para 'VARCHAR'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN cod_credor VARCHAR(MAX);

-- 2.15 Ajustar a coluna 'dsc_nome_credor' de 'text' para 'VARCHAR'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN dsc_nome_credor VARCHAR(MAX);



-- 2.16 Ajustar a coluna 'dsc_fonte' de 'text' para 'VARCHAR'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN dsc_fonte VARCHAR(MAX);


-- 2.17 Ajustar a coluna 'dsc_funcao' de 'text' para 'VARCHAR'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN dsc_funcao VARCHAR(MAX);

-- 2.18 Ajustar a coluna 'dsc_item' de 'text' para 'VARCHAR'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN dsc_item VARCHAR(MAX);


-- 2.19 Ajustar a coluna 'dsc_item_elemento' de 'text' para 'VARCHAR'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN dsc_item_elemento VARCHAR(MAX);

-- 2.20 Ajustar a coluna 'dsc_item_categoria' de 'text' para 'VARCHAR'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN dsc_item_categoria VARCHAR(MAX);


-- 2.21 Ajustar a coluna 'dsc_item_grupo' de 'text' para 'VARCHAR'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN dsc_item_grupo VARCHAR(MAX);

-- 2.22 Ajustar a coluna 'dsc_modalidade_licitacao' de 'text' para 'VARCHAR'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN dsc_modalidade_licitacao VARCHAR(MAX);

-- 2.23 Ajustar a coluna 'dsc_item_modalidade' de 'text' para 'VARCHAR'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN dsc_item_modalidade VARCHAR(MAX);

-- 2.24 Ajustar a coluna 'dsc_programa' de 'text' para 'VARCHAR'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN dsc_programa VARCHAR(MAX);


-- 2.25 Ajustar a coluna 'dsc_subfuncao' de 'text' para 'VARCHAR'

USE ODS;
ALTER TABLE tb_exec_fin_tratada ALTER COLUMN dsc_subfuncao VARCHAR(MAX);
```

## Transformação e Carga

### Criando as tabelas fato e dimensões no Data WareHouse(DW)


#### Criação das dimensões

#### Dimensão Orgão

```sql

-- Criação da tabela dim_Orgao
USE DW;
CREATE TABLE dim_Orgao (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(MAX)
);

-- Inserção de dados distintos
INSERT INTO dim_Orgao (codigo, descricao)
SELECT 
    codigo_orgao AS codigo,
    dsc_orgao AS descricao
FROM (
    SELECT 
        codigo_orgao,
        dsc_orgao,
        ROW_NUMBER() OVER (PARTITION BY codigo_orgao ORDER BY (SELECT NULL)) AS rn
    FROM ODS..tb_exec_fin_tratada
) AS subquery
WHERE rn = 1;
```

#### Dimensão Orgão

```sql


USE DW;

-- Criação da tabela dim_Credor
CREATE TABLE dim_Credor (
    codigo BIGINT PRIMARY KEY,
    descricao VARCHAR(MAX)
);

-- Inserção de dados distintos
INSERT INTO dim_Credor (codigo, descricao)
SELECT 
    TRY_CAST(cod_credor AS BIGINT) AS codigo,
    dsc_nome_credor AS descricao
FROM (
    SELECT 
        cod_credor,
        dsc_nome_credor,
        ROW_NUMBER() OVER (PARTITION BY cod_credor ORDER BY (SELECT NULL)) AS rn
    FROM ODS..tb_exec_fin_tratada
) AS subquery
WHERE rn = 1 AND TRY_CAST(cod_credor AS BIGINT) IS NOT NULL;

```

#### Dimensão Fonte

```sql


-- Criação da tabela dim_Fonte
USE DW;
CREATE TABLE dim_Fonte (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(MAX)
);

-- Inserção de dados distintos
INSERT INTO dim_Fonte (codigo, descricao)
SELECT 
    cod_fonte AS codigo,
    dsc_fonte AS descricao
FROM (
    SELECT 
        cod_fonte,
        dsc_fonte,
        ROW_NUMBER() OVER (PARTITION BY cod_fonte ORDER BY (SELECT NULL)) AS rn
    FROM ODS..tb_exec_fin_tratada
) AS subquery
WHERE rn = 1 AND cod_fonte IS NOT NULL;

```

#### Dimensão Função

```sql

-- Criação da tabela dim_Funcao
USE DW;
CREATE TABLE dim_Funcao (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(MAX)
);

-- Inserção de dados distintos
INSERT INTO dim_Funcao (codigo, descricao)
SELECT 
    cod_funcao AS codigo,
    dsc_funcao AS descricao
FROM (
    SELECT 
        cod_funcao,
        dsc_funcao,
        ROW_NUMBER() OVER (PARTITION BY cod_funcao ORDER BY (SELECT NULL)) AS rn
    FROM ODS..tb_exec_fin_tratada
) AS subquery
WHERE rn = 1;
```


#### Dimensão Item

```sql
-- Dimensao Item

-- Criação da tabela dim_Item
USE DW;
CREATE TABLE dim_Item (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(MAX)
);

-- Inserção de dados distintos
INSERT INTO dim_Item (codigo, descricao)
SELECT 
    cod_item AS codigo,
    dsc_item AS descricao
FROM (
    SELECT 
        cod_item,
        dsc_item,
        ROW_NUMBER() OVER (PARTITION BY cod_item ORDER BY (SELECT NULL)) AS rn
    FROM ODS..tb_exec_fin_tratada
) AS subquery
WHERE rn = 1 AND cod_item IS NOT NULL;

```

#### Dimensão Item Elemento

```sql

-- Criação da tabela dim_ItemElemento
USE DW;
CREATE TABLE dim_ItemElemento (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(MAX)
);

-- Inserção de dados distintos
INSERT INTO dim_ItemElemento (codigo, descricao)
SELECT 
    cod_item_elemento AS codigo,
    dsc_item_elemento AS descricao
FROM (
    SELECT 
        cod_item_elemento,
        dsc_item_elemento,
        ROW_NUMBER() OVER (PARTITION BY cod_item_elemento ORDER BY (SELECT NULL)) AS rn
    FROM ODS..tb_exec_fin_tratada
) AS subquery
WHERE rn = 1 AND cod_item_elemento IS NOT NULL;
```

#### Dimensão Item Categoria

```sql

-- Criação da tabela dim_ItemCategoria
USE DW;
CREATE TABLE dim_ItemCategoria (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(MAX)
);

-- Inserção de dados distintos
INSERT INTO dim_ItemCategoria (codigo, descricao)
SELECT 
    cod_item_categoria AS codigo,
    dsc_item_categoria AS descricao
FROM (
    SELECT 
        cod_item_categoria,
        dsc_item_categoria,
        ROW_NUMBER() OVER (PARTITION BY cod_item_categoria ORDER BY (SELECT NULL)) AS rn
    FROM ODS..tb_exec_fin_tratada
) AS subquery
WHERE rn = 1;
```

#### Dimensão Item Grupo

```sql

-- Criação da tabela dim_ItemGrupo
USE DW;
CREATE TABLE dim_ItemGrupo (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(MAX)
);

-- Inserção de dados distintos
INSERT INTO dim_ItemGrupo (codigo, descricao)
SELECT 
    cod_item_grupo AS codigo,
    dsc_item_grupo AS descricao
FROM (
    SELECT 
        cod_item_grupo,
        dsc_item_grupo,
        ROW_NUMBER() OVER (PARTITION BY cod_item_grupo ORDER BY (SELECT NULL)) AS rn
    FROM ODS..tb_exec_fin_tratada
) AS subquery
WHERE rn = 1  AND cod_item_grupo IS NOT NULL;

```

#### Dimensão Item Modalidade

```sql

-- Criação da tabela dim_ItemModalidade
USE DW;
CREATE TABLE dim_ItemModalidade (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(MAX)
);

-- Inserção de dados distintos
INSERT INTO dim_ItemModalidade (codigo, descricao)
SELECT 
    cod_item_modalidade AS codigo,
    dsc_item_modalidade AS descricao
FROM (
    SELECT 
        cod_item_modalidade,
        dsc_item_modalidade,
        ROW_NUMBER() OVER (PARTITION BY cod_item_modalidade ORDER BY (SELECT NULL)) AS rn
    FROM ODS..tb_exec_fin_tratada
) AS subquery
WHERE rn = 1;

```

#### Dimensão Programa

```sql

-- Criação da tabela dim_Programa
USE DW;
CREATE TABLE dim_Programa (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(MAX)
);

-- Inserção de dados distintos
INSERT INTO dim_Programa (codigo, descricao)
SELECT 
    cod_programa AS codigo,
    dsc_programa AS descricao
FROM (
    SELECT 
        cod_programa,
        dsc_programa,
        ROW_NUMBER() OVER (PARTITION BY cod_programa ORDER BY (SELECT NULL)) AS rn
    FROM ODS..tb_exec_fin_tratada
) AS subquery
WHERE rn = 1;
```

#### Dimensão Subfunção

```sql

-- Criação da tabela dim_Subfuncao
USE DW;
CREATE TABLE dim_Subfuncao (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(MAX)
);

-- Inserção de dados distintos
INSERT INTO dim_Subfuncao (codigo, descricao)
SELECT 
    cod_subfuncao AS codigo,
    dsc_subfuncao AS descricao
FROM (
    SELECT 
        cod_subfuncao,
        dsc_subfuncao,
        ROW_NUMBER() OVER (PARTITION BY cod_subfuncao ORDER BY (SELECT NULL)) AS rn
    FROM ODS..tb_exec_fin_tratada
) AS subquery
WHERE rn = 1;

```

#### Criação da tabela fato_execucao_financeira

A tabela fato_execucao_financeira será a tabela de fatos no Data Warehouse, armazenando informações cruciais sobre a execução financeira. Essa tabela terá uma chave primária (id) e várias colunas representando diferentes dimensões

```sql

USE DW;
CREATE TABLE fato_execucao_financeira (
    id INT PRIMARY KEY,
    num_ano INT,
    cod_ne VARCHAR(MAX),
    codigo_orgao INT,
    cod_credor BIGINT,
    cod_fonte INT,
    cod_funcao INT,
    cod_item INT,
    cod_item_elemento INT,
    cod_item_categoria INT,
    cod_item_grupo INT,
    cod_item_modalidade INT,
    cod_programa INT,
    cod_subfuncao INT,
    num_sic INT,
    cod_np VARCHAR(MAX),
    valor_empenho DECIMAL(18, 2),
    valor_pago DECIMAL(18, 2),
    valor_resto_pagar DECIMAL(18, 2),
    data_empenho DATETIME,
    data_pagamento DATETIME,
    data_processamento DATETIME,
    num_ano_np INT
);


```

#### Inserção de dados na tabela fato

Após a criação da tabela, os dados distintos da tabela tb_exec_fin_tratada do ODS (Operational Data Store) são inseridos na tabela de fatos fato_execucao_financeira. Nota-se que algumas conversões de tipos foram realizadas, como a tentativa de converter cod_credor para BIGINT

```sql

INSERT INTO fato_execucao_financeira
SELECT 
    id,
    num_ano,
    cod_ne,
    codigo_orgao,
    TRY_CAST(cod_credor AS BIGINT),
    cod_fonte,
    cod_funcao,
    cod_item,
    cod_item_elemento,
    cod_item_categoria,
    cod_item_grupo,
    cod_item_modalidade,
    cod_programa,
    cod_subfuncao,
    num_sic,
    cod_np,
    vlr_empenho AS valor_empenho,
    valor_pago,
    vlr_resto_pagar AS valor_resto_pagar,
    dth_empenho AS data_empenho,
    dth_pagamento AS data_pagamento,
    dth_processamento AS data_processamento,
    num_ano_np
FROM ODS..tb_exec_fin_tratada;

```

#### Dimensão calendário

#### Criação da tabela Dimensão Calendário

A tabela Dim_Calendario será a dimensão de calendário no Data Warehouse, contendo informações temporais detalhadas. Esta tabela é fundamental para análises temporais e permite a correlação de dados financeiros com informações de data


```sql

CREATE TABLE Dim_Calendario (
    id_data INT PRIMARY KEY,
    data DATE,
    dia INT,
    mes INT,
    ano INT,
    nome_mes NVARCHAR(20),
    nome_mes_abreviado NVARCHAR(5),
    nome_dia_semana NVARCHAR(15),
    numero_dia_semana INT,
    trimestre INT,
    feriados NVARCHAR(50),
    num_feriados BIT
);
```

#### Preenchimento da tabela com dados de 2019 a 2022

A tabela será preenchida com dados de 2019 a 2022, incluindo informações como dia, mês, ano, nome do mês, nome abreviado do mês, nome do dia da semana, número do dia da semana, trimestre e feriados

```sql

-- Preencher a tabela com dados de 2019 a 2022

DECLARE @data_inicio DATE = '2019-01-01';
DECLARE @data_fim DATE = '2022-12-31';

WHILE @data_inicio <= @data_fim
BEGIN
    INSERT INTO Dim_Calendario (
        id_data, 
        data, 
        dia, 
        mes, 
        ano, 
        nome_mes, 
        nome_mes_abreviado, 
        nome_dia_semana, 
        trimestre, 
        numero_dia_semana
    )
    VALUES (
        CONVERT(INT, FORMAT(@data_inicio, 'yyyyMMdd')),
        @data_inicio,
        DAY(@data_inicio),
        MONTH(@data_inicio),
        YEAR(@data_inicio),
        FORMAT(@data_inicio, 'MMMM'),
        FORMAT(@data_inicio, 'MMM'),
        FORMAT(@data_inicio, 'dddd'),
        DATEPART(QUARTER, @data_inicio),
        DATEPART(WEEKDAY, @data_inicio)
    );

    SET @data_inicio = DATEADD(DAY, 1, @data_inicio);
END;

```

#### Preencher feriados

Os feriados nacionais foram incorporados à tabela Dim_Calendario com base em informações disponíveis no site da [ANBIMA](https://www.anbima.com.br/feriados/). A seguir, estão as atualizações dos feriados para os anos de 2019 a 2022:

#### Atualização dos Feriados de 2019

```sql
UPDATE Dim_Calendario
SET feriados = 'Confraternizacao Universal', num_feriados = 1
WHERE data = '2019-01-01';

UPDATE Dim_Calendario
SET feriados = 'Carnaval', num_feriados = 1
WHERE data IN ('2019-03-04', '2019-03-05');

UPDATE Dim_Calendario
SET feriados = 'Paixao de Cristo', num_feriados = 1
WHERE data = '2019-04-19';

UPDATE Dim_Calendario
SET feriados = 'Tiradentes', num_feriados = 1
WHERE data = '2019-04-21';

UPDATE Dim_Calendario
SET feriados = 'Dia do Trabalho', num_feriados = 1
WHERE data = '2019-05-01';

UPDATE Dim_Calendario
SET feriados = 'Corpus Christi', num_feriados = 1
WHERE data = '2019-06-20';

UPDATE Dim_Calendario
SET feriados = 'Independencia do Brasil', num_feriados = 1
WHERE data = '2019-09-07';

UPDATE Dim_Calendario
SET feriados = 'Nossa Sra Aparecida - Padroeira do Brasil', num_feriados = 1
WHERE data = '2019-10-12';

UPDATE Dim_Calendario
SET feriados = 'Finados', num_feriados = 1
WHERE data = '2019-11-02';

UPDATE Dim_Calendario
SET feriados = 'Proclamacao da Republica', num_feriados = 1
WHERE data = '2019-11-15';

UPDATE Dim_Calendario
SET feriados = 'Natal', num_feriados = 1
WHERE data = '2019-12-25';

```

#### Atualização dos Feriados de 2020

```sql
UPDATE Dim_Calendario
SET feriados = 'Confraternizacao Universal', num_feriados = 1
WHERE data = '2020-01-01';

UPDATE Dim_Calendario
SET feriados = 'Carnaval', num_feriados = 1
WHERE data IN ('2020-02-24', '2020-02-25');

UPDATE Dim_Calendario
SET feriados = 'Paixao de Cristo', num_feriados = 1
WHERE data = '2020-04-10';

UPDATE Dim_Calendario
SET feriados = 'Tiradentes', num_feriados = 1
WHERE data = '2020-04-21';

UPDATE Dim_Calendario
SET feriados = 'Dia do Trabalho', num_feriados = 1
WHERE data = '2020-05-01';

UPDATE Dim_Calendario
SET feriados = 'Corpus Christi', num_feriados = 1
WHERE data = '2020-06-11';

UPDATE Dim_Calendario
SET feriados = 'Independencia do Brasil', num_feriados = 1
WHERE data = '2020-09-07';

UPDATE Dim_Calendario
SET feriados = 'Nossa Sra Aparecida - Padroeira do Brasil', num_feriados = 1
WHERE data = '2020-10-12';

UPDATE Dim_Calendario
SET feriados = 'Finados', num_feriados = 1
WHERE data = '2020-11-02';

UPDATE Dim_Calendario
SET feriados = 'Proclamacao da Republica', num_feriados = 1
WHERE data = '2020-11-15';

UPDATE Dim_Calendario
SET feriados = 'Natal', num_feriados = 1
WHERE data = '2020-12-25';


```

#### Atualização dos Feriados de 2021

```sql
UPDATE Dim_Calendario
SET feriados = 'Confraternizacao Universal', num_feriados = 1
WHERE data = '2021-01-01';

UPDATE Dim_Calendario
SET feriados = 'Carnaval', num_feriados = 1
WHERE data IN ('2021-02-15', '2021-02-16');

UPDATE Dim_Calendario
SET feriados = 'Paixao de Cristo', num_feriados = 1
WHERE data = '2021-04-02';

UPDATE Dim_Calendario
SET feriados = 'Tiradentes', num_feriados = 1
WHERE data = '2021-04-21';

UPDATE Dim_Calendario
SET feriados = 'Dia do Trabalho', num_feriados = 1
WHERE data = '2021-05-01';

UPDATE Dim_Calendario
SET feriados = 'Corpus Christi', num_feriados = 1
WHERE data = '2021-06-03';

UPDATE Dim_Calendario
SET feriados = 'Independencia do Brasil', num_feriados = 1
WHERE data = '2021-09-07';

UPDATE Dim_Calendario
SET feriados = 'Nossa Sra Aparecida - Padroeira do Brasil', num_feriados = 1
WHERE data = '2021-10-12';

UPDATE Dim_Calendario
SET feriados = 'Finados', num_feriados = 1
WHERE data = '2021-11-02';

UPDATE Dim_Calendario
SET feriados = 'Proclamacao da Republica', num_feriados = 1
WHERE data = '2021-11-15';

UPDATE Dim_Calendario
SET feriados = 'Natal', num_feriados = 1
WHERE data = '2021-12-25';


```

#### Atualização dos Feriados de 2022

```sql
UPDATE Dim_Calendario
SET feriados = 'Confraternizacao Universal', num_feriados = 1
WHERE data = '2022-01-01';

UPDATE Dim_Calendario
SET feriados = 'Carnaval', num_feriados = 1
WHERE data IN ('2022-02-28', '2022-03-01');

UPDATE Dim_Calendario
SET feriados = 'Paixao de Cristo', num_feriados = 1
WHERE data = '2022-04-15';

UPDATE Dim_Calendario
SET feriados = 'Tiradentes', num_feriados = 1
WHERE data = '2022-04-21';

UPDATE Dim_Calendario
SET feriados = 'Dia do Trabalho', num_feriados = 1
WHERE data = '2022-05-01';

UPDATE Dim_Calendario
SET feriados = 'Corpus Christi', num_feriados = 1
WHERE data = '2022-06-16';

UPDATE Dim_Calendario
SET feriados = 'Independencia do Brasil', num_feriados = 1
WHERE data = '2022-09-07';

UPDATE Dim_Calendario
SET feriados = 'Nossa Sra Aparecida - Padroeira do Brasil', num_feriados = 1
WHERE data = '2022-10-12';

UPDATE Dim_Calendario
SET feriados = 'Finados', num_feriados = 1
WHERE data = '2022-11-02';

UPDATE Dim_Calendario
SET feriados = 'Proclamacao da Republica', num_feriados = 1
WHERE data = '2022-11-15';

UPDATE Dim_Calendario
SET feriados = 'Natal', num_feriados = 1
WHERE data = '2022-12-25';

```

#### Adicionando Chaves estrangeiras
Para garantir a integridade referencial e possibilitar análises mais abrangentes, foram adicionadas chaves estrangeiras na tabela fato_execucao_financeira. As chaves estrangeiras vinculam as informações de execução financeira às dimensões relevantes

```sql
ALTER TABLE fato_execucao_financeira
ADD FOREIGN KEY (codigo_orgao) REFERENCES dim_Orgao(codigo);

ALTER TABLE fato_execucao_financeira
ADD FOREIGN KEY (cod_credor) REFERENCES dim_Credor(codigo);

ALTER TABLE fato_execucao_financeira
ADD FOREIGN KEY (cod_fonte) REFERENCES dim_Fonte(codigo);

ALTER TABLE fato_execucao_financeira
ADD FOREIGN KEY (cod_funcao) REFERENCES dim_Funcao(codigo);

ALTER TABLE fato_execucao_financeira
ADD FOREIGN KEY (cod_item) REFERENCES dim_Item(codigo);

ALTER TABLE fato_execucao_financeira
ADD FOREIGN KEY (cod_item_elemento) REFERENCES dim_ItemElemento(codigo);

ALTER TABLE fato_execucao_financeira
ADD FOREIGN KEY (cod_item_categoria) REFERENCES dim_ItemCategoria(codigo);

ALTER TABLE fato_execucao_financeira
ADD FOREIGN KEY (cod_item_grupo) REFERENCES dim_ItemGrupo(codigo);

ALTER TABLE fato_execucao_financeira
ADD FOREIGN KEY (cod_item_modalidade) REFERENCES dim_ItemModalidade(codigo);

ALTER TABLE fato_execucao_financeira
ADD FOREIGN KEY (cod_programa) REFERENCES dim_Programa(codigo);

ALTER TABLE fato_execucao_financeira
ADD FOREIGN KEY (cod_subfuncao) REFERENCES dim_Subfuncao(codigo);

ALTER TABLE fato_execucao_financeira
ADD FOREIGN KEY (data_processamento) REFERENCES Dim_Calendario(data);

```

### Modelo DW

Abaixo está reprensentado o modelo do DW criado.

![Captura de tela 2023-12-06 214732](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/24a8263d-1185-4b18-9d9f-5e0792dfd522)


### Visualização

Foi utilizada a ferramenta Power BI para gerar a parte visual do dados criados.

#### Conectar o Power BI ao Banco de dados

1. Selecionar na 'Página Inicial' a opção 'SQL Server'

![Captura de tela 2023-12-06 220023](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/4fa55bc9-5bc3-4e36-9c99-cd1697bb18c9)


2. Preencher o nome do 'Servidor' e do 'Banco de dados' e clicar em 'OK'. Se for a primeira conexão deve ser informada as credencias de acesso ao banco de dados.

![Captura de tela 2023-12-06 220219](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/7c6a79b4-32fc-439c-b927-990c3b487b9f)


3. Selecionar as tabelas que deseja importar e clicar em 'Transformar Dados'

![Captura de tela 2023-12-06 220435](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/d90922e5-2a86-43f2-b517-661178c4faee)


4. Verificar os dados no Power Query Editor e caso necessário realizar algum tratamento. Após as alterações carregar os dados (Fehcar e Aplicar).
Como a base já foi tratada no DW, não será necessário manipulação dos dados no Power BI.

![Captura de tela 2023-12-06 220713](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/ad363d22-738a-4d56-96be-f8f28647eacd)


#### Criação das medidas

Foram criadas 3 medidas para somar os valores totais de empenho, valor pago e valor restante a pagar.

#### Criação das medidas

#### Total geral valor a pagar

```
Total geral valor a pagar = SUM(fato_execucao_financeira[valor_resto_pagar])
```
#### Total geral valor original (empenho)

```
Total geral valor original (empenho) = SUM(fato_execucao_financeira[valor_empenho])
```

#### Total geral valor pago

```
Total geral valor pago = SUM(fato_execucao_financeira[valor_pago])
```

#### Criação do Layout

Foi utilizada a ferramenta Figma para a criação do layout que será utilizada no Dashboard. O layout é exportado no formato PNG.

#### Capa (Home)

![Home](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/eadc5fda-023f-4443-b01e-abb732cf4bc6)


#### Página 01_Análise por Orgão

![Pag 1](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/78f9fad7-7d3c-493f-96ee-eecd28d4e474)


#### Criação das páginas do Dashboard

#### Home

Passos realizados:

- Adicionado a imagem da capa como 'Tela de fundo'

![Captura de tela 2023-12-06 223523](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/9837573c-c2c2-4640-8698-072ffc81bd26)

  
- Adicionado um botão de ação para ir para a página 01_Análise por Orgão

![Captura de tela 2023-12-06 223549](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/020948eb-d02a-43e0-bbe0-1ebde4a8c1e1)


#### Página 01_Análise por Orgão

Passos realizados:

- Adicionado a imagem da capa como 'Tela de fundo'

![Captura de tela 2023-12-06 224104](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/844bcc72-110a-4f3d-b8c3-6fafc2a40d9a)

  
- Adicionado gráfico de barras representando o 'Total geral valor original por Orgão'

![Captura de tela 2023-12-06 223627](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/2d743628-ca77-4f01-8ed5-38b2d871984a)

  
- Adicionado gráfico de barras representando o 'Total geral do valor pago por Orgão'

![Captura de tela 2023-12-06 223637](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/a518fba3-7d13-48a7-8957-186d87d8980c)

  
- Adicionado gráfico de barras representando o 'Total geral do valor a pagar por Orgão'

![Captura de tela 2023-12-06 223645](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/0ec3a716-fae8-4696-a352-9841594423f5)

  
- Adicionado os filtros de 'Data processamento', 'Item Elemento', 'Item Categoria' e 'Item Grupo'

![Captura de tela 2023-12-06 223754](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/b4d99e3f-8448-47b9-bda7-543c406a5b1a)

  
- Adicionado botão de ação para limpar todos os filtros

![Captura de tela 2023-12-06 223804](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/e57f3417-3028-44c8-99f1-9817a9269392)

  
- Adicionado botão de acção para ir a página Home

![Captura de tela 2023-12-06 223905](https://github.com/charlyane-sa/BDII-AV2/assets/61762801/9720ba91-ab0d-47f5-9fba-c9f15c22e3fa)



