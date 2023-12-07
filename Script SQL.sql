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







--- Criando o 'DW'

-- Dimensao Orgao

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




-- Dimensao Credor

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




-- Dimensao Fonte

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




-- Dimensao Funcao

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



-- Dimensao Item Elemento

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



-- Dimensao Item Categoria

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


-- Dimensao Item Grupo

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




-- Dimensao Item Modalidade

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




-- Dimensao Programa

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



-- Dimensao Subfuncao

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



-- Fato execucao financeira

-- Fato execucao financeira

DROP TABLE fato_execucao_financeira

-- Criação da tabela fato_execucao_financeira
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
    valor_empenho DECIMAL(18, 2), -- Ajuste para precisão e escala maiores
    valor_pago DECIMAL(18, 2),
    valor_resto_pagar DECIMAL(18, 2),
    data_empenho DATETIME,
    data_pagamento DATETIME,
    data_processamento DATETIME,
    num_ano_np INT
);

-- Inserção de dados distintos
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



-- Dimensao Calendario

--- Criar a tabela dimensao calendario
USE DW;
CREATE TABLE Dim_Calendario (
    id_data INT PRIMARY KEY,
    data DATE,
	data_completa DATETIME,
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
		data_completa,
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
		CAST(@data_inicio AS DATETIME),
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

-- Atualizacao dos feriados de 2019
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

-- Atualizacao dos feriados de 2020

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

-- Atualizacao dos feriados de 2021

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

-- Atualizacao dos feriados de 2022

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

