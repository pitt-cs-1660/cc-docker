FROM node:10-alpine as build
LABEL maintainer = "Steven Yang"
WORKDIR /usr/src/app
EXPOSE 8080
COPY app.js package.json .
RUN mkdir views
COPY views/ ./views
RUN npm install --only=production
ENTRYPOINT ["node", "./app.js"]