#!/bin/bash
subfinder -silent -d $1 | while read d; do ip=$(dig +short "$d" | grep -m1 '^[0-9.]\+$'); echo "$d,${ip:-NotResolved}"; done > "$1.txt"
