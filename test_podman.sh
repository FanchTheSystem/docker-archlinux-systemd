#!/usr/bin/env bash

for i in $(podman ps -a -q)
do
    podman stop $i
done

podman system prune -a -f

podman build -t myarch .

podman run -d --name archcnt myarch

sleep 30

podman exec -it archcnt systemctl status
