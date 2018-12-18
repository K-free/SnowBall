#!/bin/bash
. /etc/init.d/functions
for host in $(cat /tmp/hostlist)
do
	ping -c2 $host -w 2 &> /dev/null
	if [ $? = 0 ];then
		action "$host" /bin/true
	else
		action "$host" /bin/false
	fi
done
