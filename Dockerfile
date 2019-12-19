FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add coreutils openssh-server && \
    rm -rf /var/cache/apk/*
RUN mkdir /etc/dropbear

COPY sshd_config /etc/ssh/sshd_config

COPY entry.sh /
RUN chmod +x /entry.sh

COPY newuser.sh /usr/bin/newuser
RUN chmod +x /usr/bin/newuser

EXPOSE 22
ENTRYPOINT /entry.sh
