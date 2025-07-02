# Use uma imagem base oficial do Python.
# python:3.10-slim é uma boa escolha por ser leve.
FROM python:3.10-slim

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências do projeto
# --no-cache-dir para não armazenar o cache do pip e manter a imagem menor
# --upgrade pip para garantir que a versão mais recente do pip seja usada
RUN pip install --no-cache-dir --upgrade pip -r requirements.txt

# Copia todo o código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta que a aplicação vai rodar
EXPOSE 8000

# Comando para executar a aplicação quando o contêiner iniciar
# Usamos 0.0.0.0 para que a aplicação seja acessível de fora do contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]