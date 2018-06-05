#!/bin/bash

host=$(hostname)
ip=$(curl -s https://canihazip.com/s)
port=$(shuf -i 9151-49151 -n 1)
id=$(shuf -i 111111111-999999999 -n 1 )
dir=/opt/sshjump

mkdir $dir

ssh-keygen -t rsa -f $dir/id_rsa -q -N ""

chmod 400 $dir/id_rsa*

cat $dir/id_rsa.pub | ssh -p port root@remotehost.com "mkdir -p ~/.ssh; chmod 700 ~/.ssh; cat >> ~/.ssh/authorized_keys"

sqlite3 $dir/sshjump.db 'create table sshjump(host, ip, port, id);'

sqlite3 $dir/sshjump.db "INSERT INTO sshjump(host, ip, port, id) VALUES(\"$host\", \"$ip\", \"$port\", \"$id\");"

echo "INSERT INTO sshjump(host, ip, port, id) VALUES(\"$host\", \"$ip\", \"$port\", \"$id\");" | ssh -p 22333 root@remotessh.nicks.tv "sqlite3 /opt/sshjump/sshjump.db"