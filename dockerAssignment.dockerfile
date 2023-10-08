FROM node:10-alpine as build
LABEL maintainer = "Steven Yang"
COPY app.js package.json views/ ./
WORKDIR /usr/src/app
EXPOSE 8080 
RUN npm install --only=production1
ENTRYPOINT ["node", "./app.js"]