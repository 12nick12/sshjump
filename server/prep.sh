dir=/opt/sshjump
username=sshjump

adduser $username
chmod -R $username:$username $dir 
sqlite3 $dir/sshjump.db 'create table sshjump(host, ip, port, id);'
