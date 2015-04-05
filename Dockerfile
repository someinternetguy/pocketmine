FROM bartt/ubuntu-base
MAINTAINER Marc Colosimo <enzo69mc@gmail.com>

RUN apt-get -y install python3-yaml

VOLUME /pocketmine
WORKDIR /pocketmine

# make local pocketmine directory
RUN mkdir /pocketmine-build
RUN cd /pocketmine-build && curl -sL http://get.pocketmine.net/ | bash -s - -r -v development

EXPOSE 19132

# script needed to work around docker/pocketmine limitations
COPY docker-start.sh /pocketmine-build/

WORKDIR /pocketmine-build

CMD ["./docker-start.sh", "--no-wizard", "--enable-rcon=off"]