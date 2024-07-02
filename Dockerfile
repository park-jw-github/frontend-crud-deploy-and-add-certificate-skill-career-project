# Build
FROM node:18 AS build
WORKDIR /app
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/park-jw-github/frontend-crud-deploy-and-add-certificate-skill-career-project.git .
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Serve
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app/build /app/build
RUN npm install -g serve
EXPOSE 3000
CMD ["serve", "-s", "build"]





