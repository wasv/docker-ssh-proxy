FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add coreutils openssh-server openssh-server-pam && \
    rm -rf /var/cache/apk/*
RUN mkdir /etc/dropbear

COPY sshd_config /etc/ssh/sshd_config

COPY entry.sh /
RUN chmod +x /entry.sh

COPY proxy-users.sh /usr/bin/proxy-users
RUN chmod +x /usr/bin/proxy-users

VOLUME ["/data/ssh"]

EXPOSE 22
ENTRYPOINT /entry.sh
