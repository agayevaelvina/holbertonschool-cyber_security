#!/bin/bash
sudo nmap -xS -p 440-450 --open --packet-trace  --reason $1
