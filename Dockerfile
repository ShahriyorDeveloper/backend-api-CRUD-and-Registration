# Dockerfile

# Node versiyasini belgilang
FROM node:18

# app papkasi
WORKDIR /app

# package.json va install
COPY package*.json ./
RUN npm install

# source fayllar
COPY . .

# build qilish (agar TS bo‘lsa)
RUN npm run build

# PORT environment
ENV PORT=8080

# Expose 8080 (Fly.io uchun muhim)
EXPOSE 8080

# Appni ishga tushirish
CMD ["npm", "run", "start:prod"]
