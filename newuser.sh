#!/bin/sh

if [ -n "$1" ]; then
    USER=$1
fi

if [ -z "$USER" ]; then
  echo >&2 'Please set an USER variable or pass a username as an argument.'
  exit 1
fi

PASSWD=`dd if=/dev/urandom bs=10 count=2 2>/dev/null | base32`

adduser -D ${USER} && echo "${USER}:${PASSWD}" | chpasswd billie

echo "Password: ${PASSWD}"
