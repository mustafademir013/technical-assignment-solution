FROM node:20-slim

WORKDIR /app

# Sistem paketlerini güncelle ve curl'u yükle
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm install

COPY app.js .

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:5000/health || exit 1

EXPOSE 5000
CMD ["node", "app.js"]