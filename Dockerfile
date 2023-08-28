FROM node:14-alpine

# Define o diretório onde a aplicação será armazenada dentro do container
WORKDIR /src

# Copia o package.json e o package-lock.json para dentro do container
COPY package*.json ./

RUN npm install

# Copia todo o conteúdo do diretório atual para dentro do container
COPY . .

EXPOSE 3000

# Inicia a aplicação procurando pelo comando definido em "start", no package.json
# Neste caso, "start": "node src/app.js"
CMD [ "npm", "start" ]
