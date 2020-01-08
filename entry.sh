#!/bin/sh

mkdir -pv /data/host_keys/etc/ssh
ssh-keygen -A -f /data/host_keys
/usr/sbin/sshd -De
