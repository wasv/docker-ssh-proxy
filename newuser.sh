#!/bin/sh

USER="$1"

KEY="$2"

if [ -z "${USER}" ]; then
  echo >&2 'Please set a USER variable or pass a username as the first argument.'
  exit 1
fi

if [ -z "${KEY}" ]; then
  echo >&2 'Please set a KEY variable or pass a publickey as the second argument.'
  exit 1
fi

adduser -D ${USER}

mkdir -pv /home/${USER}/.ssh

PORT=$(($(id -u ${USER})*10 + ${RANDOM}%10000))

echo $KEY permitlisten=\":$PORT\" >> /home/${USER}/.ssh/authorized_keys
echo $PORT
