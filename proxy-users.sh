#!/bin/sh

USER="$1"

KEY="$2"

if [ -z "${USER}" ]; then
  echo >&2 'Please set a USER variable or pass a username as the first argument.'
  exit 1
fi

if [ -z "${KEY}" ]; then
  cat /data/ssh/${USER}/.ssh/authorized_keys
  exit 0
fi

adduser -h /data/ssh/${USER}/ -D ${USER}

mkdir -pv /data/ssh/${USER}/.ssh

PORT=$(($(id -u ${USER})*10 + ${RANDOM}%10000))

echo $KEY permitlisten=\":$PORT\" >> /data/ssh/${USER}/.ssh/authorized_keys
echo $PORT
