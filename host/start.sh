#!/bin/bash

servername=site.site.com
username=sshjump
serverport=22
dir=/opt/sshjump
remoteport=$(sqlite3 $dir/sshjump.db 'select port from sshjump')
localport=22

autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R $remoteport:localhost:$localport $username@$servername -p $serverport -i $dir/id_rsa
