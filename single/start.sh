#!/bin/bash

service sshd start

runuser -l hadoop -c 'hadoop namenode -format'

runuser -l hadoop -c '/usr/lib/hadoop/bin/start-all.sh'

/bin/sh
