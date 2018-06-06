#!/bin/bash

dir=/opt/sshjump
servername=user@test.test.com
usersname=sshjump
serviceport=22
remoteport=$(sqlite3 $dir/sshjump.db 'select port from sshjump')
localport=22

until ping -c1 google.com &>/dev/null; do :; done
autossh -N -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R $remoteport:localhost:$localport $username@$servername -p $serverport -i $dir/id_rsa
