FROM node:16-slim

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY app.js .

# Health check
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:5000/health || exit 1

EXPOSE 5000
CMD ["node", "app.js"] 