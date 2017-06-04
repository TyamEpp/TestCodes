#!/bin/bash

DATE=$(date +%Y%m%d)
SRC=/mnt/storage1/home/
DEST=/mnt/storage2/${DATE}-home-cron/
DEST_TEMP=/mnt/storage2/server/home-temporary/
LOG=/root/rsync-log/${DATE}-home.log

mkdir -p ${DEST_TEMP%/*}
mkdir -p ${LOG%/*}

DEST_OLD=$(basename $(find ${DEST_TEMP}/.. -mindepth 1 -maxdepth 1 -type d -name "*-home-cron" | sort -n | tail -n 1))

RSYNC="nice -n19 ionice -c2 -n7 rsync -av"
#RSYNC="nice -n19 ionice -c2 -n7 rsync -av --dry-run " # for test

echo $(date) start ${BASH_SOURCE##*/}
echo ${RSYNC} \
    --link-dest=../${DEST_OLD} \
    ${SRC} ${DEST_TEMP} \
    1>> ${LOG} 2>&1

${RSYNC} \
    --link-dest=../${DEST_OLD} \
    ${SRC} ${DEST_TEMP} \
    1>> ${LOG} 2>&1

STAT=${?}
if [ ${STAT} -eq 0 ]; then
    echo rsync is completed.
    mv ${DEST_TEMP} ${DEST}
fi

echo $(date) finish
