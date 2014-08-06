#!/bin/bash
cd "$(dirname "$0")"
rm -f minecraft.fifo
mkfifo minecraft.fifo
exec java -Xmx1G -Xms1G -jar minecraft_server.jar nogui <> minecraft.fifo
