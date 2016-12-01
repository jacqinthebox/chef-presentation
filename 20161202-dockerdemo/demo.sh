docker run -d -p 8080:80 nginx

# diverse commands
#docker -d #daemon -p #port -t -i  
docker inspect containername grep
docker ps -a -q
docker stop 
docker images
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)

## mount a volume
# docker preferences!
#mkdir html
docker run -d -p 8081:80 -v $(pwd)/html:/usr/share/nginx/html nginx


## copy a folder and build a new container
FROM nginx
COPY html /usr/share/nginx/html

docker build -t newimage .
docker run -p 8082:80 newimage

## terminal access
docker exec -i -t <name>  /bin/bash

## complexere dockerfile
docker build -t jaab .

## webserver en een database server
## netwerk
docker network ls
docker network create --driver bridge isolated_nw
docker run -d --net=isolated_nw --name dbserver -v /Users/jacqueline/code/temp/jaab-js/data:/data/db mongo
docker network inspect
docker run --net=isolated_nw -itd --name jaabinstance -p 3000:3000 jaab
docker network inspect

## docker compose (automatisch)
docker-compose build
docker-compose up
# checking
docker images
ctrl-c 
docker-compose down
docker-compose up -d
docker-compose ps
docker-compose logs
docker images

## Azure
azure login
azure account list
docker-machine create -d azure --azure-ssh-user ops --azure-subscription-id 6b9f4039-bac1-4573-ac35-068a1073ed38  --azure-open-port 80 docker-platform3
#docker-machine.exe env --shell powershell docker-platform2 | Invoke-Expression
docker eval "$(docker-machine env docker-platform3)"
docker-machine active
docker-machine list