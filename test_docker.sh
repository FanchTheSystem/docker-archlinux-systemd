#!/usr/bin/env bash

for i in $(docker ps -a -q)
do
    docker stop $i
done

docker system prune -a -f

docker build -t myarch .

docker run --privileged -d \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    --name archcnt myarch

sleep 30

docker exec -it archcnt systemctl status
