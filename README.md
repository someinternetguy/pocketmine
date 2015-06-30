## Pocketmine Docker Image

[![Join the chat at https://gitter.im/someinternetguy/pocketmine](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/someinternetguy/pocketmine?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Run a [pocketmine server](http://www.pocketmine.net) in no time. This docker file builds the latest __development__ version of Pocketmine. 

Builds will also be tagged with the _build number_ as reported by http://www.pocketmine.net.

### To run a Pocketmine server in a docker container

```bash
docker pull mecolosimo/pocketmine:latest
mkdir ~/pocketmine
docker run -d -p 22 -p 19132:19132/udp -p 9001:9001 -v /home/${USER}/pocketmine:/mnt/pocketmine --name pocketmine mecolosimo/pocketmine:latest
```

This mounts the local directory _pocketmine_ into the container. This is the working directory for pocketmine. Any changes to files here are seen by pocketmine when restarted.

The server starts by default in _survival_ mode and generates a new world.

You can connect to the hosts's IP address (or hostname) at Pocketmine's default port: 19132. Both RCON and game play listen on the same port. RCON on the TCP connection and game play on the UDP connection. Default configuration is for RCON to be off.

Supervisord's http server listens on port 9001. You can remap that to another port if you already have another http server listening on that port. This uses memmon (via superlance) to limit the memory used by pocketmine (default is 2 GB; see src/etc/supervisor/supervisor.conf).

sshd listens on port 22 and since we DON'T want to block our own sshd we let docker map it to a random port. 

To verify that the Pocketmine server started you can request the container's logs:

```bash
docker logs pocketmine
```

ssh'ing into the container:

```bash
ssh root@localhost -p 49100
root@0f01396c5cc9:~# supervisorctl 
memmon                           RUNNING    pid 17, uptime 20:03:35
pocketmine                       RUNNING    pid 4630, uptime 7:42:10
sshd                             RUNNING    pid 18, uptime 20:03:35

```


### Making changes to the configuration

First stop pocketmine then make changes to the server.properties file. You can also add plugins.

```bash
docker stop pocketmine
# add plugins
# edit server.properties, permissions, etc...
docker start pocketmine
```

