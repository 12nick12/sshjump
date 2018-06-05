#!/bin/bash

dir=/opt/sshjump
remoteport=$(sqlite3 $dir/sshjump.db 'select port from sshjump')
localport=22333

autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R $remoteport:localhost:$localport root@remotehost.com -p 22333 -i $dir/id_rsa
