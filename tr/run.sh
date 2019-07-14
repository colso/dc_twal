#!/bin/sh

if [ ! -e /tmp/tm_pid ] 
then
    touch /tmp/tm_pid
else
    exit 0
fi

/root/tm/main.py >> /tmp/logs  &  
