#!/bin/sh

USER="$1"
KEY="$2"

if [ -z "${USER}" ]; then
  echo >&2 'Please set a USER variable or pass a username as the first argument.'
  exit 1
fi

if [ -z "${KEY}" ]; then
  id -u ${USER} && cat /data/auth_keys/${USER}
  exit 0
fi

PORT=$(($(id -u ${USER})+9000))

echo $KEY permitlisten=\":$PORT\" > /data/auth_keys/${USER}
echo $PORT
