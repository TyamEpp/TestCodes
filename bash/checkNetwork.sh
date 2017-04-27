#!/bin/bash

SHORT=${HOSTNAME%%.*}
DOMAIN=${HOSTNAME#*.}
echo short hostname: ${SHORT}
echo domain: ${DOMAIN}

if echo ${HOSTNAME} | grep -q "hoge.jp"; then
    echo "in hoge.jp"
fi

if [ $(uname) = "Linux" ]; then
    if $(hostname -I) | grep -q "192.168"; then
	echo "in local network."
    fi
fi

IPv4LIST=$(LANG=C /sbin/ifconfig | grep 'inet\ ' | grep -v "127.0.0.1" | tr -dc '0123456789 .\n' | sed -e 's/\s\{1,\}/ /g' -e 's/^ //' | cut -f1 -d' ' | tr '\n' ' ')
echo ${IPv4LIST}

