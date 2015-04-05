#!/bin/bash

# hack because docker can't build this on a mounted volume, if not mounted it is okay
rsync -a /pocketmine-build/ /pocketmine/
cd /pocketmine
./start.sh $@
