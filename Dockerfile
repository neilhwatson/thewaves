FROM perl:5.24
MAINTAINER Neil Watson <neil@watson-wilson.ca>
EXPOSE 3000
LABEL site="thewavesbeachhouse.ca"

RUN cpanm -n Mojolicious \
   && rm -fr /root/.cpan* \
   && useradd web -md /var/thewaves \
   && chown -R web:web /var/thewaves

USER web
COPY app/ /var/thewaves/app
WORKDIR /var/thewaves/app

ENTRYPOINT [ "perl", "CottageS.pl", "prefork" ]

# Howto:

# Build with docker build -t thewavesbeachhouse.ca .

# View with docker images

# Run with, where host port 3000 is mapped to conatiner port 3000, exposed by
# Docker file
# docker run --cap-drop=all --cap-add=net_bind_service --restart=unless-stopped --detach --publish 3000:3000 --name thewavesbeachhouse.ca -t thewavesbeachhouse.ca

# Stop with
# docker stop $(docker ps |awk '$2 ~ /^thewavesbeachhouse.ca/ { print $1 }')

# start with
# docker start $(docker ps |awk '$2 ~ /^thewavesbeachhouse.ca/ { print $1 }')

# Delete container
# docker rm $(docker ps -a |awk '$2 ~ /^thewavesbeachhouse.ca/ { print $1 }')

# Delete build image with 
# docker rmi $(docker images |awk '$1 ~ /^thewavesbeachhouse.ca$/ { print $3 }')
