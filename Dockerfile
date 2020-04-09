#build phase
#tag or name with builder
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


#Run phase
FROM nginx
#check docker hub for nginx, /usr/share/nginx/html
COPY --from=builder /app/build /usr/share/nginx/html 
