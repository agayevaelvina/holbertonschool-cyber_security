#!/bin/bash
iptables -A INPUT -p tcp --dport ssh 22 -j ACCEPT
iptables -A OUTPUT -j DROP
