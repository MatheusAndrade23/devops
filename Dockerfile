# PRIMEIRO ESTÁGIO

FROM node:18 AS build

WORKDIR /usr/src/app 

COPY package*.json ./

RUN npm i

COPY . .

RUN npm run build

RUN npm ci --omit=dev

# SEGUNDO ESTÁGIO

FROM node:18-alpine3.21

WORKDIR /usr/src/app 

COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/node_modules ./node_modules


EXPOSE 3000

CMD ["npm", "run", "start:prod"]


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