# Docker Demo

## Windows 10 users
Install Docker for Windows beta

```Powershell
iwr http://bit.ly/2fxzaOR -UseBasicParsing | iex
```

If you run Virtualbox: it is not possible to run two hypervisors at the same time. You need to alter the bootmenu.
https://marcofranssen.nl/switch-between-hyper-v-and-virtualbox-on-windows/   

#### Pull some of these bulky images
```
docker pull microsoft/windowsservercore
docker pull microsoft/mssql-server-windows-express
docker pull microsoft/nanoserver
```

### Run your first container
```
docker run --name some-nginx -d -p 8080:80 nginx
```

### Household
```
docker inspect
docker ps
docker stop #fs
docker images
```

remove all containers
```
docker rm $(docker ps -a -q)

```

remove all images
```
docker rmi $(docker images -q)
``` 
of

```
docker images | awk '{print $3}' | xargs docker rmi --force
```

### create a Docker container
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

```
docker build -t newimage .
docker run -p 8080:80 newimage
```

terminal access
```
docker exec -i -t  /bin/bash
```

sharing volumes
```
docker run -d -p 27017:27017 -v /home/jacqueline/code/jaab-js/data:/data/db mongo
```

Docker compose

## Hackathon of whatever

### 1. Easy Node.js app

Clone de repo

```
git clone https://github.com/jacqinthebox/node-express-starter.git

cd node-express-starter
```

Checkout de Dockerfile! Creeer het container image (vergeet de punt niet)

```
docker build -t eic/node-express-starter .
```

Start de container:

```
docker run -d -p 8080:3000 eic/node-express-starter
```


### 2. Complex Node.js + Mongodb database

Docker Compose

```

```


### 3. Host on Azure

```
docker-machine create -d azure --azure-ssh-user ops --azure-subscription-id thw45kukldsd38  --azure-open-port 80 docker-platform2

docker-machine.exe env --shell powershell docker-platform2 | Invoke-Expression
docker-machine active
docker-machine list

```


### 4. Installeer de Powershell beta in een container

