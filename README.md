## Pocketmine Docker Image

Run a [pocketmine server](http://www.pocketmine.net) in no time. This docker file builds the latest __development__ version of Pocketmine. 

Builds will also be tagged with the _build number_ as reported by http://www.pocketmine.net.

### To run a Pocketmine server in a docker container

```bash
docker pull mecolosimo/pocketmine:latest
mkdir ~/pocketmine
docker run -d -p 22 -p 19132:19132/udp -p 9001:9001 -v /home/${USER}/pocketmine:/pocketmine --name pocketmine mecolosimo/pocketmine:latest
```

You can now connect to the hosts's IP address (or hostname) at Pocketmine's default port: 19132. Both RCON and game play listen on the same port. RCON on the TCP connection and game play on the UDP connection. 

Supervisord's http server listens on port 9001. You can remap that to another port if you already have another http server listening on that port.

sshd listens on port 22 and since we DON'T want to block our own sshd we let docker map it to a random port. 

To verify that the Pocketmine server started you can request the container's logs:

```bash
docker logs pocketmine
```

Here's typical response:

```bash

```

The server starts by default in _survival_ mode and generates a new world.

### Making changes to the configuration

First stop pocketmine then make changes to the server.properties file. You can also add plugins.

```bash
docker stop pocketmine
# add plugins
# edit server.properties, permissions, etc...
docker start pocketmine
```

