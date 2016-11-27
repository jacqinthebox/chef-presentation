# iwr http://bit.ly/2fxzaOR -UseBasicParsing | iex

docker run -p 80:80 --name nginx smebberson/alpine-nginx


docker inspect
docker ps
docker stop #fs
docker images
docker images | awk '{print $3}' | xargs docker rmi --force
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)

docker run --name some-nginx -d -p 8080:80 nginx

# create a container
FROM nginx
COPY html /usr/share/nginx/html

```
<html>
<body>
<h1>Hallo</h1>
<img src="https://dl.dropboxusercontent.com/u/25670673/docker-beta.jpg" width="50%" height="50%">
</body
<html>
```

docker build -t newimage .
docker run -p 8080:80 newimage




# terminal access
docker exec -i -t  romantic_varahamihira /bin/bash

# sharing volumes

# accessing a database

# loadbalancing

# Hackathon
# Maak een web app met een loadbalancer en zorg dat ie automatisch update als er een nieuwe versie is. 
