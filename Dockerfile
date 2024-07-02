# Stage 1: Build
FROM node:18 AS build
WORKDIR /app
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/park-jw-github/frontend-crud-deploy-and-add-certificate-skill-career-project.git .
RUN npm install
RUN npm run build

# Stage 2: Serve
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80

