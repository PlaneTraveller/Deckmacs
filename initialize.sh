#!/usr/bin/env bash

# ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
# xhost + $ip
# display_number=`ps -ef | grep "Xquartz :\d" | grep -v xinit | awk '{ print $9; }'`
docker run -ti --name tempemacs --rm\
 -e UNAME="planetraveller"\
 -e GNAME="root"\
 -e UID="1000"\
 -e GID="1000"\
 -v /Users/wanghuayu/Desktop/DockedEmacs/home:/mnt/tempmnt\
 deckmacs sh

mv /home/planetraveller/ /mnt/tempmnt
