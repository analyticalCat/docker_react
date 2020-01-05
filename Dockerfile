FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx as release
COPY --from=builder /app/build /usr/share/nginx/html
#we dont need to start nginx specifically.  the image does that automatically.