#!/bin/bash
whois "$1" | awk -F': ' '/^Registrant Organization:/ || /^Tech Email:/ { print $1 "," $2 }' > "$1.csv"

