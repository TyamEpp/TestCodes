#!/bin/bash

# accept y, Y, yes, YES, Yes, YEs, and so on...

function yes_or_no() {
    read -p "${1} (y/n) "
    REPLY=$(echo ${REPLY} | tr [A-Z] [a-z])
    if [ ${REPLY//yes/y} = "y" ]; then
	return 0
    else
	return 1
    fi
}

if false; then # test
    if yes_or_no "my question"; then
	echo "your answer is yes."
    else
	echo "your answer is no."
    fi
    exit
fi
