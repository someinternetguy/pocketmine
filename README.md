## Pocketmine Docker Image

Run a [pocketmine server](http://www.pocketmine.net) in no time. This docker file builds the latest __development__ version of Pocketmine. 

Builds will also be tagged with the _build number_ as reported by http://www.pocketmine.net.

### To run a Pocketmine server in a docker container

```bash
docker pull mecolosimo/pocketmine:latest
mkdir ~/pocketmine
docker run -d -p 19132:19132 -p 19132:19132/udp -v /home/${USER}/pocketmine:/pocketmine --name pocketmine mecolosimo/pocketmine:latest
```

You can now connect to the hosts's IP address (or hostname) at Pocketmine's default port: 19132. Both RCON and game play listen on the same port. RCON on the TCP connection and game play on the UDP connection. 

To verify that the Pocketmine server started you can request the container's logs:

```bash
docker logs pocketmine
```

Here's typical response:

```bash
00:48:17 [INFO] Starting Minecraft: PE server version v0.9.5 alpha
00:48:17 [INFO] Loading pocketmine.yml...
00:48:17 [INFO] Loading server properties...
00:48:17 [INFO] Starting remote control listener
00:48:17 [INFO] RCON running on 0.0.0.0:19132
00:48:17 [INFO] Starting Minecraft PE server on 0.0.0.0:19132
00:48:17 [INFO] This server is running PocketMine-MP version Alpha_1.4dev-668 "絶好(Zekkou)ケーキ(Cake)" (API 1.6.0)
00:48:17 [INFO] PocketMine-MP is distributed under the LGPL License
00:48:18 [NOTICE] Level "world" not found
00:48:18 [INFO] Preparing level "world"
00:48:18 [NOTICE] Spawn terrain for level "world" is being generated in the background
00:48:18 [INFO] Starting GS4 status listener
00:48:18 [INFO] Setting query port to 19132
00:48:18 [INFO] Query running on 0.0.0.0:19132
00:48:18 [INFO] Default game type: SURVIVAL
00:48:18 [INFO] Done (1.074s)! For help, type "help" or "?"
```

The server starts by default in _survival_ mode and generates a new world.

### Making changes to the configuration

First stop pocketmine then make changes to the server.properties file. You can also add plugins.

```bash
docker stop pocketmine
# edit server.properties
docker start pocketmine
```

