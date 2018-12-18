#!/bin/bash
#################自动编译安装expect##################
expect=`expect -v | awk '{print$NF}'`
if [ -n "$expect" ];then
	echo "The expect already exists!" && exit 0
else
tcl_version=/tmp/tcl.zip
expect_version=/tmp/expect5.45.3.tar.gz
if [ ! -f "$tcl_version" ];then
	echo "Make sure the target exists!"
	exit 2
fi
if [ ! -f "$expect_version" ];then
	echo "Make sure the target exists!"
	exit 2
fi
unzip $tcl_version && cd /tmp/tcl/unix
./configure &> /dev/null || { echo "The TCL configure fail" && exit 2; } 
{ make &> /dev/null && make install &> /dev/null; } || { echo "The TCL make error!" && exit 2; }
echo "The Tcl is already install!"
tar zxvf $expect_version && cd /tmp/expect5.45.3
./configure &> /dev/null || { echo "The expect configure fail" && exit 2; }
{ make &> /dev/null && make install &> /dev/null; } || { echo "The expect make error!" && exit 2; }
echo "The expect is already install!"
fi
