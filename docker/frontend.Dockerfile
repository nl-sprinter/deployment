FROM node:16-alpine AS build
WORKDIR /app
COPY sprinter-fe/package*.json ./
RUN npm install
COPY sprinter-fe .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx/conf.d/frontend.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"] 