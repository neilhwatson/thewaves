FROM  perl:5.24
MAINTAINER  Neil Watson <neil@watson-wilson.ca>
EXPOSE 3000
LABEL site="thewavesbeachhouse.ca"
LABEL version="1.0"

RUN cpanm -n Mojolicious
COPY app/ /var/thewaves
WORKDIR /var/thewaves
CMD [ "./CottageS.pl", "prefork" ]

# TODO add --drop-cap

# Howto:

# Build with  docker build -t thewavesbeachhouse.ca .

# View with   docker images

# Run with, where host port 8000 is mapped to conatiner port 80, exposed by
# Docker file
# docker run --cap-drop=all --cap-add=chown --cap-add=net_bind_service --cap-add=setgid --cap-add=setuid --detach --publish 8000:80 --name thewavesbeachhouse.ca -t thewavesbeachhouse.ca

# Stop with
# docker stop $(docker ps |awk '$2 ~ /^thewavesbeachhouse.ca/ { print $1 }')

# start with
# docker start $(docker ps |awk '$2 ~ /^thewavesbeachhouse.ca/ { print $1 }')

# Delete container
# docker rm $(docker ps -a |awk '$2 ~ /^thewavesbeachhouse.ca/ { print $1 }')

# Delete build image with 
# docker rmi $(docker images |awk '$1 ~ /^thewavesbeachhouse.ca$/ { print $3 }')

