#!/bin/sh

mkdir -pv /data/ssh/etc/ssh
ssh-keygen -A -f /data/ssh
/usr/sbin/sshd -De
