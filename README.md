# docker-archlinux-systemd

```
docker build -t myarch .
docker run --privileged -d \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    --name archcnt myarch
docker exec -it archcnt systemctl status
```
or
```
podman build -t myarch .
podman run -d --name archcnt myarch
podman exec -it archcnt systemctl status
```

#### see
https://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container/
https://developers.redhat.com/blog/2019/04/24/how-to-run-systemd-in-a-container/
