#!/bin/bash

if [ $# -eq 0 ]; then
    echo "err"
    return
fi

ffmpeg -i ${1} -ab 160k -ac 1 -ar 16000 ${1%.*}.flac

