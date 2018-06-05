dir /opt/sshjump
sqlite3 $dir/sshjump.db 'create table sshjump(host, ip, port, id);'
