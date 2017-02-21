#!/bin/bash

function sleep_until_specified_sec () {
    if [ $# -eq 0 ]; then
	echo "sleep until specified second."
	echo "ex. specify 10 at 12:35:58 -> sleep 12 sec."
	echo "usage: sleep_until_specified_sec second"
        return
    fi
    DATEFORM="+%S.%N"
    if [ `uname` = "Darwin" ]; then
	DATEFORM="+%S"
    fi
    local TARGET=${1}
    local NOW=$(date ${DATEFORM})
    local SleepSec=$( echo ${TARGET} - ${NOW} | bc )
    if [ ${SleepSec} -lt 0 ]; then
	SleepSec=$( echo ${SleepSec} + 60 | bc )
    fi
    #echo "[debug print]" NOW:${NOW}, TARGET:${TARGET}, sleep ${SleepSec}s ... $(date "+%H:%M:%S")
    sleep ${SleepSec}s 
    #echo "[debug print]" sleep done ... $(date "+%H:%M:%S")
    return
}

if false; then # test
    echo "[test]" call date
    date
    echo "[test]" call sleep_until_specified_sec 15
    sleep_until_specified_sec 15
    echo "[test]" call date
    date
    exit
fi
