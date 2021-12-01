#Mult Strategy Builder
# Full Version 
FROM node:16-slim as BUILDER 
LABEL maintainer="Eduardo Alcantara de Oliveira"

# Folder to work
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

COPY src ./src

#Mult Strategy Builder
#Softy version
FROM node:16-alpine

ARG NODE_ENV

WORKDIR /usr/src/app
# from previous stage(BUILDER)
COPY --from=BUILDER /usr/src/app/ ./

EXPOSE 3000

CMD [ "npm", "start" ]