# Stage 1: Build
FROM node:16 AS build
WORKDIR /app
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/park-jw-github/frontend-crud-deploy-and-add-certificate-skill-career-project.git .
RUN npm cache clean --force
RUN npm install --legacy-peer-deps
RUN npm run build

# Stage 2: Serve
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80

