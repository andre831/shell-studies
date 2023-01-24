#!/bin/sh
BASE_PATH="./node-container"
APP_FILE="$BASE_PATH/app.js"

echo "Creating Node.js container..."

sleep 3

mkdir node-container

ls

cd $BASE_PATH && npm init -y

sleep 2

cd -

sleep 3

echo 'const http = require("http");

const hostname = "127.0.0.1";
const port = 7000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end("Hello World");
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});' > $APP_FILE

sleep 2

if test -f "$BASE_PATH/Dockerfile"
  then
    echo "FILE EXIST"
  else
    echo 'FROM node:16

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

RUN npm install express

COPY . .

EXPOSE 7000

CMD [ "node", "app.js" ]' > $BASE_PATH/Dockerfile

  
fi

sudo docker build $BASE_PATH -t node_app

sleep 3

sudo docker run -p 7000:7000 node_app

