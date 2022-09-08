#!/usr/bin/env bash

ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $ip
display_number=`ps -ef | grep "Xquartz :\d" | grep -v xinit | awk '{ print $9; }'`
docker run -ti --name DockedEmacs\
 -e DISPLAY=$ip$display_number\
 -e UNAME="planetraveller"\
 -e GNAME="root"\
 -e UID="1000"\
 -e GID="1000"\
 -v /Users/wanghuayu/Desktop/DockedEmacs/home:/home/planetraveller\
 -v /Users/wanghuayu/Desktop:/home/planetraveller/Workspace\
 deckmacs emacs

