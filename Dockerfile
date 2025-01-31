# FROM node:alpine as builder

# WORKDIR '/usr/src/app'

# COPY package.json .
# RUN npm install
# COPY ./ ./
# RUN npm run build

# FROM nginx
# EXPOSE 80
# COPY --from=builder /usr/src/app/build /usr/share/nginx/html

FROM node:16-alpine as builder
WORKDIR '/usr/src/app'
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html


