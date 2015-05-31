FROM bartt/ubuntu-base
MAINTAINER Marc Colosimo <enzo69mc@gmail.com>

RUN apt-get -y install python3-yaml

VOLUME /pocketmine
WORKDIR /pocketmine

# make local pocketmine directory
RUN mkdir /pocketmine-build
RUN cd /pocketmine-build && curl -sL http://get.pocketmine.net/ | bash -s - -r -v stable

# get PocketDockConsole - need v0.0.11 for pockermine 1.4 stable
RUN mkdir /pocketmine-build/plugins
RUN cd /pocketmine-build/plugins && curl -sL -J -O http://forums.pocketmine.net/plugins/pocketdockconsole.698/download?version=2059

# pocketmine's main UDP port
EXPOSE 19132

# PocketDockConsole port
EXPOSE 9090

# script needed to work around docker/pocketmine limitations
COPY docker-start.sh /pocketmine-build/

WORKDIR /pocketmine-build

CMD ["./docker-start.sh", "--no-wizard", "--enable-rcon=off"]