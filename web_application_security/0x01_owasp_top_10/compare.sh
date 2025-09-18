#!/bin/bash

# Compare stdin with base64-decoded $1
read input

expected=$(echo "$1" | base64 -d)

if [ "$input" = "$expected" ]; then
    echo "ok"
else
    echo "invalid"
fi
