FROM node AS build

WORKDIR /app

COPY . .

RUN npm install && npm run build

FROM nginx:alpine AS prod

COPY --from=build /app/build /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]