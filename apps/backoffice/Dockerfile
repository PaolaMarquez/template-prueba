# Usar una imagen base de Node.js
FROM node:14

# Establecer el directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copiar los archivos necesarios
COPY .eslintrc.js /usr/src/app/
COPY components.json /usr/src/app/
COPY jest.config.ts /usr/src/app/
COPY jest.setup.ts /usr/src/app/
COPY next-env.d.ts /usr/src/app/
COPY next.config.js /usr/src/app/
COPY package.json /usr/src/app/
COPY postcss.config.js /usr/src/app/
COPY sentry.dientconfig.ts /usr/src/app/
COPY sentry.edge.config.ts /usr/src/app/
COPY sentry.server.config.ts /usr/src/app/
COPY tailwind.config.ts /usr/src/app/
COPY tsconfig.json /usr/src/app/

# Instalar las dependencias del proyecto
RUN npm install

# Copiar el resto de los archivos del proyecto
COPY . .

# Exponer el puerto que tu aplicación utiliza
EXPOSE 3002

# Comando para ejecutar la aplicación
CMD [ "npm", "run", "dev" ]
