#!/bin/bash

remoteport=$(sqlite3 /opt/sshjump/sshjump.db 'select port from sshjump')
localport=22333

autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R $remoteport:localhost:$localport root@remotehost.com -p 22333 -i /opt/sshjump/id_rsa
