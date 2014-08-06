#!/bin/bash
server_pid=$(lsof -i -P | grep ':25565 (LISTEN)' | awk '{print $2}')
if [ ! -z "$server_pid" ]
then
    echo "$(date): Stopping Minecraft (pid: $server_pid)"
    echo save-all >> minecraft.fifo
    echo stop >> minecraft.fifo
    
    while true
    do
        running=$(ps axo pid | grep $server_pid)
        if [ -z "$running" ]
        then
            break
        fi

#        echo "$(date): Minecraft stopping (pid: $server_pid)"
        sleep 1
    done

    echo "$(date): Minecraft stopped"
else
    echo "$(date): Minecraft not running"
fi
