#!/bin/bash
whois "$1" | awk 'BEGIN{FS=":";OFS=","} /^[RA]dmin|^Registrant|^Tech/ {s=$1; sub(/[ \t].*/, "", s); k=$1; sub(/^[^:]+:[ \t]*/, "", $0); gsub(/ +/, " ", $0); gsub(/^ +| +$/, "", $0); sub(/^ +/, "", k); sub(/^ +| +$/, "", k); if(!h[s k]++){print s" "k,$0}' > "$1".csv
