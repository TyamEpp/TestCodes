#!/bin/bash

if echo "$-" | grep -q "i"; then
    echo "[result] source !"
else
    echo "[result] sh !"
fi
