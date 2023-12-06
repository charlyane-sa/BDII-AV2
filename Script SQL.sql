--- Criacao do ambiente do 'ODS' e 'DW'

-- Criacao do banco 'ODS' (stage area)

USE master;
CREATE DATABASE ODS;


-- Criacao do banco 'DW'

USE master;
CREATE DATABASE DW;


--- Enviando tabela da base 'Financeiro' para o 'ODS'

USE ODS;

DROP TABLE IF EXISTS ODS..tb_execucao_financeira; --Apagar a tabela se ela existir

USE Financeiro;
SELECT * 
	INTO ODS..tb_execucao_financeira
FROM tb_execucao_financeira;


--- Duplicando a tabela 'tb_execucao_financeira' no 'ODS' para realizar os tratamentos

USE ODS;

SELECT * 
	INTO ODS..tb_exec_fin_tratada
FROM tb_execucao_financeira;



--- Limpeza Inicial da base de dados tb_exec_fin_tratada

-- 1. Remover as colunas 'vlr_liquidado' e 'dth_liquidacao' que somente possuem valores nulos

USE ODS;
ALTER TABLE tb_exec_fin_tratada DROP COLUMN vlr_liquidado; -- Remove a coluna vlr_liquidado
ALTER TABLE tb_exec_fin_tratada DROP COLUMN dth_liquidacao; -- Remove a coluna dth_liquidacao


-- 2. Ajustar o tipo de dados das colunas 

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


--VALIDAÇÃO DE DUPLICATAS
SELECT
    cod_ne,
    codigo_orgao,
    COUNT(*) AS qtd_duplicatas
FROM
    tb_exec_fin_tratada
GROUP BY
    cod_ne,
    codigo_orgao
HAVING
    COUNT(*) > 1;

	--PADRONIZANDO DADOS
	SELECT DISTINCT num_ano FROM ODS..tb_exec_fin_tratada;

	SELECT DISTINCT cod_ne FROM ODS..tb_exec_fin_tratada;

	SELECT DISTINCT codigo_orgao FROM ODS..tb_exec_fin_tratada;

	SELECT DISTINCT cod_credor FROM ODS..tb_exec_fin_tratada;

	SELECT DISTINCT cod_funcao FROM ODS..tb_exec_fin_tratada;

	SELECT DISTINCT cod_item FROM ODS..tb_exec_fin_tratada;

	SELECT DISTINCT cod_item_elemento FROM ODS..tb_exec_fin_tratada;

	SELECT DISTINCT cod_item_categoria FROM ODS..tb_exec_fin_tratada;

	SELECT DISTINCT cod_item_grupo FROM ODS..tb_exec_fin_tratada;

	SELECT DISTINCT cod_item_modalidade  FROM ODS..tb_exec_fin_tratada;

	SELECT DISTINCT cod_programa FROM ODS..tb_exec_fin_tratada;

	SELECT DISTINCT cod_subfuncao FROM ODS..tb_exec_fin_tratada;

	SELECT DISTINCT num_sic FROM ODS..tb_exec_fin_tratada;

	SELECT DISTINCT num_ano_np FROM ODS..tb_exec_fin_tratada;

	




--- Criando o 'DW'

-- Dimens?o Org?o

-- Criar a tabela dim_Orgao

USE DW;

SELECT codigo_orgao AS codigo
      ,dsc_orgao AS descricao
	INTO dim_Orgao
  FROM ODS..tb_exec_fin_tratada;


-- Adicionar a chave prim?ria ? tabela dim_Orgao

USE [DW]
GO

SELECT [codigo]
      ,[descricao]
  FROM [dbo].[dim_Orgao]

GO

SELECT codigo FROM dim_Orgao;
 --VERIFICAR
ALTER TABLE dim_Orgao
ADD CONSTRAINT PK_dim_Orgao PRIMARY KEY (codigo);


-- Dimens?o Credor

USE DW;

SELECT cod_credor AS codigo
      ,dsc_nome_credor AS descricao
	INTO dim_Credor
  FROM ODS..tb_exec_fin_tratada;


-- Adicionar a chave prim?ria ? tabela dim_Credor

USE DW;

ALTER TABLE dim_Credor
ADD CONSTRAINT PK_dim_Credor PRIMARY KEY (codigo);


-- Dimens?o Fonte

USE DW;

SELECT cod_fonte AS codigo
      ,dsc_fonte AS descricao
	INTO dim_Fonte
  FROM ODS..tb_exec_fin_tratada;


-- Adicionar a chave prim?ria ? tabela dim_Fonte

USE DW;

ALTER TABLE dim_Fonte
ADD CONSTRAINT PK_dim_Fonte PRIMARY KEY (codigo);


-- Dimens?o Fun??o

USE DW;

SELECT cod_funcao AS codigo
      ,dsc_funcao AS descricao
	INTO dim_Funcao
  FROM ODS..tb_exec_fin_tratada;


-- Adicionar a chave prim?ria ? tabela dim_Funcao

USE DW;

ALTER TABLE dim_Funcao
ADD CONSTRAINT PK_dim_Funcao PRIMARY KEY (codigo);


-- Dimens?o Item

USE DW;

SELECT cod_item AS codigo
      ,dsc_item AS descricao
	INTO dim_Item
  FROM ODS..tb_exec_fin_tratada;


-- Adicionar a chave prim?ria ? tabela dim_Item

USE DW;

ALTER TABLE dim_Item
ADD CONSTRAINT PK_dim_Item PRIMARY KEY (codigo);


-- Dimens?o Item Elemento

USE DW;

SELECT cod_item_elemento AS codigo
      ,dsc_item_elemento AS descricao
	INTO dim_ItemElemento
  FROM ODS..tb_exec_fin_tratada;


-- Adicionar a chave prim?ria ? tabela dim_ItemElemento

USE DW;

ALTER TABLE dim_ItemElemento
ADD CONSTRAINT PK_dim_ItemElemento PRIMARY KEY (codigo);


-- Dimens?o Item Categoria

USE DW;

SELECT cod_item_categoria AS codigo
      ,dsc_item_categoria AS descricao
	INTO dim_ItemCategoria
  FROM ODS..tb_exec_fin_tratada;


-- Adicionar a chave prim?ria ? tabela dim_ItemCategoria

USE DW;

ALTER TABLE dim_ItemCategoria
ADD CONSTRAINT PK_dim_ItemCategoria PRIMARY KEY (codigo);


-- Dimens?o Item Grupo

USE DW;

SELECT cod_item_grupo AS codigo
      ,dsc_item_grupo AS descricao
	INTO dim_ItemGrupo
  FROM ODS..tb_exec_fin_tratada;


-- Adicionar a chave prim?ria ? tabela dim_ItemGrupo

USE DW;

ALTER TABLE dim_ItemGrupo
ADD CONSTRAINT PK_dim_ItemGrupo PRIMARY KEY (codigo);


-- Dimens?o Item Modalidade

USE DW;

SELECT cod_item_modalidade AS codigo
      ,dsc_item_modalidade AS descricao
	INTO dim_ItemModalidade
  FROM ODS..tb_exec_fin_tratada;


-- Adicionar a chave prim?ria ? tabela dim_ItemModalidade

USE DW;

ALTER TABLE dim_ItemModalidade
ADD CONSTRAINT PK_dim_ItemModalidade PRIMARY KEY (codigo);


-- Dimens?o Programa

USE DW;

SELECT cod_programa AS codigo
      ,dsc_programa AS descricao
	INTO dim_Programa
  FROM ODS..tb_exec_fin_tratada;

-- Adicionar a chave prim?ria ? tabela dim_Programa

USE DW;

ALTER TABLE dim_Programa
ADD CONSTRAINT PK_dim_Programa PRIMARY KEY (codigo);


-- Dimens?o Subfuncao

USE DW;

SELECT cod_subfuncao AS codigo
      ,dsc_subfuncao AS descricao
	INTO dim_Subfuncao
  FROM ODS..tb_exec_fin_tratada;

-- Adicionar a chave prim?ria ? tabela dim_Programa

USE DW;

ALTER TABLE dim_Subfuncao
ADD CONSTRAINT PK_dim_Subfuncao PRIMARY KEY (codigo);


-- Fato execucao financeira

USE DW;

SELECT 
		id,
		num_ano,
		cod_ne,
		codigo_orgao,
		cod_credor,
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
		dth_processamento AS processamento,
		num_ano_np
	INTO fato_execucao_financeira
  FROM ODS..tb_exec_fin_tratada;


-- Adicionar a chave prim?ria ? tabela fato_execucao_financeira

USE DW;

ALTER TABLE fato_execucao_financeira
ADD CONSTRAINT PK_fato_execucao_financeira PRIMARY KEY (id);


-- Adicionar chaves estrangeiras na tabela fato

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


-- Dimens?o Calend?rio

--- Criar a tabela dimens?o calend?rio

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
	num_feriados BIT,
    
);


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

-- Preencher feriados
-- Os feriados nacionais foram retirados do site https://www.anbima.com.br/feriados/

-- Atualiza??o dos feriados de 2019
UPDATE Dim_Calendario
SET feriados = 'Confraterniza??o Universal', num_feriados = 1
WHERE data = '2019-01-01';

UPDATE Dim_Calendario
SET feriados = 'Carnaval', num_feriados = 1
WHERE data IN ('2019-03-04', '2019-03-05');

UPDATE Dim_Calendario
SET feriados = 'Paix?o de Cristo', num_feriados = 1
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
SET feriados = 'Independ?ncia do Brasil', num_feriados = 1
WHERE data = '2019-09-07';

UPDATE Dim_Calendario
SET feriados = 'Nossa Sr.a Aparecida - Padroeira do Brasil', num_feriados = 1
WHERE data = '2019-10-12';

UPDATE Dim_Calendario
SET feriados = 'Finados', num_feriados = 1
WHERE data = '2019-11-02';

UPDATE Dim_Calendario
SET feriados = 'Proclama??o da Rep?blica', num_feriados = 1
WHERE data = '2019-11-15';

UPDATE Dim_Calendario
SET feriados = 'Natal', num_feriados = 1
WHERE data = '2019-12-25';

-- Atualiza??o dos feriados de 2020

UPDATE Dim_Calendario
SET feriados = 'Confraterniza??o Universal', num_feriados = 1
WHERE data = '2020-01-01';

UPDATE Dim_Calendario
SET feriados = 'Carnaval', num_feriados = 1
WHERE data IN ('2020-02-24', '2020-02-25');

UPDATE Dim_Calendario
SET feriados = 'Paix?o de Cristo', num_feriados = 1
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
SET feriados = 'Independ?ncia do Brasil', num_feriados = 1
WHERE data = '2020-09-07';

UPDATE Dim_Calendario
SET feriados = 'Nossa Sr.a Aparecida - Padroeira do Brasil', num_feriados = 1
WHERE data = '2020-10-12';

UPDATE Dim_Calendario
SET feriados = 'Finados', num_feriados = 1
WHERE data = '2020-11-02';

UPDATE Dim_Calendario
SET feriados = 'Proclama??o da Rep?blica', num_feriados = 1
WHERE data = '2020-11-15';

UPDATE Dim_Calendario
SET feriados = 'Natal', num_feriados = 1
WHERE data = '2020-12-25';

-- Atualiza??o dos feriados de 2021

UPDATE Dim_Calendario
SET feriados = 'Confraterniza??o Universal', num_feriados = 1
WHERE data = '2021-01-01';

UPDATE Dim_Calendario
SET feriados = 'Carnaval', num_feriados = 1
WHERE data IN ('2021-02-15', '2021-02-16');

UPDATE Dim_Calendario
SET feriados = 'Paix?o de Cristo', num_feriados = 1
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
SET feriados = 'Independ?ncia do Brasil', num_feriados = 1
WHERE data = '2021-09-07';

UPDATE Dim_Calendario
SET feriados = 'Nossa Sr.a Aparecida - Padroeira do Brasil', num_feriados = 1
WHERE data = '2021-10-12';

UPDATE Dim_Calendario
SET feriados = 'Finados', num_feriados = 1
WHERE data = '2021-11-02';

UPDATE Dim_Calendario
SET feriados = 'Proclama??o da Rep?blica', num_feriados = 1
WHERE data = '2021-11-15';

UPDATE Dim_Calendario
SET feriados = 'Natal', num_feriados = 1
WHERE data = '2021-12-25';

-- Atualiza??o dos feriados de 2022

UPDATE Dim_Calendario
SET feriados = 'Confraterniza??o Universal', num_feriados = 1
WHERE data = '2022-01-01';

UPDATE Dim_Calendario
SET feriados = 'Carnaval', num_feriados = 1
WHERE data IN ('2022-02-28', '2022-03-01');

UPDATE Dim_Calendario
SET feriados = 'Paix?o de Cristo', num_feriados = 1
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
SET feriados = 'Independ?ncia do Brasil', num_feriados = 1
WHERE data = '2022-09-07';

UPDATE Dim_Calendario
SET feriados = 'Nossa Sr.a Aparecida - Padroeira do Brasil', num_feriados = 1
WHERE data = '2022-10-12';

UPDATE Dim_Calendario
SET feriados = 'Finados', num_feriados = 1
WHERE data = '2022-11-02';

UPDATE Dim_Calendario
SET feriados = 'Proclama??o da Rep?blica', num_feriados = 1
WHERE data = '2022-11-15';

UPDATE Dim_Calendario
SET feriados = 'Natal', num_feriados = 1
WHERE data = '2022-12-25';



