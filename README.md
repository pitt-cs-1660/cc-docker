# Docker Assignment

Our project is a simple nodeJS application that shows a static HTML page with some links. The application codes in the [app.js](app.js) and dependencies are in [package.json](package.json)

## Assignment
Your job is to create a Dockerfile for this application that is able to run the server. The following criteria for the image are listed below.

- The image should be based on `node:10-alpine` image. 
- The application should be available on port `8080` inside the container. 
- The application should be started with `node ./app.js` command. 
- The working directory should be `/usr/src/app`. 
- The application should be copied and built inside the image with `npm install --only=production` command. 
- The image should have a label `maintainer` with your name as the value.

| Objectives                       | Points |
|----------------------------------|--------|
| based on `node:18-alpine`        | 2      |
| metadata with label `maintainer` | 1      |
| working directory `/usr/src/app` | 1      |
| copy and build the application   | 2      |
| use an entrypoint to run the app | 2      |
| push multi-arch image to docker hub | 2    |

## Pre-requisites
- docker -->  download it from [here](https://www.docker.com/products/docker-desktop).
- Docker Hub account if you don't have one already. You can create one [here](https://hub.docker.com/signup)
- git --> download it from [here](https://git-scm.com/downloads)


## Dockerfile Commands
The only application specific files that need to be copied to the image are `app.js` and `package.json`. You can use `COPY . .` in the Dockerfile but that is unnecessary. The nodeJS app should be installed with the `npm install --only=production`.

## Building the image
We will need to submit a multi architecture build to docker hub, so we will need to use the `buildx` feature in docker. 

To enable the `buildx` feature, run the following command in your terminal.

```bash 
# create a new builder instance with arm64 and amd64 platforms
docker buildx create --use --platform=linux/arm64,linux/amd64 --name multi-platform-builder

# build a multi architecture image
docker buildx build --platform linux/amd64,linux/arm64 -t [YOUR REPO NAME]/cs1660-assignment2:v1 .

# push the image to docker hub
docker push [YOUR REPO NAME]/cs1660-assignment2:v1
```
## Submission
- please merge you code into the main branch of the project
- [Create](https://docs.docker.com/docker-hub/quickstart/) a Docker Hub repository called `cs-1660-assignment2`
- push your image to the repository

## Docker login
Login to docker hub, run the following command in your terminal once you have a Docker Hub account.

```bash
# you will be prompted for your password
docker login --username=[DOCKER HUB LOGIN]
```

This will create an entry in your `~/.docker/config.json` file that will store your credentials.
