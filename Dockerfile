FROM node:14
WORKDIR /app

# Copia los archivos de la aplicación
COPY .eslintrc.js .
COPY jsDocConfig.json .
COPY tsconfig.json .
COPY turbo.json .
COPY package.json .
COPY package-lock.json .
RUN npm install

# Copia el código fuente de la aplicación
COPY . .

# Expone los puertos
EXPOSE 3000
EXPOSE 3001
EXPOSE 3002

# Comando para iniciar la aplicación
CMD ["npm", "run", "dev"]