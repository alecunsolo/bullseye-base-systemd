FROM debian:11-slim

LABEL org.opencontainers.image.source=https://github.com/alecunsolo/debian-base-systemd
LABEL org.opencontainers.image.description="Basic systemd-enabled debian image"
LABEL org.opencontainers.image.licenses=MIT

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y systemd \
    && apt-get clean \
    && truncate -s0 /etc/machine-id \
    && truncate -s0 /var/lib/dbus/machine-id

CMD ["/lib/systemd/systemd"]
