FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

# Previous block is complete when new FROM statement appears
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html