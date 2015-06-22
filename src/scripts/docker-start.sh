#!/bin/bash

cd /mnt/pocketmine
if [ ! -d logs ]; then
    mkdir logs
fi

# hack because docker can't build this on a mounted volume, if not mounted it is okay
rsync --ignore-existing -av /pocketmine-build/ /mnt/pocketmine/

#./start.sh $@
# start up supervisord
echo "Starting up supervisord..."
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
