FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#from another step + copy the file + to nginx default location
COPY --from=builder /app/build /usr/share/nginx/html
# default command of nginx will start the nginx