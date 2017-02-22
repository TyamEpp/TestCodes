#!/bin/bash

if [ $(uname) = "Linux" ]; then
    echo "This is Linux"
fi
if [ $(uname) = "Darwin" ]; then
    echo "This is MacOS"
fi
if [ $(uname) = "FreeBSD" ]; then
    echo "This is FreeBSD"
fi
