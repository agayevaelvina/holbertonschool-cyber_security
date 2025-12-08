#!/bin/bash
sudo nmap -p 440-450 --open --packet-trace  --reason $1
