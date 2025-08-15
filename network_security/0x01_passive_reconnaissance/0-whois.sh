#!/bin/bash
whois "$1" | awk 'BEGIN{FS=":";OFS=","} /^Registrant/||/^Admin/||/^Tech/ {section=$1; sub(/[ \t].*/, "", section); key=$1; sub(/^[^:]+:[ \t]*/, "", $0); gsub(/ /,"$", $0); if(!h[section]++){print section key} print section $0}' > "$1.csv"
