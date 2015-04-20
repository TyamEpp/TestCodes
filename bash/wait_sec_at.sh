#!/bin/bash

function wait_sec_at () {
    if [ $# -eq 0 ]; then
        return
    fi
    SEC_AT=${1}
    NOW=$(date "+%S")
    if [ ${NOW} == ${SEC_AT} ]; then
	echo "  [debug print]" NOW:${NOW} == SEC_AT:${SEC_AT} ... $(date "+%H:%M:%S") return
	return
    fi
    SleepSec=$(( ${SEC_AT} - ${NOW} ))
    if [ ${SleepSec} -lt 0 ]; then
	SleepSec=$(( ${SleepSec} + 60 ))
    fi
    echo "  [debug print]" NOW:${NOW} != SEC_AT:${SEC_AT}, sleep ${SleepSec}s ... $(date "+%H:%M:%S")
    sleep ${SleepSec}s
    echo "  [debug print]" sleep done ... $(date "+%H:%M:%S")
    return
}

# test code
echo " [test]" date
date
echo " [test]" call wait_sec_at
echo wait_sec_at
echo " [test]" date
date
echo " [test]" call wait_sec_at 15
wait_sec_at 15
echo " [test]" date
date
exit
