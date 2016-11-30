FROM mhart/alpine-node:latest

MAINTAINER Jacqueline Portier

COPY  . /var/www
WORKDIR /var/www
RUN npm install

EXPOSE 3000

# The ENTRYPOINT specifies a command that will always be executed when the container starts. 
# The CMD specifies arguments that will be fed to the ENTRYPOINT
# The binary that is executed
ENTRYPOINT ["node","app.js"]