#!/bin/bash

mkdir test
cd test
ln -s /root ./
echo ARCHIVED $(date)
cd ..
tar cvzf test.tar test
rm -r test
sleep 60s
tar xvzf test.tar
echo EXPANDED $(date)
ls -l test
