FROM archlinux/archlinux:base-devel

ENV container docker

RUN pacman -Syu --noconfirm
RUN pacman -S systemd dbus python emacs-nox bash-completion --noconfirm
RUN pacman -Scc --noconfirm

RUN rm \
    /usr/lib/systemd/system/sysinit.target.wants/systemd-firstboot.service \
    /usr/lib/systemd/system/systemd-firstboot.service

# RUN systemctl set-default multi-user.target
RUN systemctl set-default sysinit.target

VOLUME [ "/sys/fs/cgroup" ]
#, "/run", "/run/lock", "/tmp" ]

STOPSIGNAL SIGRTMIN+3

# CMD ["/usr/lib/systemd/systemd", "--log-level=info", "--unit=multi-user.target"]
CMD ["/sbin/init"]
