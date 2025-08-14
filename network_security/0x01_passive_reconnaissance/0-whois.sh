#!/bin/bash
whois "$1" | awk -F': ' '
/^Registrant Organization:/ {
  print "Registrant Organization," $2
}
/^Tech Email:/ {
  print "Tech Email," $2
}' > "$1.csv"
