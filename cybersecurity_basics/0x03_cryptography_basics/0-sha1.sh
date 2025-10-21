#!/bin/bash
echo -n "$1" | sha1sum | awk '{print $1}' | tee 0_hash.txt
