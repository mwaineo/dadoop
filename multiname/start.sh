#!/bin/bash

service sshd start

ADDRESS=`ifconfig eth0 | grep "inet addr" | awk '{print $2}' | cut -d":" -f2`

service dnsmasq start

serf agent -event-handler=/root/handler.sh &

runuser -l hadoop -c 'hadoop namenode -format'
runuser -l hadoop -c '/usr/lib/hadoop/bin/hadoop-daemon.sh --config /usr/lib/hadoop/conf start namenode'
runuser -l hadoop -c '/usr/lib/hadoop/bin/hadoop-daemon.sh --config /usr/lib/hadoop/conf start datanode'
runuser -l hadoop -c '/usr/lib/hadoop/bin/hadoop-daemon.sh --config /usr/lib/hadoop/conf start jobtracker'
runuser -l hadoop -c '/usr/lib/hadoop/bin/hadoop-daemon.sh --config /usr/lib/hadoop/conf start tasktracker'


/bin/sh
