# Use a imagem oficial do Python como base, versão 3.13.5 com Alpine Linux.
# Alpine é uma distribuição Linux leve, resultando em uma imagem menor.
FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho dentro do contêiner.
# Todos os comandos subsequentes serão executados neste diretório.
WORKDIR /app

# Copia o arquivo requirements.txt para o diretório de trabalho.
# Este arquivo contém as dependências do projeto.
COPY requirements.txt .

# Instala as dependências Python listadas em requirements.txt.
# A flag --no-cache-dir evita o armazenamento de cache do pip, diminuindo o tamanho da imagem.
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código do projeto para o diretório de trabalho.
COPY . .

# Expõe a porta 8001, que será usada pela aplicação.
EXPOSE 8001

# Define o comando a ser executado quando o contêiner for iniciado.
# Inicia o servidor Uvicorn, que serve a aplicação FastAPI.
# O parâmetro --host 0.0.0.0 permite que o servidor responda a requisições de fora do contêiner.
# O parâmetro --port 8001 especifica a porta em que o servidor irá escutar.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8001", "--reload"]
