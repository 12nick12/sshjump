# sshjump
Bash scripts to ease setting up reverse ssh tunnel for ssh to hosts behind nat

You must install sqlite3 and autossh

Debian/Ubuntu
apt install sqlite3 autossh

CentOS
yum install sqlite3 autossh

After installing everything you go on the server and use createdatabase.sh then you go to the hosts and run host/setup.sh. After the setup.sh has been ran you can run the host/start.sh on the host in a tmux or in the background. Once that's running you should be able to use the main sshjump.new script to ssh to the other devices. As far as I know the autossh should reconnect on disconnect. 

I will update with systemd scripts eventually

To use the main script once all devices are connected you can type "./sshjump.new list" this will list all hosts that have been registered

The report prints first the hostname then the ID

If you want to connect with ID you type "./sshjump.new id user $id" ex "./sshjump.new id nick 123321456"

If you want to connect with hostname you type "./sshjump.new host user hostname" ex "./sshjump.new host nick test.test.com"
