# Imagen base
FROM node:23.1-slim

LABEL developer="ferran"

# Especificar el directorio de trabajo en la imagen docker
WORKDIR /app

# Copiar los fichero del proyecto
# Empezamos por los que cargan las dependencias
# COPY package.json
# COPY package-lock.json
COPY package*.json ./

# Ahora necesitamos obtener los módulos
RUN npm install \
    && npm cache clean --force \
    && rm -rf /tmp/* /root/.npm/_cacache
    

# Copiar el directorio de la aplicación
# COPY /src /app/
COPY . .

EXPOSE 8000

ENV PORT=8000

# Ejecuta la aplicación
# CMD ["node", "src/index.js"]
CMD ["npm", "start"]

# Ja es pot executar amb
# docker build -t node-game .

# Copiar script
# COPY ...
# Definir el punto de entrada com a script
# ENTRYPOINT [ "executable" ]

