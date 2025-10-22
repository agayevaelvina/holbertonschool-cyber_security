#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt $1 --format=Raw-SHA256
