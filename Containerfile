FROM debian:trixie
ENV container=container
RUN apt-get update \
 && apt-get install --yes --no-install-recommends systemd-sysv sudo build-essential debhelper lintian \
 && rm -rf /var/lib/apt/lists/*
RUN systemctl set-default multi-user.target && systemctl mask console-getty.service
