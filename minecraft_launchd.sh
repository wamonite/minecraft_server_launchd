#!/bin/bash
trap 'echo "$(date): Stopping Minecraft"; ./minecraft_stop.sh; exit' TERM
ipconfig waitall
echo "$(date): Starting Minecraft"
./minecraft_start.sh &
wait
echo "$(date): Minecraft exited"
