#!/bin/bash

function sleep_until_sec () {
    if [ $# -eq 0 ]; then
	echo "usage: sleep_until_sec second"
        return
    fi
    local TARGET=${1}
    local NOW=$(date "+%S")
    local SleepSec=$(( ${TARGET} - ${NOW} ))
    if [ ${SleepSec} -lt 0 ]; then
	SleepSec=$(( ${SleepSec} + 60 ))
    fi
    #echo "  [debug print]" NOW:${NOW}, TARGET:${TARGET}, sleep ${SleepSec}s ... $(date "+%H:%M:%S")
    sleep ${SleepSec}s 
    #echo "  [debug print]" sleep done ... $(date "+%H:%M:%S")
    return
}

if false; then # test
    echo " [test]" call date
    date
    echo " [test]" call sleep_until_sec 15
    sleep_until_sec 15
    echo " [test]" call date
    date
    exit
fi
