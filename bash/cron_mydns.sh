#!/bin/bash

MasterID=hoge
Password=fuga
IPv4Address=$(wget -q -O - ipcheck.ieserver.net)
IPv6Address=
LogFile=/root/mydns_lastupdate.log

date +"%Y/%m/%d %H:%M:%S" > ${LogFile}

if [ -v IPv6Address ]; then
    wget -q -O - "http://www.mydns.jp/directip.html?MID=${MasterID}&PWD=${Password}&IPV4ADDR=${IPv4Address}" >> ${LogFile}
else
    wget -q -O - "http://www.mydns.jp/directip.html?MID=${MasterID}&PWD=${Password}&IPV4ADDR=${IPv4Address}&IPV6ADDR=${IPv6Address}" >> ${LogFile}
fi

