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
EXPOSE 80
#check docker hub for nginx, /usr/share/nginx/htmldocker pull dockerleho8808g/docker-react
COPY --from=builder /app/build /usr/share/nginx/html 
