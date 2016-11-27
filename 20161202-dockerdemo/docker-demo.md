## Install Docker and Kitematic
iwr http://bit.ly/2fxzaOR -UseBasicParsing | iex

## Run your first container
docker run --name some-nginx -d -p 8080:80 nginx

## Household
docker inspect
docker ps
docker stop #fs
docker images

### remove all containers
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)

### remove all images
docker images | awk '{print $3}' | xargs docker rmi --force

## create a Docker container
Create a file named Dockerfile

```
FROM nginx
COPY html /usr/share/nginx/html
```

Create a folder named html and add index.html

```html
<html>
<body>
<h1>Hallo</h1>
<img src="https://dl.dropboxusercontent.com/u/25670673/docker-beta.jpg" width="50%" height="50%">
</body
</html>
```

Next, build the image:

docker build -t newimage .
docker run -p 8080:80 newimage

# terminal access
docker exec -i -t  romantic_varahamihira /bin/bash

# sharing volumes

# accessing a database

# loadbalancing

# Hackathon
# Maak een web app met een loadbalancer en zorg dat ie automatisch update als er een nieuwe versie is. 
