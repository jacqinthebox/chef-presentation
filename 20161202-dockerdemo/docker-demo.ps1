
docker run -p 80:80 --name nginx smebberson/alpine-nginx


docker inspect
docker ps
docker stop #fs
docker images
docker images | awk '{print $3}' | xargs docker rmi --force
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)

# terminal access
# sharing volumes
# running a website

# accessing a database

# loadbalancing

# Hackathon
# Maak een web app met een loadbalancer en zorg dat ie automatisch update als er een nieuwe versie is. 