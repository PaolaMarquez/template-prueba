# Usar una imagen base de Node.js
FROM node:14

# Establecer el directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copiar los archivos necesarios
COPY .eslintrc.js /usr/src/app/
COPY package-lock.json /usr/src/app/
COPY package.json /usr/src/app/
COPY tsconfig.json /usr/src/app/
COPY packages/. /usr/src/app/

# Instalar las dependencias del proyecto
RUN npm install

# Copiar el resto de los archivos del proyecto
COPY . .

# Exponer el puerto que tu aplicación utiliza
EXPOSE 3000
EXPOSE 3001
EXPOSE 3002

# Comando para ejecutar la aplicación
CMD [ "npm", "run", "dev" ]
