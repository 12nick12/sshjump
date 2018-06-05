#!/bin/bash

remoteport=$(sqlite3 /opt/sshjump/sshjump.db 'select port from sshjump')
localport=22

until ping -c1 google.com &>/dev/null; do :; done
autossh -N -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R $remoteport:localhost:$localport root@test.com -p 22333 -i /opt/sshjump/id_rsa
