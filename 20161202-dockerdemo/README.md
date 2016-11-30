# Docker Demo

## Windows 10 users
Install Docker for Windows beta

```Powershell
iwr http://bit.ly/2fxzaOR -UseBasicParsing | iex
```

If you run Virtualbox: it is not possible to run two hypervisors at the same time. You need to alter the bootmenu.
https://marcofranssen.nl/switch-between-hyper-v-and-virtualbox-on-windows/   

#### Pull some of these images
```
docker pull microsoft/windowsservercore
docker pull microsoft/mssql-server-windows-express
docker pull microsoft/nanoserver
```

# Opdrachten

## Installeer de Powershell beta in een container en mount a volume!


## Easy Node.js app

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

Maak een nieuwe container met een eigen website. 


## Complex Node.js + Mongodb database

Met docker compose en host deze in Azure (vraag bij mij credentials en subscriptionId)

```
docker-machine create -d azure --azure-ssh-user ops --azure-subscription-id thw45kukldsd38  --azure-open-port 80 docker-platform2
docker-machine.exe env --shell powershell docker-platform2 | Invoke-Expression
docker-machine active
docker-machine list
```

## Maak een dockerfile van de Pet Clinic 
De PetClinic is een voorbeeldapplicatie geschreven in Java Spring.
https://github.com/spring-projects/spring-petclinic
(Google is je vriend)

## Verzin zelf wat leuks
https://blog.sixeyed.com/1-2-3-iis-running-in-nano-server-in-docker-on-windows-server-2016/
https://blogs.msdn.microsoft.com/jcorioland/2016/10/13/getting-started-with-windows-containers/
