FROM node:18-slim

WORKDIR /usr/src/app 

# Copia o package.json e o package-lock.json
COPY package*.json ./

# Instalando as dependências
RUN npm install

# Copia tudo da interface para dentro do container
COPY . .

# Gera o Build da aplicação
RUN npm run build

# Expõe uma porta
EXPOSE 3000

# Sobe a aplicação
CMD ["npm", "run", "start"]


# ----------------------------------------------------------------------- SEM BOAS PRATICAS

# FROM node:18-slim

# # // Diretório para trabalhar dentro da imagem -> Rodando Debian Linux
# WORKDIR /usr/src/app 

# # Copiando o arquivo package.json para dentro do container
# COPY package.json ./

# # Instalando as dependências
# RUN npm install

# # Copia tudo da interface para dentro do container
# COPY . .

# # Gera o Build da aplicação
# RUN npm run build

# # Expõe uma porta
# EXPOSE 3000

# # Sobe a aplicação
# CMD ["npm", "run", "start"]