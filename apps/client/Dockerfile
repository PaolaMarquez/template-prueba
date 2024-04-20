# Usar una imagen base de Node.js
FROM node:14

# Establecer el directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copiar los archivos necesarios
COPY package.json /usr/src/app/

# Instalar las dependencias del proyecto
RUN npm install

# Copiar el resto de los archivos del proyecto
COPY . .

# Exponer el puerto que tu aplicación utiliza
EXPOSE 3001

# Comando para ejecutar la aplicación
CMD [ "npm", "run", "dev" ]
