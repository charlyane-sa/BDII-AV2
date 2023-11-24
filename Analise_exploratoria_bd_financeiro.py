import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sqlalchemy import create_engine

# Configuração para conexão com o SQL Server
server = 'LAPTOP-31OL8T2A' #nome do servidor sql
database = 'Financeiro'#nome da base de dados
username = 'sa' #usuario
password = 'bdsa123' #senha

# Cria uma string de conexão para o SQLAlchemy
connection_string = f'mssql+pyodbc://{username}:{password}@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server'

# Conecta ao SQL Server usando o SQLAlchemy
engine = create_engine(connection_string)

# Consulta SQL para obter dados do banco de dados
query = 'SELECT * FROM dbo.tb_execucao_financeira'
df = pd.read_sql(query, engine)

# Exibe as primeiras linhas do DataFrame
print("Primeiras linhas do DataFrame\n")
print(df.head())
print("\n")

# Visualizando as informações de colunas do Dataframe
print("Informações de colunas do Dataframe\n")
print(df.info())
print("\n")

# Informações estatísticas das colunas Dataframe
print("Informações estatísticas das colunas Dataframe\n")
print(df.describe())
print("\n")

# Consultando dados nulos ou Missing Values no Dataframe
print("Consultando dados nulos ou Missing Values no Dataframe\n")
print(df.isnull().sum())
print("\n")



