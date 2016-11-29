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
docker exec -i -t  romantic_varahamihira /bin/bash
```
sharing volumes

*accessing a database

*loadbalancing

*Hackathon
*Maak een web app met een loadbalancer en zorg dat ie automatisch update als er een nieuwe versie is. 

